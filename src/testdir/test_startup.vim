" Tests for startup.

source shared.vim
source screendump.vim
source term_util.vim
source check.vim

" Check that loading startup.vim works.
func Test_startup_script()
  set compatible
  source $VIMRUNTIME/defaults.vim

  call assert_equal(0, &compatible)
  " Restore some options, so that the following tests doesn't break
  set nomore
  set noshowmode
endfunc

" Verify the order in which plugins are loaded:
" 1. plugins in non-after directories
" 2. packages
" 3. plugins in after directories
func Test_after_comes_later()
  CheckFeature packages
  let before =<< trim [CODE]
    set nocp viminfo+=nviminfo
    set guioptions+=M
    let $HOME = "/does/not/exist"
    set loadplugins
    set rtp=Xhere,Xafter,Xanother
    set packpath=Xhere,Xafter
    set nomore
    let g:sequence = ""
  [CODE]

  let after =<< trim [CODE]
    redir! > Xtestout
    scriptnames
    redir END
    redir! > Xsequence
    echo g:sequence
    redir END
    quit
  [CODE]

  call mkdir('Xhere/plugin', 'p')
  call writefile(['let g:sequence .= "here "'], 'Xhere/plugin/here.vim')
  call mkdir('Xanother/plugin', 'p')
  call writefile(['let g:sequence .= "another "'], 'Xanother/plugin/another.vim')
  call mkdir('Xhere/pack/foo/start/foobar/plugin', 'p')
  call writefile(['let g:sequence .= "pack "'], 'Xhere/pack/foo/start/foobar/plugin/foo.vim')

  call mkdir('Xafter/plugin', 'p')
  call writefile(['let g:sequence .= "after "'], 'Xafter/plugin/later.vim')

  if RunVim(before, after, '')

    let lines = readfile('Xtestout')
    let expected = ['Xbefore.vim', 'here.vim', 'another.vim', 'foo.vim', 'later.vim', 'Xafter.vim']
    let found = []
    for line in lines
      for one in expected
	if line =~ one
	  call add(found, one)
	endif
      endfor
    endfor
    call assert_equal(expected, found)
  endif

  call assert_equal('here another pack after', substitute(join(readfile('Xsequence', 1), ''), '\s\+$', '', ''))

  call delete('Xtestout')
  call delete('Xsequence')
  call delete('Xhere', 'rf')
  call delete('Xanother', 'rf')
  call delete('Xafter', 'rf')
endfunc

func Test_pack_in_rtp_when_plugins_run()
  CheckFeature packages
  let before =<< trim [CODE]
    set nocp viminfo+=nviminfo
    set guioptions+=M
    let $HOME = "/does/not/exist"
    set loadplugins
    set rtp=Xhere
    set packpath=Xhere
    set nomore
  [CODE]

  let after = [
	\ 'quit',
	\ ]
  call mkdir('Xhere/plugin', 'p')
  call writefile(['redir! > Xtestout', 'silent set runtimepath?', 'silent! call foo#Trigger()', 'redir END'], 'Xhere/plugin/here.vim')
  call mkdir('Xhere/pack/foo/start/foobar/autoload', 'p')
  call writefile(['function! foo#Trigger()', 'echo "autoloaded foo"', 'endfunction'], 'Xhere/pack/foo/start/foobar/autoload/foo.vim')

  if RunVim(before, after, '')

    let lines = filter(readfile('Xtestout'), '!empty(v:val)')
    call assert_match('Xhere[/\\]pack[/\\]foo[/\\]start[/\\]foobar', get(lines, 0))
    call assert_match('autoloaded foo', get(lines, 1))
  endif

  call delete('Xtestout')
  call delete('Xhere', 'rf')
endfunc

func Test_help_arg()
  if !has('unix') && has('gui_running')
    throw 'Skipped: does not work with gvim on MS-Windows'
  endif
  if RunVim([], [], '--help >Xtestout')
    let lines = readfile('Xtestout')
    call assert_true(len(lines) > 20)
    call assert_match('Vi IMproved', lines[0])

    " check if  couple of lines are there
    let found = []
    for line in lines
      if line =~ '-R.*Readonly mode'
	call add(found, 'Readonly mode')
      endif
      " Watch out for a second --version line in the Gnome version.
      if line =~ '--version.*Print version information and exit'
	call add(found, "--version")
      endif
    endfor
    call assert_equal(['Readonly mode', '--version'], found)
  endif
  call delete('Xtestout')
