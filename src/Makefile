CC=gcc

srcdir = .
VIMNAME = vim

CC		= gcc
DEFS		= -DHAVE_CONFIG_H
CFLAGS		= -g -O2 -D_REENTRANT  -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1
CPPFLAGS	= 
srcdir		= .

LDFLAGS		=  -L/usr/local/lib -Wl,--as-needed
LIBS		= -lm -ltinfo -lelf  -lselinux -lcanberra 
TAGPRG		= ctags -t

CPP		= gcc -E
CPP_MM		= M
DEPEND_CFLAGS_FILTER = | sed 's+-I */+-isystem /+g'
LINK_AS_NEEDED	= yes
X_CFLAGS	=  
X_LIBS_DIR	=  
X_PRE_LIBS	=  -lSM -lICE -lXpm
X_EXTRA_LIBS	=  -lXdmcp -lSM -lICE -ldl
X_LIBS		= -lXt -lX11

NETBEANS_SRC	= netbeans.c
NETBEANS_OBJ	= objects/netbeans.o
CHANNEL_SRC	= job.c channel.c
CHANNEL_OBJ	= objects/job.o objects/channel.o
TERM_SRC	= libvterm/src/encoding.c libvterm/src/keyboard.c libvterm/src/mouse.c libvterm/src/parser.c libvterm/src/pen.c libvterm/src/creen.c libvterm/src/state.c libvterm/src/unicode.c libvterm/src/vterm.c
TERM_OBJ	= objects/vterm_encoding.o objects/vterm_keyboard.o objects/vterm_mouse.o objects/vterm_parser.o objects/vterm_pen.o objects/vterm_screen.o objects/vterm_state.o objects/vterm_unicode.o objects/vterm_vterm.o
TERM_TEST	= test_libvterm

### sed command to fix quotes while creating pathdef.c
QUOTESED        = sed -e 's/[\\"]/\\&/g' -e 's/\\"/"/' -e 's/\\";$$/";/'

### Line break character as octal number for "tr"
NL		= "\\012"

### Top directory for everything
prefix		= /usr/local

### Top directory for the binary
exec_prefix	= ${prefix}

### Prefix for location of data files
BINDIR		= ${exec_prefix}/bin

### For autoconf 2.60 and later (avoid a warning)
datarootdir	= ${prefix}/share

### Prefix for location of data files
DATADIR		= ${datarootdir}

### Prefix for location of man pages
MANDIR		= ${datarootdir}/man

### Do we have a GUI
GUI_INC_LOC	= 
GUI_LIB_LOC	= 
GUI_SRC		= $(ATHENA_SRC)
GUI_OBJ		= $(ATHENA_OBJ)
GUI_DEFS	= $(ATHENA_DEFS)
GUI_IPATH	= $(ATHENA_IPATH)
GUI_LIBS_DIR	= $(ATHENA_LIBS_DIR)
GUI_LIBS1	= $(ATHENA_LIBS1)
GUI_LIBS2	= $(ATHENA_LIBS2)
GUI_INSTALL	= $(ATHENA_INSTALL)
GUI_TARGETS	= $(ATHENA_TARGETS)
GUI_MAN_TARGETS	= $(ATHENA_MAN_TARGETS)
GUI_TESTTARGET	= $(ATHENA_TESTTARGET)
GUI_TESTARG	= $(ATHENA_TESTARG)
GUI_BUNDLE	= $(ATHENA_BUNDLE)
NARROW_PROTO	= 
GUI_X_LIBS	= -lXmu -lXext
MOTIF_LIBNAME	= 
GTK_LIBNAME	= 

GLIB_COMPILE_RESOURCES = 
GRESOURCE_SRC = 
GRESOURCE_OBJ = 

GTK_UPDATE_ICON_CACHE = 
UPDATE_DESKTOP_DATABASE = 

### Any OS dependent extra source and object file
OS_EXTRA_SRC	= 
OS_EXTRA_OBJ	= 

### If the *.po files are to be translated to *.mo files.
MAKEMO		= yes

MSGFMT		= msgfmt
MSGFMT_DESKTOP	= gvim.desktop vim.desktop

### set if $SOURCE_DATE_EPOCH was set when running configure
BUILD_DATE_MSG	= 


# Make sure that "make first" will run "make all" once configure has done its
# work.  This is needed when using the Makefile in the top directory.
first: all


CClink = $(CC)


AUTOCONF = autoconf

LINT = lint
LINT_OPTIONS = -beprxzF
PROFILE_CFLAGS=-g -O0 

SANITIZER_LIBS = $(SANITIZER_CFLAGS)

### Names of the programs and targets  {{{1
VIMTARGET	= $(VIMNAME)$(EXEEXT)

### Names of the tools that are also made  {{{1
TOOLS = xxd/xxd$(EXEEXT)

DESTDIR  = ~/pkg/vim

### Vim version (adjusted by a script)
VIMMAJOR = 8
VIMMINOR = 2

### Location of Vim files (should not need to be changed, and  {{{1
### some things might not work when they are changed!)
VIMDIR = /vim
VIMRTDIR = /vim$(VIMMAJOR)$(VIMMINOR)
HELPSUBDIR = /doc
COLSUBDIR = /colors
SYNSUBDIR = /syntax
INDSUBDIR = /indent
AUTOSUBDIR = /autoload
PLUGSUBDIR = /plugin
FTPLUGSUBDIR = /ftplugin
LANGSUBDIR = /lang
COMPSUBDIR = /compiler
KMAPSUBDIR = /keymap
MACROSUBDIR = /macros
PACKSUBDIR = /pack
TOOLSSUBDIR = /tools
TUTORSUBDIR = /tutor
SPELLSUBDIR = /spell
PRINTSUBDIR = /print
PODIR = po

LIBS=-lpangocairo-1.0 -lpango-1.0 -lharfbuzz -latk-1.0 \
	 -lcairo-gobject -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 \
	 -lgobject-2.0 -lglib-2.0  -lSM -lICE -lXpm -lXt -lX11 \
	 -lXdmcp -lSM -lICE  -lm -ltinfo  -lselinux -lcanberra

### Name of the defaults/evim/mswin file target.
VIM_DEFAULTS_FILE = $(DESTDIR)$(SCRIPTLOC)/defaults.vim
EVIM_FILE	= $(DESTDIR)$(SCRIPTLOC)/evim.vim
MSWIN_FILE	= $(DESTDIR)$(SCRIPTLOC)/mswin.vim

### Name of the menu file target.
SYS_MENU_FILE	= $(DESTDIR)$(SCRIPTLOC)/menu.vim
SYS_SYNMENU_FILE = $(DESTDIR)$(SCRIPTLOC)/synmenu.vim
SYS_DELMENU_FILE = $(DESTDIR)$(SCRIPTLOC)/delmenu.vim

### Name of the bugreport file target.
SYS_BUGR_FILE	= $(DESTDIR)$(SCRIPTLOC)/bugreport.vim

### Name of the rgb.txt file target.
SYS_RGB_FILE   = $(DESTDIR)$(SCRIPTLOC)/rgb.txt

### Name of the file type detection file target.
SYS_FILETYPE_FILE = $(DESTDIR)$(SCRIPTLOC)/filetype.vim

### Name of the file type detection file target.
SYS_FTOFF_FILE	= $(DESTDIR)$(SCRIPTLOC)/ftoff.vim

### Name of the file type detection script file target.
SYS_SCRIPTS_FILE = $(DESTDIR)$(SCRIPTLOC)/scripts.vim

### Name of the ftplugin-on file target.
SYS_FTPLUGIN_FILE = $(DESTDIR)$(SCRIPTLOC)/ftplugin.vim

### Name of the ftplugin-off file target.
SYS_FTPLUGOF_FILE = $(DESTDIR)$(SCRIPTLOC)/ftplugof.vim

