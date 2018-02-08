BOOT:.z.T;
M:(id:(); bbox:(); m:(); d:());
id:{"j"$BOOT - .z.T};
draw:{[u] (`t;)};
sync:{[u;x] (`s;u;x;draw[u])};
upd:{[u;x] show (`upd;u;x)}
.z.ts:{
.z.pc:{show (`pc;x)}
.z.po:{show (`po;x)}
.z.pg:{show (`pg;x)}
.z.ps:{show (`ps;x)}
system "p ",string .z.x 0