endfunc

func Test_compatible_args()
  let after =<< trim [CODE]
    call writefile([string(&compatible)], "Xtestout")
    set viminfo+=nviminfo
    quit
  [CODE]

  if RunVim([], after, '-C')
    let lines = readfile('Xtestout')
    call assert_equal('1', lines[0])
  endif

  if RunVim([], after, '-N')
    let lines = readfile('Xtestout')
    call assert_equal('0', lines[0])
  endif

  call delete('Xtestout')
endfunc

" Test the -o[N] and -O[N] arguments to open N windows split
" horizontally or vertically.
func Test_o_arg()
  let after =<< trim [CODE]
    set cpo&vim
    call writefile([winnr("$"),
		\ winheight(1), winheight(2), &lines,
		\ winwidth(1), winwidth(2), &columns,
		\ bufname(winbufnr(1)), bufname(winbufnr(2))],
		\ "Xtestout")
    qall
  [CODE]

  if RunVim([], after, '-o2')
    " Open 2 windows split horizontally. Expect:
    " - 2 windows
    " - both windows should have the same or almost the same height
    " - sum of both windows height (+ 3 for both statusline and Ex command)
    "   should be equal to the number of lines
    " - both windows should have the same width which should be equal to the
    "   number of columns
    " - buffer of both windows should have no name
    let [wn, wh1, wh2, ln, ww1, ww2, cn, bn1, bn2] = readfile('Xtestout')
    call assert_equal('2', wn)
    call assert_inrange(0, 1, wh1 - wh2)
    call assert_equal(string(wh1 + wh2 + 3), ln)
    call assert_equal(ww1, ww2)
    call assert_equal(ww1, cn)
    call assert_equal('', bn1)
    call assert_equal('', bn2)
  endif

  if RunVim([], after, '-o foo bar')
    " Same expectations as for -o2 but buffer names should be foo and bar
    let [wn, wh1, wh2, ln, ww1, ww2, cn, bn1, bn2] = readfile('Xtestout')
    call assert_equal('2', wn)
    call assert_inrange(0, 1, wh1 - wh2)
    call assert_equal(string(wh1 + wh2 + 3), ln)
    call assert_equal(ww1, ww2)
    call assert_equal(ww1, cn)
    call assert_equal('foo', bn1)
    call assert_equal('bar', bn2)
  endif

  if RunVim([], after, '-O2')
    " Open 2 windows split vertically. Expect:
    " - 2 windows
    " - both windows should have the same or almost the same width
    " - sum of both windows width (+ 1 for the separator) should be equal to
    "   the number of columns
    " - both windows should have the same height
    " - window height (+ 2 for the statusline and Ex command) should be equal
    "   to the number of lines
    " - buffer of both windows should have no name
    let [wn, wh1, wh2, ln, ww1, ww2, cn, bn1, bn2] = readfile('Xtestout')
    call assert_equal('2', wn)
    call assert_inrange(0, 1, ww1 - ww2)
    call assert_equal(string(ww1 + ww2 + 1), cn)
    call assert_equal(wh1, wh2)
    call assert_equal(string(wh1 + 2), ln)
    call assert_equal('', bn1)
    call assert_equal('', bn2)
  endif

  if RunVim([], after, '-O foo bar')
    " Same expectations as for -O2 but buffer names should be foo and bar
    let [wn, wh1, wh2, ln, ww1, ww2, cn, bn1, bn2] = readfile('Xtestout')
    call assert_equal('2', wn)
    call assert_inrange(0, 1, ww1 - ww2)
    call assert_equal(string(ww1 + ww2 + 1), cn)
    call assert_equal(wh1, wh2)
    call assert_equal(string(wh1 + 2), ln)
    call assert_equal('foo', bn1)
    call assert_equal('bar', bn2)
  endif

  call delete('Xtestout')
endfunc