### Name of the indent-on file target.
SYS_INDENT_FILE = $(DESTDIR)$(SCRIPTLOC)/indent.vim

### Name of the indent-off file target.
SYS_INDOFF_FILE = $(DESTDIR)$(SCRIPTLOC)/indoff.vim

### Name of the option window script file target.
SYS_OPTWIN_FILE = $(DESTDIR)$(SCRIPTLOC)/optwin.vim

# Program to install the program in the target directory.  Could also be "mv".
INSTALL_PROG	= cp

# Program to install the data in the target directory.	Cannot be "mv"!
INSTALL_DATA	= cp
INSTALL_DATA_R	= cp -r

# Where to copy the script files from (menu, bugreport)
SCRIPTSOURCE = ../runtime


TERM_DEPS = \
	libvterm/include/vterm.h \
	libvterm/include/vterm_keycodes.h \
	libvterm/src/rect.h \
	libvterm/src/utf8.h \
	libvterm/src/vterm_internal.h

TERM_SRC = libvterm/src/*.c

XDIFF_SRC = \
	xdiff/xdiffi.c \
	xdiff/xemit.c \
	xdiff/xprepare.c \
	xdiff/xutils.c \
	xdiff/xhistogram.c \
	xdiff/xpatience.c \

XDIFF_OBJS = \
	objects/xdiffi.o \
	objects/xemit.o \
	objects/xprepare.o \
	objects/xutils.o \
	objects/xhistogram.o \
	objects/xpatience.o \

XDIFF_INCL = \
	xdiff/xdiff.h \
	xdiff/xdiffi.h \
	xdiff/xemit.h \
	xdiff/xinclude.h \
	xdiff/xmacros.h \
	xdiff/xprepare.h \
	xdiff/xtypes.h \
	xdiff/xutils.h \

### Command to create dependencies based on #include "..."
### prototype headers are ignored due to -DPROTO, system
### headers #include <...> are ignored if we use the -MM option, as
### e.g. provided by gcc-cpp.
### Include FEAT_GUI to get dependency on gui.h
### Need to change "-I /<path>" to "-isystem /<path>" for GCC 3.x.
CPP_DEPEND = $(CC) -I$(srcdir) -M$(CPP_MM) \
		`echo "$(DEPEND_CFLAGS)" $(DEPEND_CFLAGS_FILTER)`

NO_ATTR=
#
PROTO_FLAGS = -d -E"$(CPP)" $(NO_ATTR)


################################################
##   no changes required below this line      ##
################################################

SHELL = /bin/sh

# We would normally use "mkdir -p" but it doesn't work properly everywhere.
# Using AC_PROG_MKDIR_P in configure.ac has a problem with the "auto"
# directory.  Always use the install-sh script, it's slower but reliable.
MKDIR_P = $(SHELL) install-sh -c -d

.SUFFIXES:
.SUFFIXES: .c .o .pro

VTERM_CFLAGS = -Ilibvterm/include

PRE_DEFS = -Iproto $(DEFS) $(GUI_DEFS) $(GUI_IPATH) $(CPPFLAGS) $(EXTRA_IPATHS)
POST_DEFS = $(X_CFLAGS) $(MZSCHEME_CFLAGS) $(EXTRA_DEFS)

ALL_CFLAGS = $(PRE_DEFS) $(CFLAGS) $(PROFILE_CFLAGS) $(SANITIZER_CFLAGS) $(LEAK_CFLAGS) $(ABORT_CFLAGS) $(POST_DEFS)

OSDEF_CFLAGS = $(PRE_DEFS) $(POST_DEFS)

LINT_CFLAGS = -DLINT -I. $(PRE_DEFS) $(POST_DEFS) \
	      $(RUBY_CFLAGS) $(LUA_CFLAGS) $(PERL_CFLAGS) $(PYTHON_CFLAGS) \
	      $(PYTHON3_CFLAGS) $(TCL_CFLAGS) $(VTERM_CFLAGS) \
	      -Dinline= -D__extension__= -Dalloca=alloca

LINT_EXTRA = -D"__attribute__(x)="

DEPEND_CFLAGS = -DPROTO -DDEPEND -DFEAT_GUI $(LINT_CFLAGS)


# stuff common to all systems
include Make_all.mak

# get the list of tests
include testdir/Make_all.mak

#	     BASIC_SRC: files that are always used
#	       GUI_SRC: extra GUI files for current configuration
#	   ALL_GUI_SRC: all GUI files for Unix
#
#		   SRC: files used for current configuration
#	       ALL_SRC: source files used for make depend and make lint

BASIC_SRC = \
	arabic.c \
	arglist.c \
	autocmd.c \
	beval.c \
	blob.c \
	blowfish.c \
	buffer.c \
	change.c \
	charset.c \
	cindent.c \
	clientserver.c \
	clipboard.c \
	cmdexpand.c \
	cmdhist.c \
	crypt.c \
	crypt_zip.c \
	debugger.c \
	dict.c \
	diff.c \
	digraph.c \
	drawline.c \
	drawscreen.c \
	edit.c \
	eval.c \
	evalbuffer.c \
	evalfunc.c \
	evalvars.c \
	evalwindow.c \
	ex_cmds.c \
	ex_cmds2.c \
	ex_docmd.c \
	ex_eval.c \
	ex_getln.c \
	fileio.c \
	filepath.c \
	findfile.c \
	fold.c \
	getchar.c \
	hardcopy.c \
	hashtab.c \
	help.c \
	highlight.c \
	indent.c \
	insexpand.c \
	json.c \
	list.c \
	locale.c \
	main.c \
	map.c \
	mark.c \
	match.c \
	mbyte.c \
	memfile.c \
	memline.c \
	menu.c \
	message.c \
	misc1.c \
	misc2.c \
	mouse.c \
	move.c \
	normal.c \
	ops.c \
	option.c \
	optionstr.c \
	os_unix.c \
	auto/pathdef.c \
	popupmenu.c \
	popupwin.c \
	profiler.c \
	pty.c \
	quickfix.c \
	regexp.c \
	register.c \
	screen.c \
	scriptfile.c \
	search.c \
	session.c \
	sha256.c \
	sign.c \
	sound.c \
	spell.c \
	spellfile.c \
	spellsuggest.c \
	syntax.c \
	tag.c \
	term.c \
	terminal.c \
	testing.c \
	textformat.c \
	textobject.c \
	textprop.c \
	time.c \
	typval.c \
	ui.c \
	undo.c \
	usercmd.c \
	userfunc.c \
	version.c \
	vim9compile.c \
	vim9execute.c \
	vim9script.c \
	vim9type.c \
	viminfo.c \
	window.c \
	bufwrite.c \

SRC =	$(BASIC_SRC) \
	$(TERM_SRC) \
	$(XDIFF_SRC) \



UNITTEST_SRC = $(JSON_TEST_SRC) $(KWORD_TEST_SRC) $(MEMFILE_TEST_SRC) $(MESSAGE_TEST_SRC)
UNITTEST_TARGETS = $(JSON_TEST_TARGET) $(KWORD_TEST_TARGET) $(MEMFILE_TEST_TARGET) $(MESSAGE_TEST_TARGET)
RUN_UNITTESTS = run_json_test run_kword_test run_memfile_test run_message_test

# All sources, also the ones that are not configured
ALL_LOCAL_SRC = $(BASIC_SRC) $(ALL_GUI_SRC) $(UNITTEST_SRC) $(EXTRA_SRC)
ALL_SRC = $(ALL_LOCAL_SRC) $(TERM_SRC) $(XDIFF_SRC)

OBJ_COMMON = \
	objects/arabic.o \
	objects/arglist.o \
	objects/autocmd.o \
	objects/beval.o \
	objects/buffer.o \
	objects/change.o \
	objects/blob.o \
	objects/blowfish.o \
	objects/cindent.o \
	objects/clientserver.o \
	objects/clipboard.o \
	objects/cmdexpand.o \
	objects/cmdhist.o \
	objects/crypt.o \
	objects/crypt_zip.o \
	objects/debugger.o \
	objects/dict.o \
	objects/diff.o \
	objects/digraph.o \
	objects/drawline.o \
	objects/drawscreen.o \
	objects/edit.o \
	objects/eval.o \
	objects/evalbuffer.o \
	objects/evalfunc.o \
	objects/evalvars.o \
	objects/evalwindow.o \
	objects/ex_cmds.o \
	objects/ex_cmds2.o \
	objects/ex_docmd.o \
	objects/ex_eval.o \
	objects/ex_getln.o \
	objects/fileio.o \
	objects/filepath.o \
	objects/findfile.o \
	objects/fold.o \
	objects/getchar.o \
	objects/hardcopy.o \
	objects/hashtab.o \
	objects/help.o \
	objects/highlight.o \
	objects/indent.o \
	objects/insexpand.o \
	objects/list.o \
	objects/locale.o \
	objects/map.o \
	objects/mark.o \
	objects/match.o \
	objects/mbyte.o \
	objects/memline.o \
	objects/menu.o \
	objects/misc1.o \
	objects/misc2.o \
	objects/mouse.o \
	objects/move.o \
	objects/normal.o \
	objects/ops.o \
	objects/option.o \
	objects/optionstr.o \
	objects/os_unix.o \
	objects/pathdef.o \
	objects/popupmenu.o \
	objects/popupwin.o \
	objects/profiler.o \
	objects/pty.o \
	objects/quickfix.o \
	objects/regexp.o \
	objects/register.o \
	objects/screen.o \
	objects/scriptfile.o \
	objects/search.o \
	objects/session.o \
	objects/sha256.o \
	objects/sign.o \
	objects/sound.o \
	objects/spell.o \
	objects/spellfile.o \
	objects/spellsuggest.o \
	objects/syntax.o \
	objects/tag.o \
	objects/term.o \
	objects/terminal.o \
	objects/testing.o \
	objects/textformat.o \
	objects/textobject.o \
	objects/textprop.o \
	objects/time.o \
	objects/typval.o \
	objects/ui.o \
	objects/undo.o \
	objects/usercmd.o \
	objects/userfunc.o \
	objects/version.o \
 	objects/vim9compile.o \
 	objects/vim9execute.o \
 	objects/vim9script.o \
 	objects/vim9type.o \
	objects/viminfo.o \
	objects/window.o \
	objects/bufwrite.o \
	$(TERM_OBJ) \
	$(CHANNEL_OBJ) \
	$(XDIFF_OBJS)

# The files included by tests are not in OBJ_COMMON.
OBJ_MAIN = \
	objects/charset.o \
	objects/json.o \
	objects/main.o \
	objects/memfile.o \
	objects/message.o

OBJ = $(OBJ_COMMON) $(OBJ_MAIN)

OBJ_JSON_TEST = \
	objects/charset.o \
	objects/memfile.o \
	objects/message.o \
	objects/json_test.o

JSON_TEST_OBJ = $(OBJ_COMMON) $(OBJ_JSON_TEST)

OBJ_KWORD_TEST = \
	objects/json.o \
	objects/memfile.o \
	objects/message.o \
	objects/kword_test.o

KWORD_TEST_OBJ = $(OBJ_COMMON) $(OBJ_KWORD_TEST)

OBJ_MEMFILE_TEST = \
	objects/charset.o \
	objects/json.o \
	objects/message.o \
	objects/memfile_test.o

MEMFILE_TEST_OBJ = $(OBJ_COMMON) $(OBJ_MEMFILE_TEST)

OBJ_MESSAGE_TEST = \
	objects/charset.o \
	objects/json.o \
	objects/memfile.o \
	objects/message_test.o

MESSAGE_TEST_OBJ = $(OBJ_COMMON) $(OBJ_MESSAGE_TEST)

ALL_OBJ = $(OBJ_COMMON) \
	  $(OBJ_MAIN) \
	  $(OBJ_JSON_TEST) \
	  $(OBJ_KWORD_TEST) \
	  $(OBJ_MEMFILE_TEST) \
	  $(OBJ_MESSAGE_TEST)


PRO_AUTO = \
	arabic.pro \
	arglist.pro \
	autocmd.pro \
	beval.pro \
	blowfish.pro \
	buffer.pro \
	bufwrite.pro \
	change.pro \
	channel.pro \
	charset.pro \
	cindent.pro \
	clientserver.pro \
	clipboard.pro \
	cmdexpand.pro \
	cmdhist.pro \
	crypt.pro \
	crypt_zip.pro \
	debugger.pro \
	dict.pro \
	diff.pro \
	digraph.pro \
	drawline.pro \
	drawscreen.pro \
	edit.pro \
	eval.pro \
	evalbuffer.pro \
	evalfunc.pro \
	evalvars.pro \
	evalwindow.pro \
	ex_cmds.pro \
	ex_cmds2.pro \
	ex_docmd.pro \
	ex_eval.pro \
	ex_getln.pro \
	fileio.pro \
	filepath.pro \
	findfile.pro \
	fold.pro \
	getchar.pro \
	gui_xim.pro \
	gui_beval.pro \
	hardcopy.pro \
	hashtab.pro \
	help.pro \
	highlight.pro \
	indent.pro \
	insexpand.pro \
	job.pro \
	json.pro \
	list.pro \
	locale.pro \
	main.pro \
	map.pro \
	mark.pro \
	match.pro \
	mbyte.pro \
	memfile.pro \
	memline.pro \
	menu.pro \
	message.pro \
	misc1.pro \
	misc2.pro \
	mouse.pro \
	move.pro \
	normal.pro \
	ops.pro \
	option.pro \
	optionstr.pro \
	os_mac_conv.pro \
	os_unix.pro \
	popupmenu.pro \
	popupwin.pro \
	profiler.pro \
	pty.pro \
	quickfix.pro \
	regexp.pro \
	register.pro \
	screen.pro \
	scriptfile.pro \
	search.pro \
	session.pro \
	sha256.pro \
	sign.pro \
	sound.pro \
	spell.pro \
	spellfile.pro \
	spellsuggest.pro \
	syntax.pro \
	tag.pro \
	term.pro \
	terminal.pro \
	termlib.pro \
	testing.pro \
	textformat.pro \
	textobject.pro \
	textprop.pro \
	time.pro \
	typval.pro \
	ui.pro \
	undo.pro \
	usercmd.pro \
	userfunc.pro \
	version.pro \
 	vim9compile.pro \
 	vim9execute.pro \
 	vim9script.pro \
 	vim9type.pro \
	viminfo.pro \
	window.pro \
	$(ALL_GUI_PRO) \
	$(TCL_PRO)

# Resources used for the Mac are in one directory.
RSRC_DIR = os_mac_rsrc

PRO_MANUAL = os_amiga.pro os_win32.pro \
	os_mswin.pro winclip.pro os_vms.pro $(PERL_PRO)

# Default target is making the executable and tools
all: $(VIMTARGET) $(TOOLS) languages

tools: $(TOOLS)

# Run configure with all the setting from above.
#
# Note: auto/config.h doesn't depend on configure, because running configure
# doesn't always update auto/config.h.  The timestamp isn't changed if the
# file contents didn't change (to avoid recompiling everything).  Including a
# dependency on auto/config.h would cause running configure each time when
# auto/config.h isn't updated.  The dependency on auto/config.mk should make
# sure configure is run when it's needed.
#
# Remove the config.cache every time, once in a while it causes problems that
# are very hard to figure out.
#
config auto/config.mk: auto/configure config.mk.in config.h.in
	-rm -f auto/config.cache
	if test "X$(MAKECMDGOALS)" != "Xclean" \
		-a "X$(MAKECMDGOALS)" != "Xdistclean" \
		-a "X$(MAKECMDGOALS)" != "Xautoconf" \
		-a "X$(MAKECMDGOALS)" != "Xreconfig"; then \
	    GUI_INC_LOC="$(GUI_INC_LOC)" GUI_LIB_LOC="$(GUI_LIB_LOC)" \
		CC="$(CC)" CPPFLAGS="$(CPPFLAGS)" CFLAGS="$(CFLAGS)" \
		LDFLAGS="$(LDFLAGS)" $(CONF_SHELL) srcdir="$(srcdir)" \
		./configure $(CONF_OPT_GUI) $(CONF_OPT_X) $(CONF_OPT_XSMP) \
		$(CONF_OPT_AUTOSERVE) $(CONF_OPT_DARWIN) $(CONF_OPT_FAIL) \
		$(CONF_OPT_PERL) $(CONF_OPT_PYTHON) $(CONF_OPT_PYTHON3) \
		$(CONF_OPT_TCL) $(CONF_OPT_RUBY) $(CONF_OPT_NLS) \
		$(CONF_OPT_CSCOPE) $(CONF_OPT_MULTIBYTE) $(CONF_OPT_INPUT) \
		$(CONF_OPT_OUTPUT) $(CONF_OPT_GPM) \
		$(CONF_OPT_FEAT) $(CONF_TERM_LIB) \
		$(CONF_OPT_COMPBY) $(CONF_OPT_ACL) $(CONF_OPT_NETBEANS) \
		$(CONF_OPT_CHANNEL) $(CONF_OPT_TERMINAL) \
		$(CONF_ARGS) $(CONF_ARGS1) $(CONF_ARGS2) $(CONF_ARGS3) \
		$(CONF_ARGS4) $(CONF_ARGS5) $(CONF_ARGS6) \
		$(CONF_OPT_MZSCHEME) $(CONF_OPT_PLTHOME) \
		$(CONF_OPT_LUA) $(CONF_OPT_LUA_PREFIX) \
		$(CONF_OPT_SYSMOUSE) $(CONF_OPT_CANBERRA); \
	fi

# Use "make reconfig" to rerun configure without cached values.
# When config.h changes, most things will be recompiled automatically.
# Invoke $(MAKE) to run config with the empty auto/config.mk.
# Invoke $(MAKE) to build all with the filled auto/config.mk.
reconfig: scratch clean
	$(MAKE) -f Makefile config
	$(MAKE) -f Makefile all

# Run autoconf to produce auto/configure.
# Note:
# - DO NOT RUN autoconf MANUALLY!  It will overwrite ./configure instead of
#   producing auto/configure.
# - autoconf is not run automatically, because a patch usually changes both
#   configure.ac and auto/configure but can't update the timestamps.  People
#   who do not have (the correct version of) autoconf would run into trouble.
#
# Two tricks are required to make autoconf put its output in the "auto" dir:
# - Temporarily move the ./configure script to ./configure.save.  Don't
#   overwrite it, it's probably the result of an aborted autoconf.
# - Use sed to change ./config.log to auto/config.log in the configure script.
# Autoconf 2.5x (2.59 at least) produces a few more files that we need to take
# care of:
# - configure.lineno: has the line numbers replaced with $LINENO.  That
#   improves patches a LOT, thus use it instead (until someone says it doesn't
#   work on some system).
# - autom4te.cache directory is created and not cleaned up.  Delete it.
# - Uses ">config.log" instead of "./config.log".
autoconf:
	if test ! -f configure.save; then mv configure configure.save; fi
	$(AUTOCONF)
	sed -e 's+>config.log+>auto/config.log+' -e 's+\./config.log+auto/config.log+' configure > auto/configure
	chmod 755 auto/configure
	mv -f configure.save configure
	-rm -rf autom4te.cache
	-rm -f auto/config.status auto/config.cache

# Run vim script to generate the Ex command lookup table.
# This only needs to be run when a command name has been added or changed.
# If this fails because you don't have Vim yet, first build and install Vim
# without changes.
cmdidxs: ex_cmds.h
	vim --clean -X --not-a-term -u create_cmdidxs.vim


# The normal command to compile a .c file to its .o file.
# Without or with ALL_CFLAGS.
CCC_NF = $(CC) -c -I$(srcdir)
CCC = $(CCC_NF) $(ALL_CFLAGS)


# Link the target for normal use or debugging.
# A shell script is used to try linking without unnecessary libraries.
$(VIMTARGET): auto/config.mk objects $(OBJ) version.c version.h
	$(CCC) version.c -o objects/version.o
	@$(BUILD_DATE_MSG)
	@$(PURIFY) $(SHRPENV) $(CClink) $(ALL_LIB_DIRS) $(LDFLAGS) \
		-o $(VIMTARGET) $(OBJ) $(LIBS)

xxd/xxd$(EXEEXT): xxd/xxd.c
	cd xxd; CC="$(CC)" CFLAGS="$(CPPFLAGS) $(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
		$(MAKE) -f Makefile

# Build the language specific files if they were unpacked.
# Generate the converted .mo files separately, it's no problem if this fails.
languages:
	@if test -n "$(MAKEMO)" -a -f $(PODIR)/Makefile; then \
		cd $(PODIR); \
		  CC="$(CC)" $(MAKE) prefix=$(DESTDIR)$(prefix); \
	fi
	-@if test -n "$(MAKEMO)" -a -f $(PODIR)/Makefile; then \
		cd $(PODIR); \
		  CC="$(CC)" $(MAKE) prefix=$(DESTDIR)$(prefix) converted; \
	fi

# Update the *.po files for changes in the sources.  Only run manually.
update-po:
	cd $(PODIR); CC="$(CC)" $(MAKE) prefix=$(DESTDIR)$(prefix) update-po

# Generate function prototypes.  This is not needed to compile vim, but if
# you want to use it, cproto is out there on the net somewhere -- Webb
#
# When generating os_amiga.pro and os_win32.pro there will be a
# few include files that can not be found, that's OK.

proto: $(PRO_AUTO) $(PRO_MANUAL)

# Filter out arguments that cproto doesn't support.
# Don't pass "-pthread", "-fwrapv" and similar arguments to cproto, it sees
# them as a list of individual flags.
# The -E"gcc -E" argument must be separate to avoid problems with shell
# quoting.
# Strip -O2, it may cause cproto to write stderr to the file "2".
CPROTO = cproto $(PROTO_FLAGS) -DPROTO \
	 `echo '$(LINT_CFLAGS)' | sed -e 's/ -[a-z-]\+//g' -e 's/ -O[^ ]\+//g'`

### Would be nice if this would work for "normal" make.
### Currently it only works for (Free)BSD make.
#$(PRO_AUTO): $$(*F).c
#	$(CPROTO) -DFEAT_GUI $(*F).c > $@

# Always define FEAT_GUI.  This may generate a few warnings if it's also
# defined in auto/config.h, you can ignore that.
.c.pro:
	$(CPROTO) -DFEAT_GUI $< > proto/$@
	echo "/* vim: set ft=c : */" >> proto/$@

