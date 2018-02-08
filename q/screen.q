PX:1872;                               / <- CONFIG
PY:1404;
AR:PY%PX;
DPI:226;
MEMSZ:512 * 1024 * 1024;
DISKSZ:8 * 1024 * 1024 * 1024;
MHZ:1;
BAT:3000;
SBGH:"#d6d9de";
BTNS:`pwr`prev`home`next;

HTTP:1872;
INC:`:_.html;
BOOT:.z.T;
APP:1882
\q a-draw.q 1882

show value `.;                         / aaaand breathe out
sx:string;                             / <- GENERAL LIBRARY
gid:{`$(0N!,/["";4?"c"$65+til 26],sx (.z.T-BOOT) mod 1e6)}
show gid[];
readf:{"\n"sv read0 x};
show readf INC;
tmpl:{ssr[;"$$sbgh$$";SBGH] ssr[;"$$inc$$";readf INC] x}
show tmpl "dur";

layout:{                              / <- HTML EMULATOR
	tmpl raze ("<!doctype html><html><head><title>rem ";x;"</title></head>";
	 "<body>$$inc$$<div id=w></div>";
	 "<div id=b><a id=p>prev</a><a id=h>home</a><a id=n>next</a></div>")}
hr:{"\r\n" sv ("HTTP/1.0 301 move";"Location: ",x;"Connection: close";"";"")}
newws:{hr "/clock/",sx gid[]}
.z.ph:{0N!x;0N! $[not "?" in u:x[0]; newws[]; .h.hy[`html;]layout u]}

system"p ",sx HTTP;                   / <- SYSTEM CONFIG/STARTUP
show (`running;HTTP);

