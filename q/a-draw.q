PX:1872;                               / <- CONFIG
PY:1404;
SZ:PX*PY;

buf:SZ # 0b;
msgs:([id:()] t:(); bx:(); d:());
ctr:"j"$.z.T;

pt:{[x;y] (PX*x)+PY*y}
gid:{ctr+:1}

redraw:{
	where 1b=buf
	msgs,::(gid[]; `px; 1,1,1,1; enlist ())}
tap:{[sid;data] buf::@[buf;(PY * data 1) + data 0;

Sel:{[sid;lastid;t] select from Msgs where id>lastid}
Sub:{[sid;t;data] id:gid[]; redraw[id]} 
Upd:{[sid;t;data]
	if[`tap=t;   tap[sid;data]];
	id}