os_amiga.pro: os_amiga.c
	$(CPROTO) -DAMIGA -UHAVE_CONFIG_H -DBPTR=char* $< > proto/$@
	echo "/* vim: set ft=c : */" >> proto/$@

os_win32.pro: os_win32.c
	$(CPROTO) -DWIN32 -UHAVE_CONFIG_H $< > proto/$@
	echo "/* vim: set ft=c : */" >> proto/$@

os_mswin.pro: os_mswin.c
	$(CPROTO) -DWIN32 -UHAVE_CONFIG_H $< > proto/$@
	echo "/* vim: set ft=c : */" >> proto/$@

winclip.pro: winclip.c
	$(CPROTO) -DWIN32 -UHAVE_CONFIG_H $< > proto/$@
	echo "/* vim: set ft=c : */" >> proto/$@

os_vms.pro: os_vms.c
# must use os_vms_conf.h for auto/config.h
	mv auto/config.h auto/config.h.save
	cp os_vms_conf.h auto/config.h
	$(CPROTO) -DVMS -UFEAT_GUI_ATHENA -UFEAT_GUI_NEXTAW -UFEAT_GUI_MOTIF -UFEAT_GUI_GTK $< > proto/$@
	echo "/* vim: set ft=c : */" >> proto/$@
	rm auto/config.h
	mv auto/config.h.save auto/config.h