" Test the -p[N] argument to open N tabpages.
func Test_p_arg()
  let after =<< trim [CODE]
    call writefile(split(execute("tabs"), "\n"), "Xtestout")
    qall
  [CODE]

  if RunVim([], after, '-p2')
    let lines = readfile('Xtestout')
    call assert_equal(4, len(lines))
    call assert_equal('Tab page 1',    lines[0])
    call assert_equal('>   [No Name]', lines[1])
    call assert_equal('Tab page 2',    lines[2])
    call assert_equal('    [No Name]', lines[3])
  endif

  if RunVim([], after, '-p foo bar')
    let lines = readfile('Xtestout')
    call assert_equal(4, len(lines))
    call assert_equal('Tab page 1', lines[0])
    call assert_equal('>   foo',    lines[1])
    call assert_equal('Tab page 2', lines[2])
    call assert_equal('    bar',    lines[3])
  endif

  call delete('Xtestout')
endfunc

" Test the -V[N] argument to set the 'verbose' option to [N]
func Test_V_arg()
  " Can't catch the output of gvim.
  CheckNotGui

  let out = system(GetVimCommand() . ' --clean -es -X -V0 -c "set verbose?" -cq')
  call assert_equal("  verbose=0\n", out)

  let out = system(GetVimCommand() . ' --clean -es -X -V2 -c "set verbose?" -cq')
  call assert_match("sourcing \"$VIMRUNTIME[\\/]defaults\.vim\"\r\nline \\d\\+: sourcing \"[^\"]*runtime[\\/]filetype\.vim\".*\n", out)
  call assert_match("  verbose=2\n", out)

  let out = system(GetVimCommand() . ' --clean -es -X -V15 -c "set verbose?" -cq')
   call assert_match("sourcing \"$VIMRUNTIME[\\/]defaults\.vim\"\r\nline 1: \" The default vimrc file\..*  verbose=15\n", out)
endfunc

" Test the '-q [errorfile]' argument.
func Test_q_arg()
  CheckFeature quickfix

  let lines =<< trim END
    /* some file with an error */
    main() {
      functionCall(arg; arg, arg);
      return 666
    }
  END
  call writefile(lines, 'Xbadfile.c')

  let after =<< trim [CODE]
    call writefile([&errorfile, string(getpos("."))], "Xtestout")
    copen
    w >> Xtestout
    qall
  [CODE]

  " Test with default argument '-q'.
  call assert_equal('errors.err', &errorfile)
  call writefile(["Xbadfile.c:4:12: error: expected ';' before '}' token"], 'errors.err')
  if RunVim([], after, '-q')
    let lines = readfile('Xtestout')
    call assert_equal(['errors.err',
	\              '[0, 4, 12, 0]',
	\              "Xbadfile.c|4 col 12| error: expected ';' before '}' token"],
	\             lines)
  endif
  call delete('Xtestout')
  call delete('errors.err')

  " Test with explicit argument '-q Xerrors' (with space).
  call writefile(["Xbadfile.c:4:12: error: expected ';' before '}' token"], 'Xerrors')
  if RunVim([], after, '-q Xerrors')
    let lines = readfile('Xtestout')
    call assert_equal(['Xerrors',
	\              '[0, 4, 12, 0]',
	\              "Xbadfile.c|4 col 12| error: expected ';' before '}' token"],
	\             lines)
  endif
  call delete('Xtestout')

  " Test with explicit argument '-qXerrors' (without space).
  if RunVim([], after, '-qXerrors')
    let lines = readfile('Xtestout')
    call assert_equal(['Xerrors',
	\              '[0, 4, 12, 0]',
	\              "Xbadfile.c|4 col 12| error: expected ';' before '}' token"],
	\             lines)
  endif

  " Test with a non-existing error file (exits with value 3)
  let out = system(GetVimCommand() .. ' -q xyz.err')
  call assert_equal(3, v:shell_error)

  call delete('Xbadfile.c')
  call delete('Xtestout')
  call delete('Xerrors')
endfunc

" Test the -V[N]{filename} argument to set the 'verbose' option to N
" and set 'verbosefile' to filename.
func Test_V_file_arg()
  if RunVim([], [], ' --clean -V2Xverbosefile -c "set verbose? verbosefile?" -cq')
    let out = join(readfile('Xverbosefile'), "\n")
    call assert_match("sourcing \"$VIMRUNTIME[\\/]defaults\.vim\"\n", out)
    call assert_match("\n  verbose=2\n", out)
    call assert_match("\n  verbosefile=Xverbosefile", out)
  endif

  call delete('Xverbosefile')
endfunc

