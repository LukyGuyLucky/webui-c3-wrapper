# webui-c3-wrapper
webui c3 wrapper binding web ui gui

c3 practice with webui binding practice.Win64 bit.

webui : https://github.com/webui-dev/webui

windows 64 bit libs were also from the above original webui project.

compile minimal.c3:

c3c compile-run --wincrt=none minimal.c3 -l webui-2-static.lib -l gdi32.lib -l comctl32.lib -l ole32.lib -l user32.lib -l winmm.lib -l advapi32.lib -l shell32.lib -l libucrtd.lib -l libcmt.lib


compile text_editor.c3:

c3c compile-run --wincrt=none text_editor.c3 -l webui-2-static.lib -l gdi32.lib -l comctl32.lib -l ole32.lib -l user32.lib -l winmm.lib -l advapi32.lib -l shell32.lib -l libucrtd.lib -l libcmt.lib