notags:
	-rm -f tags

# Note: tags is made for the currently configured version, can't include both
#	Motif and Athena GUI
# You can ignore error messages for missing files.
tags TAGS: notags
	$(TAGPRG) $(TAGS_FILES)

# Make a highlight file for types.  Requires Exuberant ctags and awk
types: types.vim
types.vim: $(TAGS_FILES)
	ctags --c-kinds=gstu -o- $(TAGS_FILES) |\
		awk 'BEGIN{printf("syntax keyword Type\t")}\
			{printf("%s ", $$1)}END{print ""}' > $@
	echo "syn keyword Constant OK FAIL TRUE FALSE MAYBE" >> $@

# Run the libvterm tests.
# This works only on GNU make, not on BSD make.
test_libvterm:
	@if $(MAKE) --version 2>/dev/null | grep -qs "GNU Make"; then \
		cd libvterm; $(MAKE) -f Makefile test CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)"; \
	fi


$(HELPSOURCE)/vim.1 $(MACROSOURCE) $(TOOLSSOURCE):
	@echo Runtime files not found.
	@echo You need to unpack the runtime archive before running "make install".
	test -f error

# Clean up all the files that have been produced, except configure's.
clean : 
	-rm -f *.o core $(VIMTARGET).core $(VIMTARGET) vim xxd/*.o
	-rm -rf objects
	-rm -f $(TOOLS) auto/osdef.h auto/pathdef.c auto/if_perl.c auto/gui_gtk_gresources.c auto/gui_gtk_gresources.h auto/os_haiku.rdef
	-rm -f conftest* *~ auto/link.sed
	-rm -f testdir/opt_test.vim
	-rm -f $(UNITTEST_TARGETS)
	-rm -f runtime pixmaps
	-rm -f mzscheme_base.c
	-rm -rf libvterm/.libs libterm/t/.libs libvterm/src/*.o libvterm/src/*.lo libvterm/t/*.o libvterm/t/*.lo libvterm/t/harness libvterm/libvterm.la
	if test -d $(PODIR); then \
		cd $(PODIR); $(MAKE) prefix=$(DESTDIR)$(prefix) clean; \
	fi


# Start configure from scratch
scrub scratch:
	-rm -f auto/config.status auto/config.cache config.log auto/config.log
	-rm -f auto/config.h auto/link.log auto/link.sed auto/config.mk
	touch auto/config.h
	cp config.mk.dist auto/config.mk

distclean: clean scratch
	-rm -f tags

dist: distclean
	@echo
	@echo Making the distribution has to be done in the top directory

mdepend:
	-@rm -f Makefile~
	cp Makefile Makefile~
	sed -e '/\#\#\# Dependencies/q' < Makefile > tmp_make
	@for i in $(ALL_SRC) ; do \
	  echo "$$i" ; \
	  echo `echo "$$i" | sed -e 's/[^ ]*\.c$$/objects\/\1.o/'`": $$i" `\
	    $(CPP) $$i |\
	    grep '^# .*"\./.*\.h"' |\
	    sort -t'"' -u +1 -2 |\
	    sed -e 's/.*"\.\/\(.*\)".*/\1/'\
	    ` >> tmp_make ; \
	done
	mv tmp_make Makefile