" Test the -m, -M and -R arguments:
" -m resets 'write'
" -M resets 'modifiable' and 'write'
" -R sets 'readonly'
func Test_m_M_R()
  let after =<< trim [CODE]
    call writefile([&write, &modifiable, &readonly, &updatecount], "Xtestout")
    qall
  [CODE]

  if RunVim([], after, '')
    let lines = readfile('Xtestout')
    call assert_equal(['1', '1', '0', '200'], lines)
  endif
  if RunVim([], after, '-m')
    let lines = readfile('Xtestout')
    call assert_equal(['0', '1', '0', '200'], lines)
  endif
  if RunVim([], after, '-M')
    let lines = readfile('Xtestout')
    call assert_equal(['0', '0', '0', '200'], lines)
  endif
  if RunVim([], after, '-R')
    let lines = readfile('Xtestout')
    call assert_equal(['1', '1', '1', '10000'], lines)
  endif

  call delete('Xtestout')
endfunc

" Test the -A, -F and -H arguments (Arabic, Farsi and Hebrew modes).
func Test_A_F_H_arg()
  let after =<< trim [CODE]
    call writefile([&rightleft, &arabic, &fkmap, &hkmap], "Xtestout")
    qall
  [CODE]

  " Use silent Ex mode to avoid the hit-Enter prompt for the warning that
  " 'encoding' is not utf-8.
  if has('arabic') && &encoding == 'utf-8' && RunVim([], after, '-e -s -A')
    let lines = readfile('Xtestout')
    call assert_equal(['1', '1', '0', '0'], lines)
  endif

  if has('farsi') && RunVim([], after, '-F')
    let lines = readfile('Xtestout')
    call assert_equal(['1', '0', '1', '0'], lines)
  endif

  if has('rightleft') && RunVim([], after, '-H')
    let lines = readfile('Xtestout')
    call assert_equal(['1', '0', '0', '1'], lines)
  endif

  call delete('Xtestout')
endfunc

func Test_invalid_args()
  " must be able to get the output of Vim.
  CheckUnix
  CheckNotGui

  for opt in ['-Y', '--does-not-exist']
    let out = split(system(GetVimCommand() .. ' ' .. opt), "\n")
    call assert_equal(1, v:shell_error)
    call assert_match('^VIM - Vi IMproved .* (.*)$',              out[0])
    call assert_equal('Unknown option argument: "' .. opt .. '"', out[1])
    call assert_equal('More info with: "vim -h"',                 out[2])
  endfor

  for opt in ['-c', '-i', '-s', '-t', '-T', '-u', '-U', '-w', '-W', '--cmd', '--startuptime']
    let out = split(system(GetVimCommand() .. ' '  .. opt), "\n")
    call assert_equal(1, v:shell_error)
    call assert_match('^VIM - Vi IMproved .* (.*)$',             out[0])
    call assert_equal('Argument missing after: "' .. opt .. '"', out[1])
    call assert_equal('More info with: "vim -h"',                out[2])
  endfor

  if has('clientserver')
    for opt in ['--remote', '--remote-send', '--remote-silent', '--remote-expr',
          \     '--remote-tab', '--remote-tab-wait',
          \     '--remote-tab-wait-silent', '--remote-tab-silent',
          \     '--remote-wait', '--remote-wait-silent',
          \     '--servername',
          \    ]
      let out = split(system(GetVimCommand() .. ' '  .. opt), "\n")
      call assert_equal(1, v:shell_error)
      call assert_match('^VIM - Vi IMproved .* (.*)$',             out[0])
      call assert_equal('Argument missing after: "' .. opt .. '"', out[1])
      call assert_equal('More info with: "vim -h"',                out[2])
    endfor
  endif

  if has('gui_gtk')
    let out = split(system(GetVimCommand() .. ' --display'), "\n")
    call assert_equal(1, v:shell_error)
    call assert_match('^VIM - Vi IMproved .* (.*)$',         out[0])
    call assert_equal('Argument missing after: "--display"', out[1])
    call assert_equal('More info with: "vim -h"',            out[2])
  endif

  if has('xterm_clipboard')
    let out = split(system(GetVimCommand() .. ' -display'), "\n")
    call assert_equal(1, v:shell_error)
    call assert_match('^VIM - Vi IMproved .* (.*)$',         out[0])
    call assert_equal('Argument missing after: "-display"', out[1])
    call assert_equal('More info with: "vim -h"',            out[2])
  endif

  let out = split(system(GetVimCommand() .. ' -ix'), "\n")
  call assert_equal(1, v:shell_error)
  call assert_match('^VIM - Vi IMproved .* (.*)$',          out[0])
  call assert_equal('Garbage after option argument: "-ix"', out[1])
  call assert_equal('More info with: "vim -h"',             out[2])

  let out = split(system(GetVimCommand() .. ' - xxx'), "\n")
  call assert_equal(1, v:shell_error)
  call assert_match('^VIM - Vi IMproved .* (.*)$',    out[0])
  call assert_equal('Too many edit arguments: "xxx"', out[1])
  call assert_equal('More info with: "vim -h"',       out[2])

  if has('quickfix')
    " Detect invalid repeated arguments '-t foo -t foo", '-q foo -q foo'.
    for opt in ['-t', '-q']
      let out = split(system(GetVimCommand() .. repeat(' ' .. opt .. ' foo', 2)), "\n")
      call assert_equal(1, v:shell_error)
      call assert_match('^VIM - Vi IMproved .* (.*)$',              out[0])
      call assert_equal('Too many edit arguments: "' .. opt .. '"', out[1])
      call assert_equal('More info with: "vim -h"',                 out[2])
    endfor
  endif

  for opt in [' -cq', ' --cmd q', ' +', ' -S foo']
    let out = split(system(GetVimCommand() .. repeat(opt, 11)), "\n")
    call assert_equal(1, v:shell_error)
    " FIXME: The error message given by Vim is not ideal in case of repeated
    " -S foo since it does not mention -S.
    call assert_match('^VIM - Vi IMproved .* (.*)$',                                    out[0])
    call assert_equal('Too many "+command", "-c command" or "--cmd command" arguments', out[1])
    call assert_equal('More info with: "vim -h"',                                       out[2])
  endfor

  if has('gui_gtk')
    for opt in ['--socketid x', '--socketid 0xg']
      let out = split(system(GetVimCommand() .. ' ' .. opt), "\n")
      call assert_equal(1, v:shell_error)
      call assert_match('^VIM - Vi IMproved .* (.*)$',        out[0])
      call assert_equal('Invalid argument for: "--socketid"', out[1])
      call assert_equal('More info with: "vim -h"',           out[2])
    endfor
  endif
