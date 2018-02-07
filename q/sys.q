/ screen related doodling
/ do not take this as runable

PX:1872;
PY:1404;
AR:PY%PX;
DPI:226;
MEMSZ:512 * 1024 * 1024;
DISKSZ:8 * 1024 * 1024 * 1024;
MHZ:1;
BAT:3000;
SBGH:"#d6d9de";
BTNS:`pwr`prev`home`next;
NODE:`test;
show value `.

xs:string;

system 0N!" "sv each 0N! raze ("c";xs each RY,RX); / set Q col/row fmt options for 'show'

/ idea: make it very easy to pop a "new object in the thing" into the system
/ verb is just: rem
rem:{
	/ pretend we are poping up a new window onto the stack thingy here, in a non-annoying way
	show (`rem; x)
	}

/ idea: define callbacks for common functions in C: each program defines their own, all global, no handles
Cmd:()!();
Cmd[`dfl]:{rem `defaultclick};
show Cmd;

/ idea: represent things that can be user interface items - in a table! easy to find things
/ parents allow us to nest scenes, maybe; these would build symbolically into other table elements
/ we'd call cb() when a child is inserted perhaps? or just a tap annd/or long tap? not sure..
Glyph:([id:()] ty:(); isvis:(); parent:(); bbox:(); cb:());
Glyph,:enlist (`; `root; 1b; `; (0,0,PX,PY); Cmd`dfl);
show Glyph

ByType::select from Glyph where isvis=1,ty=`rect
show Rects
display:{show (PX,PY)#x}
Pixmaps::sbuf:0N! #[;0b]PX*PY
.z.ph:{if[8<count x[0];layout[]}
readf:{"\n"sv read0 x};
tmpl:{
	s:readf x; s:ssr[s;"$$include$$";readf`:_.html];
	}
layout:{ /ugh
	("<!doctype html><html><head><title>test</title></head>";
	 "<body><script id=gs></script><div id=w></div></body>