depend:
	-@rm -f Makefile~
	cp Makefile Makefile~
	sed -e '/\#\#\# Dependencies/q' < Makefile > tmp_make
	-for i in $(ALL_LOCAL_SRC); do echo $$i; \
		$(CPP_DEPEND) $$i | \
		sed -e 's+^\([^ ]*\.o\)+objects/\1+' >> tmp_make; done
	-for i in $(TERM_SRC); do echo $$i; \
		$(CPP_DEPEND) $$i | \
		sed -e 's+^\([^ ]*\.o\)+objects/vterm_\1+' >> tmp_make; done
	-for i in $(XDIFF_SRC); do echo $$i; \
		$(CPP_DEPEND) $$i | \
		sed -e 's+^\([^ ]*\.o\)+objects/\1+' -e 's+xdiff/\.\./++g' >> tmp_make; done
	mv tmp_make Makefile

# Run lint.  Clean up the *.ln files that are sometimes left behind.
lint:
	$(LINT) $(LINT_OPTIONS) $(LINT_CFLAGS) $(LINT_EXTRA) $(LINT_SRC)
	-rm -f *.ln

# Check dosinst.c with lint.
lintinstall:
	$(LINT) $(LINT_OPTIONS) -DWIN32 -DUNIX_LINT dosinst.c
	-rm -f dosinst.ln

###########################################################################

.c.o:
	$(CCC) $<

auto/if_perl.c: if_perl.xs
	$(PERL) -e 'unless ( $$] >= 5.005 ) { for (qw(na defgv errgv)) { print "#define PL_$$_ $$_\n" }}' > $@
	$(PERL) $(PERL_XSUBPP) -prototypes -typemap \
	    $(PERLLIB)/ExtUtils/typemap if_perl.xs >> $@

auto/osdef.h: auto/config.h osdef.sh osdef1.h.in osdef2.h.in
	CC="$(CC) $(OSDEF_CFLAGS)" srcdir=$(srcdir) sh $(srcdir)/osdef.sh

auto/os_haiku.rdef: os_haiku.rdef.in
	@echo creating $@
	@echo '/* This file is automatically created by Makefile */' >> $@
	@echo '/* DO NOT EDIT!  Change Makefile only. */' >> $@
	@cat $(srcdir)/os_haiku.rdef.in >> auto/os_haiku.rdef
	sed -i "s|@MAJOR@|$(VIMMAJOR)|" auto/os_haiku.rdef
	sed -i "s|@MINOR@|$(VIMMINOR)|" auto/os_haiku.rdef

auto/pathdef.c: Makefile auto/config.mk
	-@echo creating $@
	-@echo '/* pathdef.c */' > $@
	-@echo '/* This file is automatically created by Makefile' >> $@
	-@echo ' * DO NOT EDIT!  Change Makefile only. */' >> $@
	-@echo '#include "vim.h"' >> $@
	-@echo 'char_u *default_vim_dir = (char_u *)"$(VIMRCLOC)";' | $(QUOTESED) >> $@
	-@echo 'char_u *default_vimruntime_dir = (char_u *)"$(VIMRUNTIMEDIR)";' | $(QUOTESED) >> $@
	-@echo 'char_u *all_cflags = (char_u *)"$(CC) -c -I$(srcdir) $(ALL_CFLAGS)";' | $(QUOTESED) >>  $@
	-@echo 'char_u *all_lflags = (char_u *)"$(CC) $(ALL_LIB_DIRS) $(LDFLAGS) -o $(VIMTARGET) $(ALL_LIBS) ";' | $(QUOTESED) >>  $@
	-@echo 'char_u *compiled_user = (char_u *)"' | tr -d $(NL) >> $@
	-@if test -n "$(COMPILEDBY)"; then \
		echo "$(COMPILEDBY)" | tr -d $(NL) >> $@; \
		else ((logname) 2>/dev/null || whoami) | tr -d $(NL) >> $@; fi
	-@echo '";' >> $@
	-@echo 'char_u *compiled_sys = (char_u *)"' | tr -d $(NL) >> $@
	-@if test -z "$(COMPILEDBY)"; then hostname | tr -d $(NL) >> $@; fi
	-@echo '";' >> $@
	-@sh $(srcdir)/pathdef.sh