endfunc

func Test_file_args()
  let after =<< trim [CODE]
    call writefile(argv(), "Xtestout")
    qall
  [CODE]

  if RunVim([], after, '')
    let lines = readfile('Xtestout')
    call assert_equal(0, len(lines))
  endif

  if RunVim([], after, 'one')
    let lines = readfile('Xtestout')
    call assert_equal(1, len(lines))
    call assert_equal('one', lines[0])
  endif

  if RunVim([], after, 'one two three')
    let lines = readfile('Xtestout')
    call assert_equal(3, len(lines))
    call assert_equal('one', lines[0])
    call assert_equal('two', lines[1])
    call assert_equal('three', lines[2])
  endif

  if RunVim([], after, 'one -c echo two')
    let lines = readfile('Xtestout')
    call assert_equal(2, len(lines))
    call assert_equal('one', lines[0])
    call assert_equal('two', lines[1])
  endif

  if RunVim([], after, 'one -- -c echo two')
    let lines = readfile('Xtestout')
    call assert_equal(4, len(lines))
    call assert_equal('one', lines[0])
    call assert_equal('-c', lines[1])
    call assert_equal('echo', lines[2])
    call assert_equal('two', lines[3])
  endif

  call delete('Xtestout')
endfunc

func Test_startuptime()
  CheckFeature startuptime
  let after = ['qall']
  if RunVim([], after, '--startuptime Xtestout one')
    let lines = readfile('Xtestout')
    let expected = ['--- VIM STARTING ---', 'parsing arguments',
	  \ 'shell init', 'inits 3', 'start termcap', 'opening buffers']
    let found = []
    for line in lines
      for exp in expected
	if line =~ exp
	  call add(found, exp)
	endif
      endfor
    endfor
    call assert_equal(expected, found)
  endif
  call delete('Xtestout')
endfunc

func Test_read_stdin()
  let after =<< trim [CODE]
    write Xtestout
    quit!
  [CODE]

  if RunVimPiped([], after, '-', 'echo something | ')
    let lines = readfile('Xtestout')
    " MS-Windows adds a space after the word
    call assert_equal(['something'], split(lines[0]))
  endif
  call delete('Xtestout')
