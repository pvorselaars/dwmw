# dwmw - dynamic windows manager for windows

a fork of [github.com/martanne/dwm-win32](https://github.com/martanne/dwm-win32)

dwmw is a port of the well known [X11](https://www.x.org) window
manager [dwm](https://dwm.suckless.org/) to the Microsoft Windows
platform.

It tries to bring the [suckless philosophy](https://suckless.org/philosophy/)
and the principle of [dynamic window management](https://suckless.org/philosophy/)
to Windows systems.

![dwm-win32 screenshot](https://www.brain-dump.org/projects/dwm-win32/screenshot.png#center)

## Description

dwm manages windows in tiled, monocle and floating layouts. Either layout
can be applied dynamically, optimising the environment for the application
in use and the task performed.

In tiled layouts windows are managed in a master and stacking area. The
master area contains the window which currently needs most attention,
whereas the stacking area contains all other windows. In monocle layout
all windows are maximised to the screen size. In floating layout windows
can be resized and moved freely. Dialog windows are always managed
floating, regardless of the layout applied.

Windows are grouped by tags. Each window can be tagged with one or
multiple tags. Selecting certain tags displays all windows with these
tags.

dwm contains a small status bar which displays all available tags, the 
layout and the title of the focused window. A floating window is indicated
with an empty square and a maximised floating window is indicated with a
filled square before the windows title. The selected tags are indicated
with a different color. The tags of the focused window are indicated with
a filled square in the top left corner.  The tags which are applied to
one or more windows are indicated with an empty square in the top left
corner.

dwm draws a small border around windows to indicate the focus state.

## Configuration

The configuration of dwm-win32 is done by creating a custom `config.h` and
(re)compiling the source code. See the default `config.def.h` as an example,
adapting it to your preference should be straightforward. You basically
define a set of layouts and keys which dwm-win32 will use. There are
some pre defined macros to ease configuration.

Because this is all pretty similar to X11 dwm you might find it's
[customization page](https://dwm.suckless.org/customisation/) useful.

## Usage

### Keyboard

dwm uses a modifier key (denoted by `MOD`) which defaults to `CTRL + ALT`.

 - `MOD + Shift + Return` Start `cmd.exe`.

 - `MOD + b` Toggles bar on and off.

 - `MOD + e` Toogles windows explorer and taskbar on and off.

 - `MOD + t` Sets tiled layout.

 - `MOD + f` Sets floating layout.

 - `MOD + m` Sets monocle layout.

 - `MOD + Space` Toggles between current and previous layout.

 - `MOD + j` Focus next window.

 - `MOD + k` Focus previous window.

 - `MOD + h` Decrease master area size.

 - `MOD + l` Increase master area size.

 - `MOD + Return` Zooms/cycles focused window to/from master area (tiled layouts only).

 - `MOD + Shift + c` Close focused window.

 - `MOD + Shift + Space` Toggle focused window between tiled and floating state.

 - `MOD + n` Toggles border of currently focused window.

 - `MOD + i` Display classname of currently focused window, useful
    for wiriting tagging rules.

 - `MOD + Shift + [1..n]` Apply nth tag to focused window.

 - `MOD + Shift + 0` Apply all tags to focused window.

 - `MOD + Control + Shift + [1..n]` Add/remove nth tag to/from focused window.

 - `MOD + [1..n]` View all windows with nth tag.

 - `MOD + 0` View all windows with any tag.

 - `MOD + Control + [1..n]` Add/remove all windows with nth tag to/from the view.

 - `MOD + q` Quit dwm.

### Mouse

 - Left Button: click on a tag label to display all windows with that
   tag, click on the layout label toggles between tiled and floating
   layout.

 - Right Button: click on a tag label adds/removes all windows with that
   tag to/from the view.

 - Alt + Left Button: click on a tag label applies that tag to the
   focused window.

 - Alt + Right Button: click on a tag label adds/removes that tag to/from
   the focused window.

## How it works

A ShellHook is registered which is notified upon window creation and
destruction, however it is important to know that this only works for
unowned top level windows. This means we will not get notified when child
windows are created/destroyed. Therefore we scan the currently active top
level window upon activation to collect all associated child windows.
This information is for example used to tag all windows and not just
the toplevel one when tag changes occur.

This is all kind of messy and we might miss some child windows in certain
situations. A better approach would probably be to introduce a `CBTProc`
function and register it with `SetWindowsHookEx(WH_CBT, ...)` with this we
would get notified by all and every window, including toolbars etc. 
which we would have to filter out.

Unfortunately the `SetWindowsHookEx` thingy seems to require a separate
DLL which will be loaded into each process address space.

## Development

You can always fetch the current code base from the git repository
located at [Github](https://github.com/pvorselaars/dwmw/)

If you have comments, suggestions, ideas, a bug report, a patch or
something else related to dwmw contact me directly.

## Related

Below are some links which are in one way or another related to dwm-win32.

 - [dwm](https://dwm.suckless.org/) the original for X11
 - [bblean](http://bb4win.sourceforge.net/bblean/) another free software
   window manager for win32

## License

dwmw obviously reuses some code of dwm and dwm-win32 and is released under the same
[MIT/X11 license](https://raw.githubusercontent.com/pvorselaars/dwmw/master/LICENSE.txt).