# All the object files are put in the "objects" directory.  Since not all make
# commands understand putting object files in another directory, it must be
# specified for each file separately.

objects: objects/.dirstamp

objects/.dirstamp:
	$(MKDIR_P) objects
	touch objects/.dirstamp

# All object files depend on the objects directory, so that parallel make
# works.  Can't depend on the directory itself, its timestamp changes all the
# time.
$(ALL_OBJ): objects/.dirstamp

objects/arabic.o: arabic.c
	$(CCC) -o $@ arabic.c

objects/arglist.o: arglist.c
	$(CCC) -o $@ arglist.c

objects/autocmd.o: autocmd.c
	$(CCC) -o $@ autocmd.c

objects/blob.o: blob.c
	$(CCC) -o $@ blob.c

objects/blowfish.o: blowfish.c
	$(CCC) -o $@ blowfish.c

objects/buffer.o: buffer.c
	$(CCC) -o $@ buffer.c

objects/bufwrite.o: bufwrite.c
	$(CCC) -o $@ bufwrite.c

objects/change.o: change.c
	$(CCC) -o $@ change.c

objects/charset.o: charset.c
	$(CCC) -o $@ charset.c

objects/cindent.o: cindent.c
	$(CCC) -o $@ cindent.c

objects/clientserver.o: clientserver.c
	$(CCC) -o $@ clientserver.c

objects/clipboard.o: clipboard.c
	$(CCC) -o $@ clipboard.c

objects/cmdexpand.o: cmdexpand.c
	$(CCC) -o $@ cmdexpand.c

objects/cmdhist.o: cmdhist.c
	$(CCC) -o $@ cmdhist.c

objects/crypt.o: crypt.c
	$(CCC) -o $@ crypt.c

objects/crypt_zip.o: crypt_zip.c
	$(CCC) -o $@ crypt_zip.c

objects/debugger.o: debugger.c
	$(CCC) -o $@ debugger.c

objects/dict.o: dict.c
	$(CCC) -o $@ dict.c

objects/diff.o: diff.c $(XDIFF_INCL)
	$(CCC) -o $@ diff.c

objects/digraph.o: digraph.c
	$(CCC) -o $@ digraph.c

objects/drawline.o: drawline.c
	$(CCC) -o $@ drawline.c

objects/drawscreen.o: drawscreen.c
	$(CCC) -o $@ drawscreen.c

objects/edit.o: edit.c
	$(CCC) -o $@ edit.c

objects/eval.o: eval.c
	$(CCC) -o $@ eval.c

objects/evalbuffer.o: evalbuffer.c
	$(CCC) -o $@ evalbuffer.c

objects/evalfunc.o: evalfunc.c
	$(CCC) -o $@ evalfunc.c

objects/evalvars.o: evalvars.c
	$(CCC) -o $@ evalvars.c

objects/evalwindow.o: evalwindow.c
	$(CCC) -o $@ evalwindow.c

objects/ex_cmds.o: ex_cmds.c
	$(CCC) -o $@ ex_cmds.c

objects/ex_cmds2.o: ex_cmds2.c
	$(CCC) -o $@ ex_cmds2.c

objects/ex_docmd.o: ex_docmd.c
	$(CCC) -o $@ ex_docmd.c

objects/ex_eval.o: ex_eval.c
	$(CCC) -o $@ ex_eval.c

objects/ex_getln.o: ex_getln.c
	$(CCC) -o $@ ex_getln.c

objects/fileio.o: fileio.c
	$(CCC) -o $@ fileio.c

objects/filepath.o: filepath.c
	$(CCC) -o $@ filepath.c

objects/findfile.o: findfile.c
	$(CCC) -o $@ findfile.c

objects/fold.o: fold.c
	$(CCC) -o $@ fold.c

objects/getchar.o: getchar.c
	$(CCC) -o $@ getchar.c

objects/hardcopy.o: hardcopy.c
	$(CCC) -o $@ hardcopy.c

objects/hashtab.o: hashtab.c
	$(CCC) -o $@ hashtab.c

objects/help.o: help.c
	$(CCC) -o $@ help.c

objects/beval.o: beval.c
	$(CCC) -o $@ beval.c

objects/highlight.o: highlight.c
	$(CCC) -o $@ highlight.c

mzscheme_base.c:
	$(MZSCHEME_MZC) --c-mods mzscheme_base.c ++lib scheme/base

objects/indent.o: indent.c
	$(CCC) -o $@ indent.c

objects/insexpand.o: insexpand.c
	$(CCC) -o $@ insexpand.c

objects/job.o: job.c
	$(CCC) -o $@ job.c

objects/json.o: json.c
	$(CCC) -o $@ json.c

objects/json_test.o: json_test.c
	$(CCC) -o $@ json_test.c

objects/kword_test.o: kword_test.c
	$(CCC) -o $@ kword_test.c

objects/list.o: list.c
	$(CCC) -o $@ list.c

objects/locale.o: locale.c
	$(CCC) -o $@ locale.c

objects/main.o: main.c
	$(CCC) -o $@ main.c

objects/map.o: map.c
	$(CCC) -o $@ map.c

objects/mark.o: mark.c
	$(CCC) -o $@ mark.c

objects/match.o: match.c
	$(CCC) -o $@ match.c

objects/memfile.o: memfile.c
	$(CCC) -o $@ memfile.c

objects/memfile_test.o: memfile_test.c
	$(CCC) -o $@ memfile_test.c

objects/memline.o: memline.c
	$(CCC) -o $@ memline.c

objects/menu.o: menu.c
	$(CCC) -o $@ menu.c

objects/message.o: message.c
	$(CCC) -o $@ message.c

objects/message_test.o: message_test.c
	$(CCC) -o $@ message_test.c

objects/misc1.o: misc1.c
	$(CCC) -o $@ misc1.c

objects/misc2.o: misc2.c
	$(CCC) -o $@ misc2.c

objects/mouse.o: mouse.c
	$(CCC) -o $@ mouse.c

objects/move.o: move.c
	$(CCC) -o $@ move.c

objects/mbyte.o: mbyte.c
	$(CCC) -o $@ mbyte.c

objects/normal.o: normal.c
	$(CCC) -o $@ normal.c

objects/ops.o: ops.c
	$(CCC) -o $@ ops.c

objects/option.o: option.c optiondefs.h
	$(CCC_NF) $(LUA_CFLAGS) $(PERL_CFLAGS) $(PYTHON_CFLAGS) $(PYTHON3_CFLAGS) $(RUBY_CFLAGS) $(TCL_CFLAGS) $(ALL_CFLAGS) -o $@ option.c

objects/optionstr.o: optionstr.c
	$(CCC_NF) $(LUA_CFLAGS) $(PERL_CFLAGS) $(PYTHON_CFLAGS) $(PYTHON3_CFLAGS) $(RUBY_CFLAGS) $(TCL_CFLAGS) $(ALL_CFLAGS) -o $@ optionstr.c

objects/os_qnx.o: os_qnx.c
	$(CCC) -o $@ os_qnx.c

objects/os_haiku.rsrc: auto/os_haiku.rdef
	cat $< | $(CCC) -E - | grep -v '^#' | rc -o "$@" -

objects/os_macosx.o: os_macosx.m
	$(CCC) -o $@ os_macosx.m

objects/os_mac_conv.o: os_mac_conv.c
	$(CCC) -o $@ os_mac_conv.c

objects/os_unix.o: os_unix.c
	$(CCC) -o $@ os_unix.c

objects/os_mswin.o: os_mswin.c
	$(CCC) -o $@ os_mswin.c

objects/winclip.o: winclip.c
	$(CCC) -o $@ winclip.c