endfunc

func Test_set_shell()
  let after =<< trim [CODE]
    call writefile([&shell], "Xtestout")
    quit!
  [CODE]

  if has('win32')
    let $SHELL = 'C:\with space\cmd.exe'
    let expected = '"C:\with space\cmd.exe"'
  else
    let $SHELL = '/bin/with space/sh'
    let expected = '/bin/with\ space/sh'
  endif

  if RunVimPiped([], after, '', '')
    let lines = readfile('Xtestout')
    call assert_equal(expected, lines[0])
  endif
  call delete('Xtestout')
endfunc

func Test_progpath()
  " Tests normally run with "./vim" or "../vim", these must have been expanded
  " to a full path.
  if has('unix')
    call assert_equal('/', v:progpath[0])
  elseif has('win32')
    call assert_equal(':', v:progpath[1])
    call assert_match('[/\\]', v:progpath[2])
  endif

  " Only expect "vim" to appear in v:progname.
  call assert_match('vim\c', v:progname)
endfunc

func Test_silent_ex_mode()
  " must be able to get the output of Vim.
  CheckUnix
  CheckNotGui

  " This caused an ml_get error.
  let out = system(GetVimCommand() . '-u NONE -es -c''set verbose=1|h|exe "%norm\<c-y>\<c-d>"'' -c cq')
  call assert_notmatch('E315:', out)
endfunc

func Test_default_term()
  " must be able to get the output of Vim.
  CheckUnix
  CheckNotGui

  let save_term = $TERM
  let $TERM = 'unknownxxx'
  let out = system(GetVimCommand() . ' -c''set term'' -c cq')
  call assert_match("defaulting to 'ansi'", out)
  let $TERM = save_term
endfunc

func Test_zzz_startinsert()
  " Test :startinsert
  call writefile(['123456'], 'Xtestout')
  let after =<< trim [CODE]
    :startinsert
    call feedkeys("foobar\<c-o>:wq\<cr>","t")
  [CODE]

  if RunVim([], after, 'Xtestout')
    let lines = readfile('Xtestout')
    call assert_equal(['foobar123456'], lines)
  endif
  " Test :startinsert!
  call writefile(['123456'], 'Xtestout')
  let after =<< trim [CODE]
    :startinsert!
    call feedkeys("foobar\<c-o>:wq\<cr>","t")
  [CODE]

  if RunVim([], after, 'Xtestout')
    let lines = readfile('Xtestout')
    call assert_equal(['123456foobar'], lines)
  endif
  call delete('Xtestout')
endfunc

func Test_issue_3969()
  " Can't catch the output of gvim.
  CheckNotGui

  " Check that message is not truncated.
  let out = system(GetVimCommand() . ' -es -X -V1 -c "echon ''hello''" -cq')
  call assert_equal('hello', out)
endfunc

func Test_start_with_tabs()
  CheckRunVimInTerminal

  let buf = RunVimInTerminal('-p a b c', {})
  call VerifyScreenDump(buf, 'Test_start_with_tabs', {})

  " clean up
  call StopVimInTerminal(buf)
endfunc

func Test_v_argv()
  " Can't catch the output of gvim.
  CheckNotGui

  let out = system(GetVimCommand() . ' -es -V1 -X arg1 --cmd "echo v:argv" --cmd q')
  let list = out->split("', '")
  call assert_match('vim', list[0])
  let idx = index(list, 'arg1')
  call assert_true(idx > 2)
  call assert_equal(['arg1', '--cmd', 'echo v:argv', '--cmd', 'q'']'], list[idx:])
endfunc

" Test for the "-r" recovery mode option
func Test_r_arg()
  " Can't catch the output of gvim.
  CheckNotGui
  CheckUnix
  CheckEnglish
  let cmd = GetVimCommand()
  " There can be swap files anywhere, only check for the headers.
  let expected =<< trim END
    Swap files found:.*
    In current directory:.*
    In directory \~/tmp:.*
    In directory /var/tmp:.*
    In directory /tmp:.*
  END
  call assert_match(join(expected, ""), system(cmd .. " -r")->substitute("[\r\n]\\+", '', ''))
endfunc

" Test for the '-t' option to jump to a tag
func Test_t_arg()
  let before =<< trim [CODE]
    set tags=Xtags
  [CODE]
  let after =<< trim [CODE]
    let s = bufname('') .. ':L' .. line('.') .. 'C' .. col('.')
    call writefile([s], "Xtestout")
    qall
  [CODE]

  call writefile(["!_TAG_FILE_ENCODING\tutf-8\t//",
        \ "first\tXfile1\t/^    \\zsfirst$/",
        \ "second\tXfile1\t/^    \\zssecond$/",
        \ "third\tXfile1\t/^    \\zsthird$/"],
        \ 'Xtags')
  call writefile(['    first', '    second', '    third'], 'Xfile1')

  if RunVim(before, after, '-t second')
    call assert_equal(['Xfile1:L2C5'], readfile('Xtestout'))
    call delete('Xtestout')
  endif

  call delete('Xtags')
  call delete('Xfile1')
endfunc

" Test for entering the insert mode on startup
func Test_start_insertmode()
  let before =<< trim [CODE]
    set insertmode
  [CODE]
  let after =<< trim [CODE]
    call writefile(['insertmode=' .. &insertmode], 'Xtestout')
    qall
  [CODE]
  if RunVim(before, after, '')
    call assert_equal(['insertmode=1'], readfile('Xtestout'))
    call delete('Xtestout')
  endif
endfunc

" Test for enabling the binary mode on startup
func Test_b_arg()
  let after =<< trim [CODE]
    call writefile(['binary=' .. &binary], 'Xtestout')
    qall
  [CODE]
  if RunVim([], after, '-b')
    call assert_equal(['binary=1'], readfile('Xtestout'))
    call delete('Xtestout')
  endif
endfunc

" Test for enabling the lisp mode on startup
func Test_l_arg()
  let after =<< trim [CODE]
    let s = 'lisp=' .. &lisp .. ', showmatch=' .. &showmatch
    call writefile([s], 'Xtestout')
    qall
  [CODE]
  if RunVim([], after, '-l')
    call assert_equal(['lisp=1, showmatch=1'], readfile('Xtestout'))
    call delete('Xtestout')
  endif
endfunc

" Test for specifying a non-existing vimrc file using "-u"
func Test_missing_vimrc()
  CheckRunVimInTerminal
  let after =<< trim [CODE]
    call assert_match('^E282:', v:errmsg)
    call writefile(v:errors, 'Xtestout')
  [CODE]
  call writefile(after, 'Xafter')

  let cmd = GetVimCommandCleanTerm() . ' -u Xvimrc_missing -S Xafter'
  let buf = term_start(cmd, {'term_rows' : 10})
  call WaitForAssert({-> assert_equal("running", term_getstatus(buf))})
  call TermWait(buf)
  call term_sendkeys(buf, "\n:")
  call TermWait(buf)
  call WaitForAssert({-> assert_match(':', term_getline(buf, 10))})
  call StopVimInTerminal(buf)
  call assert_equal([], readfile('Xtestout'))
  call delete('Xafter')
  call delete('Xtestout')
endfunc

" Test for using the $VIMINIT environment variable
func Test_VIMINIT()
  let after =<< trim [CODE]
    call assert_equal(1, exists('viminit_found'))
    call assert_equal('yes', viminit_found)
    call writefile(v:errors, 'Xtestout')
    qall
  [CODE]
  call writefile(after, 'Xafter')
  let cmd = GetVimProg() . ' --not-a-term -S Xafter --cmd "set enc=utf8"'
  call setenv('VIMINIT', 'let viminit_found="yes"')
  exe "silent !" . cmd
  call assert_equal([], readfile('Xtestout'))
  call delete('Xtestout')
  call delete('Xafter')
endfunc

" Test for using the $EXINIT environment variable
func Test_EXINIT()
  let after =<< trim [CODE]
    call assert_equal(1, exists('exinit_found'))
    call assert_equal('yes', exinit_found)
    call writefile(v:errors, 'Xtestout')
    qall
  [CODE]
  call writefile(after, 'Xafter')
  let cmd = GetVimProg() . ' --not-a-term -S Xafter --cmd "set enc=utf8"'
  call setenv('EXINIT', 'let exinit_found="yes"')
  exe "silent !" . cmd
  call assert_equal([], readfile('Xtestout'))
  call delete('Xtestout')
  call delete('Xafter')