objects/pathdef.o: auto/pathdef.c
	$(CCC) -o $@ auto/pathdef.c

objects/popupmenu.o: popupmenu.c
	$(CCC) -o $@ popupmenu.c

objects/popupwin.o: popupwin.c
	$(CCC) -o $@ popupwin.c

objects/profiler.o: profiler.c
	$(CCC) -o $@ profiler.c

objects/pty.o: pty.c
	$(CCC) -o $@ pty.c

objects/quickfix.o: quickfix.c
	$(CCC) -o $@ quickfix.c

objects/regexp.o: regexp.c regexp_bt.c regexp_nfa.c
	$(CCC) -o $@ regexp.c

objects/register.o: register.c
	$(CCC) -o $@ register.c

objects/scriptfile.o: scriptfile.c
	$(CCC) -o $@ scriptfile.c

objects/screen.o: screen.c
	$(CCC) -o $@ screen.c

objects/search.o: search.c
	$(CCC) -o $@ search.c

objects/session.o: session.c
	$(CCC) -o $@ session.c

objects/sha256.o: sha256.c
	$(CCC) -o $@ sha256.c

objects/sign.o: sign.c
	$(CCC) -o $@ sign.c

objects/sound.o: sound.c
	$(CCC) -o $@ sound.c

objects/spell.o: spell.c
	$(CCC) -o $@ spell.c

objects/spellfile.o: spellfile.c
	$(CCC) -o $@ spellfile.c

objects/spellsuggest.o: spellsuggest.c
	$(CCC) -o $@ spellsuggest.c

objects/syntax.o: syntax.c
	$(CCC) -o $@ syntax.c

objects/tag.o: tag.c
	$(CCC) -o $@ tag.c

objects/term.o: term.c
	$(CCC) -o $@ term.c

objects/terminal.o: terminal.c $(TERM_DEPS)
	$(CCC) -o $@ terminal.c

objects/testing.o: testing.c
	$(CCC) -o $@ testing.c

objects/textformat.o: textformat.c
	$(CCC) -o $@ textformat.c

objects/textobject.o: textobject.c
	$(CCC) -o $@ textobject.c

objects/textprop.o: textprop.c
	$(CCC) -o $@ textprop.c

objects/time.o: time.c
	$(CCC) -o $@ time.c

objects/typval.o: typval.c
	$(CCC) -o $@ typval.c

objects/ui.o: ui.c
	$(CCC) -o $@ ui.c

objects/undo.o: undo.c
	$(CCC) -o $@ undo.c

objects/usercmd.o: usercmd.c
	$(CCC) -o $@ usercmd.c

objects/userfunc.o: userfunc.c
	$(CCC) -o $@ userfunc.c

objects/vim9compile.o: vim9compile.c
	$(CCC) -o $@ vim9compile.c

objects/vim9execute.o: vim9execute.c
	$(CCC) -o $@ vim9execute.c

objects/vim9script.o: vim9script.c
	$(CCC) -o $@ vim9script.c

objects/vim9type.o: vim9type.c
	$(CCC) -o $@ vim9type.c

objects/viminfo.o: viminfo.c
	$(CCC) -o $@ viminfo.c

objects/window.o: window.c
	$(CCC) -o $@ window.c

objects/channel.o: channel.c
	$(CCC) -o $@ channel.c

# Build rules for libvterm.  Putting them here allows for adding compilation
# options specific for Vim.  Since the .o files go into objects/ we do need to
# prefix vterm_ to avoid name clashes.
CCCTERM = $(CCC_NF) $(VTERM_CFLAGS) $(ALL_CFLAGS) -DINLINE="" \
	  -DVSNPRINTF=vim_vsnprintf \
	  -DSNPRINTF=vim_snprintf \
	  -DIS_COMBINING_FUNCTION=utf_iscomposing_uint \
	  -DWCWIDTH_FUNCTION=utf_uint2cells

objects/vterm_encoding.o: libvterm/src/encoding.c $(TERM_DEPS)
	$(CCCTERM) -o $@ libvterm/src/encoding.c

objects/vterm_keyboard.o: libvterm/src/keyboard.c $(TERM_DEPS)
	$(CCCTERM) -o $@ libvterm/src/keyboard.c

objects/vterm_mouse.o: libvterm/src/mouse.c $(TERM_DEPS)
	$(CCCTERM) -o $@ libvterm/src/mouse.c

objects/vterm_parser.o: libvterm/src/parser.c $(TERM_DEPS)
	$(CCCTERM) -o $@ libvterm/src/parser.c

objects/vterm_pen.o: libvterm/src/pen.c $(TERM_DEPS)
	$(CCCTERM) -o $@ libvterm/src/pen.c

objects/vterm_screen.o: libvterm/src/screen.c $(TERM_DEPS)
	$(CCCTERM) -o $@ libvterm/src/screen.c

objects/vterm_state.o: libvterm/src/state.c $(TERM_DEPS)
	$(CCCTERM) -o $@ libvterm/src/state.c

objects/vterm_unicode.o: libvterm/src/unicode.c $(TERM_DEPS) libvterm/src/fullwidth.inc
	$(CCCTERM) -o $@ libvterm/src/unicode.c

objects/vterm_vterm.o: libvterm/src/vterm.c $(TERM_DEPS)
	$(CCCTERM) -o $@ libvterm/src/vterm.c

CCCDIFF = $(CCC_NF) $(ALL_CFLAGS)

objects/xdiffi.o: xdiff/xdiffi.c $(XDIFF_INCL)
	$(CCCDIFF) -o $@ xdiff/xdiffi.c

objects/xprepare.o: xdiff/xprepare.c $(XDIFF_INCL)
	$(CCCDIFF) -o $@ xdiff/xprepare.c

objects/xutils.o: xdiff/xutils.c $(XDIFF_INCL)
	$(CCCDIFF) -o $@ xdiff/xutils.c

objects/xemit.o: xdiff/xemit.c $(XDIFF_INCL)
	$(CCCDIFF) -o $@ xdiff/xemit.c

objects/xhistogram.o: xdiff/xhistogram.c $(XDIFF_INCL)
	$(CCCDIFF) -o $@ xdiff/xhistogram.c

objects/xpatience.o: xdiff/xpatience.c $(XDIFF_INCL)
	$(CCCDIFF) -o $@ xdiff/xpatience.c


Makefile:
	@echo The name of the makefile MUST be "Makefile" (with capital M)!!!!