endfunc

" Test for using the 'exrc' option
func Test_exrc()
  let after =<< trim [CODE]
    call assert_equal(1, &exrc)
    call assert_equal(1, &secure)
    call assert_equal(37, exrc_found)
    call writefile(v:errors, 'Xtestout')
    qall
  [CODE]
  call mkdir('Xdir')
  call writefile(['let exrc_found=37'], 'Xdir/.exrc')
  call writefile(after, 'Xdir/Xafter')
  let cmd = GetVimProg() . ' --not-a-term -S Xafter --cmd "cd Xdir" --cmd "set enc=utf8 exrc secure"'
  exe "silent !" . cmd
  call assert_equal([], readfile('Xdir/Xtestout'))
  call delete('Xdir', 'rf')
endfunc

" Test for starting Vim with a non-terminal as input/output
func Test_io_not_a_terminal()
  " Can't catch the output of gvim.
  CheckNotGui
  CheckUnix
  CheckEnglish
  let l = systemlist(GetVimProg() .. ' --ttyfail')
  call assert_equal(['Vim: Warning: Output is not to a terminal',
        \ 'Vim: Warning: Input is not from a terminal'], l)
endfunc

" Test for the "-w scriptout" argument
func Test_w_arg()
  " Can't catch the output of gvim.
  CheckNotGui
  call writefile(["iVim Editor\<Esc>:q!\<CR>"], 'Xscriptin', 'b')
  if RunVim([], [], '-s Xscriptin -w Xscriptout')
    call assert_equal(["iVim Editor\e:q!\r"], readfile('Xscriptout'))
    call delete('Xscriptout')
  endif
  call delete('Xscriptin')

  " Test for failing to open the script output file. This test works only when
  " the language is English.
  if v:lang == "C" || v:lang =~ '^[Ee]n'
    call mkdir("Xdir")
    let m = system(GetVimCommand() .. " -w Xdir")
    call assert_equal("Cannot open for script output: \"Xdir\"\n", m)
    call delete("Xdir", 'rf')
  endif
endfunc

" Test for the "-s scriptin" argument
func Test_s_arg()
  " Can't catch the output of gvim.
  CheckNotGui
  CheckEnglish
  " Test for failing to open the script input file.
  let m = system(GetVimCommand() .. " -s abcxyz")
  call assert_equal("Cannot open for reading: \"abcxyz\"\n", m)

  call writefile([], 'Xinput')
  let m = system(GetVimCommand() .. " -s Xinput -s Xinput")
  call assert_equal("Attempt to open script file again: \"-s Xinput\"\n", m)
  call delete('Xinput')
endfunc

" Test for the "-n" (no swap file) argument
func Test_n_arg()
  let after =<< trim [CODE]
    call assert_equal(0, &updatecount)
    call writefile(v:errors, 'Xtestout')
    qall
  [CODE]
  if RunVim([], after, '-n')
    call assert_equal([], readfile('Xtestout'))
    call delete('Xtestout')
  endif
endfunc

" Test for the "-h" (help) argument
func Test_h_arg()
  " Can't catch the output of gvim.
  CheckNotGui
  let l = systemlist(GetVimProg() .. ' -h')
  call assert_match('^VIM - Vi IMproved', l[0])
  let l = systemlist(GetVimProg() .. ' -?')
  call assert_match('^VIM - Vi IMproved', l[0])
endfunc

" Test for the "-F" (farsi) argument
func Test_F_arg()
  " Can't catch the output of gvim.
  CheckNotGui
  let l = systemlist(GetVimProg() .. ' -F')
  call assert_match('^E27:', l[0])
endfunc

" Test for the "-E" (improved Ex mode) argument
func Test_E_arg()
  let after =<< trim [CODE]
    call assert_equal('cv', mode(1))
    call writefile(v:errors, 'Xtestout')
    qall
  [CODE]
  if RunVim([], after, '-E')
    call assert_equal([], readfile('Xtestout'))
    call delete('Xtestout')
  endif
endfunc

" Test for too many edit argument errors
func Test_too_many_edit_args()
  " Can't catch the output of gvim.
  CheckNotGui
  CheckEnglish
  let l = systemlist(GetVimProg() .. ' - -')
  call assert_match('^Too many edit arguments: "-"', l[1])
endfunc

" vim: shiftwidth=2 sts=2 expandtab