###############################################################################
### (automatically generated by 'make depend')
### Dependencies:
objects/arabic.o: arabic.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/arglist.o: arglist.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/autocmd.o: autocmd.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/beval.o: beval.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/blob.o: blob.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/blowfish.o: blowfish.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/buffer.o: buffer.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 version.h
objects/change.o: change.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/charset.o: charset.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/cindent.o: cindent.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/clientserver.o: clientserver.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/clipboard.o: clipboard.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/cmdexpand.o: cmdexpand.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/cmdhist.o: cmdhist.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/crypt.o: crypt.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/crypt_zip.o: crypt_zip.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/debugger.o: debugger.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/dict.o: dict.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/diff.o: diff.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 xdiff/xdiff.h xdiff/../vim.h
objects/digraph.o: digraph.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/drawline.o: drawline.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/drawscreen.o: drawscreen.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/edit.o: edit.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/eval.o: eval.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/evalbuffer.o: evalbuffer.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/evalfunc.o: evalfunc.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 version.h
objects/evalvars.o: evalvars.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 version.h
objects/evalwindow.o: evalwindow.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/ex_cmds.o: ex_cmds.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 version.h
objects/ex_cmds2.o: ex_cmds2.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 version.h
objects/ex_docmd.o: ex_docmd.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 ex_cmdidxs.h
objects/ex_eval.o: ex_eval.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/ex_getln.o: ex_getln.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/fileio.o: fileio.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/filepath.o: filepath.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/findfile.o: findfile.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/fold.o: fold.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/getchar.o: getchar.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/hardcopy.o: hardcopy.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 version.h
objects/hashtab.o: hashtab.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/help.o: help.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/highlight.o: highlight.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/indent.o: indent.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/insexpand.o: insexpand.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/json.o: json.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/list.o: list.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/locale.o: locale.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/main.o: main.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/map.o: map.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/mark.o: mark.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/match.o: match.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/mbyte.o: mbyte.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/memfile.o: memfile.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/memline.o: memline.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/menu.o: menu.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/message.o: message.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/misc1.o: misc1.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 version.h
objects/misc2.o: misc2.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/mouse.o: mouse.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/move.o: move.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/normal.o: normal.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/ops.o: ops.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/option.o: option.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 optiondefs.h
objects/optionstr.o: optionstr.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/os_unix.o: os_unix.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 os_unixx.h
objects/pathdef.o: auto/pathdef.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/popupmenu.o: popupmenu.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/popupwin.o: popupwin.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/profiler.o: profiler.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/pty.o: pty.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/quickfix.o: quickfix.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/regexp.o: regexp.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 regexp_bt.c regexp_nfa.c
objects/register.o: register.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/screen.o: screen.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/scriptfile.o: scriptfile.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/search.o: search.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/session.o: session.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/sha256.o: sha256.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/sign.o: sign.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/sound.o: sound.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/spell.o: spell.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/spellfile.o: spellfile.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/spellsuggest.o: spellsuggest.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/syntax.o: syntax.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/tag.o: tag.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/term.o: term.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/terminal.o: terminal.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 libvterm/include/vterm.h libvterm/include/vterm_keycodes.h
objects/testing.o: testing.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/textformat.o: textformat.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/textobject.o: textobject.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h
objects/textprop.o: textprop.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/time.o: time.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/typval.o: typval.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/ui.o: ui.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/undo.o: undo.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/usercmd.o: usercmd.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/userfunc.o: userfunc.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/version.o: version.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 version.h
objects/vim9compile.o: vim9compile.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h vim9.h
objects/vim9execute.o: vim9execute.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h vim9.h
objects/vim9script.o: vim9script.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h vim9.h
objects/vim9type.o: vim9type.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/viminfo.o: viminfo.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h \
 version.h
objects/window.o: window.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/bufwrite.o: bufwrite.c vim.h protodef.h auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h errors.h
objects/json_test.o: json_test.c main.c vim.h protodef.h auto/config.h feature.h \
 os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h option.h beval.h \
 structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h proto.h globals.h \
 errors.h json.c
objects/kword_test.o: kword_test.c main.c vim.h protodef.h auto/config.h \
 feature.h os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h \
 option.h beval.h structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h \
 proto.h globals.h errors.h charset.c
objects/memfile_test.o: memfile_test.c main.c vim.h protodef.h auto/config.h \
 feature.h os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h \
 option.h beval.h structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h \
 proto.h globals.h errors.h memfile.c
objects/message_test.o: message_test.c main.c vim.h protodef.h auto/config.h \
 feature.h os_unix.h auto/osdef.h ascii.h keymap.h term.h macros.h \
 option.h beval.h structs.h regexp.h gui.h alloc.h ex_cmds.h spell.h \
 proto.h globals.h errors.h message.c
objects/vterm_encoding.o: libvterm/src/encoding.c libvterm/src/vterm_internal.h \
 libvterm/include/vterm.h libvterm/include/vterm_keycodes.h \
 libvterm/src/encoding/DECdrawing.inc libvterm/src/encoding/uk.inc
objects/vterm_keyboard.o: libvterm/src/keyboard.c libvterm/src/vterm_internal.h \
 libvterm/include/vterm.h libvterm/include/vterm_keycodes.h \
 libvterm/src/utf8.h
objects/vterm_mouse.o: libvterm/src/mouse.c libvterm/src/vterm_internal.h \
 libvterm/include/vterm.h libvterm/include/vterm_keycodes.h \
 libvterm/src/utf8.h
objects/vterm_parser.o: libvterm/src/parser.c libvterm/src/vterm_internal.h \
 libvterm/include/vterm.h libvterm/include/vterm_keycodes.h
objects/vterm_pen.o: libvterm/src/pen.c libvterm/src/vterm_internal.h \
 libvterm/include/vterm.h libvterm/include/vterm_keycodes.h
objects/vterm_screen.o: libvterm/src/screen.c libvterm/src/vterm_internal.h \
 libvterm/include/vterm.h libvterm/include/vterm_keycodes.h \
 libvterm/src/rect.h libvterm/src/utf8.h
objects/vterm_state.o: libvterm/src/state.c libvterm/src/vterm_internal.h \
 libvterm/include/vterm.h libvterm/include/vterm_keycodes.h
objects/vterm_unicode.o: libvterm/src/unicode.c libvterm/src/vterm_internal.h \
 libvterm/include/vterm.h libvterm/include/vterm_keycodes.h \
 libvterm/src/fullwidth.inc
objects/vterm_vterm.o: libvterm/src/vterm.c libvterm/src/vterm_internal.h \
 libvterm/include/vterm.h libvterm/include/vterm_keycodes.h \
 libvterm/src/utf8.h
objects/xdiffi.o: xdiff/xdiffi.c xdiff/xinclude.h auto/config.h \
 xdiff/xmacros.h xdiff/xdiff.h vim.h protodef.h \
 auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h \
 macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h \
 spell.h proto.h globals.h errors.h \
 xdiff/xtypes.h xdiff/xutils.h xdiff/xprepare.h xdiff/xdiffi.h \
 xdiff/xemit.h
objects/xemit.o: xdiff/xemit.c xdiff/xinclude.h auto/config.h \
 xdiff/xmacros.h xdiff/xdiff.h vim.h protodef.h \
 auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h \
 macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h \
 spell.h proto.h globals.h errors.h \
 xdiff/xtypes.h xdiff/xutils.h xdiff/xprepare.h xdiff/xdiffi.h \
 xdiff/xemit.h
objects/xprepare.o: xdiff/xprepare.c xdiff/xinclude.h auto/config.h \
 xdiff/xmacros.h xdiff/xdiff.h vim.h protodef.h \
 auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h \
 macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h \
 spell.h proto.h globals.h errors.h \
 xdiff/xtypes.h xdiff/xutils.h xdiff/xprepare.h xdiff/xdiffi.h \
 xdiff/xemit.h
objects/xutils.o: xdiff/xutils.c xdiff/xinclude.h auto/config.h \
 xdiff/xmacros.h xdiff/xdiff.h vim.h protodef.h \
 auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h \
 macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h \
 spell.h proto.h globals.h errors.h \
 xdiff/xtypes.h xdiff/xutils.h xdiff/xprepare.h xdiff/xdiffi.h \
 xdiff/xemit.h
objects/xhistogram.o: xdiff/xhistogram.c xdiff/xinclude.h auto/config.h \
 xdiff/xmacros.h xdiff/xdiff.h vim.h protodef.h \
 auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h \
 macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h \
 spell.h proto.h globals.h errors.h \
 xdiff/xtypes.h xdiff/xutils.h xdiff/xprepare.h xdiff/xdiffi.h \
 xdiff/xemit.h
objects/xpatience.o: xdiff/xpatience.c xdiff/xinclude.h auto/config.h \
 xdiff/xmacros.h xdiff/xdiff.h vim.h protodef.h \
 auto/config.h feature.h os_unix.h \
 auto/osdef.h ascii.h keymap.h term.h \
 macros.h option.h beval.h structs.h \
 regexp.h gui.h alloc.h ex_cmds.h \
 spell.h proto.h globals.h errors.h \
 xdiff/xtypes.h xdiff/xutils.h xdiff/xprepare.h xdiff/xdiffi.h \
 xdiff/xemit.h
