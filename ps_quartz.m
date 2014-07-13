
//
// This will eventually be an implementation of the Display PostScript API
// compatible with the NeXTStep API. Most of these functions are just empty
// stubs and will probably never get implemented. I got the API from this
// page which has copies of some of the old NeXTStep documentation:
//
// http://www.cilinder.be/docs/next/NeXTStep/3.3/nd/Summaries/05_DisplayPS/SingleOpSummary.htmld/

#import "ps_quartz.h"

void PSabs(void) {}
void PSadd(void) {}
void PSadjustcursor(float deltaX, float deltaY) {}
void PSaload(void) {}
void PSalphaimage(void) {}
void PSanchorsearch(int *pflag) {}
void PSand(void) {}
void PSarc(float x, float y, float radius, float angle1, float angle2) {}
void PSarcn(float x, float y, float radius, float angle1, float angle2) {}
void PSarct(float x1, float y1, float x2, float y2, float radius) {}
void PSarcto(float x, float y, float x2, float y2, float radius, float *pxt1, float *pyt1, float *pxt2, float *pyt2) {}
void PSarray(int length) {}
void PSashow(float x, float y, char *string) {}
void PSastore(void) {}
void PSatan(void) {}
void PSawidthshow(float x, float y, int c, float ax, float ay, char *string) {}
void PSbasetocurrent(float x, float y, float *px, float *py) {}
void PSbasetoscreen(float x, float y, float *px, float *py) {}
void PSbegin(void) {}
void PSbind(void) {}
void PSbitshift(int shift) {}
void PSbuttondown(int *pflag) {}
void PSbytesavailable(int *pcount) {}
void PScachestatus(int *pbsize, int *pbmax, int *pmsize) {}
void PSceiling(void) {}
void PScharpath(char *string, int flag) {}
void PSclear(void) {}
void PScleardictstack(void) {}
void PScleartomark(void) {}
void PScleartrackingrect(int tRectNum, PS_userobject gstate) {}
void PSclip(void) {}
void PSclippath(void) {}
void PSclosefile(void) {}
void PSclosepath(void) {}
void PScolorimage(void) {}
void PScomposite(float x, float y, float width, float height, PS_userobject srcGstate, float destx, float desty, int op) {}
void PScompositerect(float destx, float desty, float width, float height, int op) {}
void PSconcat(float m[]) {}
void PSconcatmatrix(void) {}
void PScondition(void) {}
void PScopy(int n) {}
void PScopypage(void) {}
//Warning:  This function has no effect in NeXTSTEP.
void PScos(void) {}
void PScount(int *pn) {}
void PScountdictstack(int *plength) {}
void PScountexecstack(int *pcount) {}
void PScountframebuffers(int *pcount) {}
void PScountscreenlist(int context, int *pcount) {}
void PScounttomark(int *pn) {}
void PScountwindowlist(int context, int *pcount) {}
void PScshow(char *string) {}
void PScurrentactiveapp(int *pcontext) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PScurrentalpha(float *pcoverage) {}
void PScurrentblackgeneration(void) {}
void PScurrentcacheparams(void) {}
void PScurrentcmykcolor(float *pc, float *pm, float *py, float *pk) {}
void PScurrentcolor(void) {}
void PScurrentcolorrendering(void) {}
void PScurrentcolorscreen(void) {}
void PScurrentcolorspace(void) {}
void PScurrentcolortransfer(void) {}
void PScurrentcontext(int *pcontext) {}
void PScurrentdash(void) {}
void PScurrentdefaultdepthlimit(int *plimit) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PScurrentdeviceinfo(PS_userobject window, int *pMinBPS, int *pMaxBPS, int *pColor) {}
void PScurrentdevparams(char *device) {}
void PScurrentdict(void) {}
void PScurrenteventmask(PS_userobject window, int *pmask) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PScurrentfile(void) {}
void PScurrentflat(float *pflatness) {}
void PScurrentfont(void) {}
void PScurrentframebuffertransfer(void) {}
void PScurrentglobal(int *b) {}
void PScurrentgray(float *pgray) {}
void PScurrentgstate(PS_userobject gstate) {}
void PScurrenthalftone(void) {}
void PScurrenthalftonephase(float *px, float *py) {}
void PScurrenthsbcolor(float *ph, float *ps, float *pb) {}
void PScurrentlinecap(int *plinecap) {}
void PScurrentlinejoin(int *plinejoin) {}
void PScurrentlinewidth(float *pwidth) {}
void PScurrentmatrix(void) {}
void PScurrentmiterlimit(float *plimit) {}
void PScurrentmouse(PS_userobject window, float *px, float *py) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PScurrentobjectformat(int *pcode) {}
void PScurrentoverprint(int *b) {}
void PScurrentowner(PS_userobject window, int *pcontext) {}
void PScurrentpacking(int *pflag) {}
void PScurrentpagedevice(void) {}
void PScurrentpoint(float *px, float *py) {}
void PScurrentrgbcolor(float *pr, float *pg, float *pb) {}
void PScurrentrusage(float *pnow, float *puTime, float *psTime, int *pmsgSend, int *pmsgReceive, int *pnSignals, int *pnVCSw, int *pnIvCSw) {}
void PScurrentscreen(void) {}
void PScurrentshared(int *pflag) {}
void PScurrentshowpageprocedure(void) {}
void PScurrentstrokeadjust(int *pflag) {}
void PScurrentsystemparams(void) {}
void PScurrenttobase(float x, float y, float *px, float *py) {}
void PScurrenttoscreen(float x, float y,float *px, float *py) {}
void PScurrenttransfer(void) {}
void PScurrentundercolorremoval(void) {}
void PScurrentuser(int *puid, int *pgid) {}
void PScurrentuserparams(void) {}
void PScurrentwaitcursorenabled(int *pflag) {}
void PScurrentwindow(int *pnum) {}
void PScurrentwindowalpha(PS_userobject window, int *palpha) {}
void PScurrentwindowbounds(PS_userobject window, float *px, float *py, float *pwidth, float *pheight) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PScurrentwindowdepth(PS_userobject window, int *pdepth) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PScurrentwindowdepthlimit(PS_userobject window, int *plimit) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PScurrentwindowdict(PS_userobject window) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PScurrentwindowlevel(PS_userobject window, int *plevel) {}
void PScurrentwriteblock(int *pflag) {}
void PScurveto(float x1, float y1, float x2, float y2, float x3, float y3) {}
void PScvi(void) {}
void PScvlit(void) {}
void PScvn(void) {}
void PScvr(void) {}
void PScvrs(void) {}
void PScvs(void) {}
void PScvx(void) {}
void PSdef(void) {}
void PSdefaultmatrix(void) {}
void PSdefinefont(void) {}
void PSdefineresource(char *category) {}
void PSdefineusername(int index, char *name) {}
void PSdefineuserobject(void) {}
//Warning:  Use DPSDefineUserObject() instead.
void PSdeletefile(char *filename) {}
void PSdetach(void) {}
void PSdeviceinfo(void) {}
void PSdict(int length) {}
void PSdictstack(void) {}
void PSdissolve(float srcx, float srcy, float width, float height, PS_userobject srcGstate, float destx, float desty, float delta) {}
void PSdiv(void) {}
void PSdtransform(float x, float y, float *px, float *py) {}
void PSdumpwindow(int level, PS_userobject window) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSdumpwindows(int level, PS_userobject context) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSdup(void) {}
void PSecho(int flag) {}
void PSend(void) {}
void PSeoclip(void) {}
void PSeofill(void) {}
void PSeoviewclip(void) {}
void PSeq(void) {}
void PSequals(void) {}
void PSequalsequals(void) {}
void PSerasepage(void) {}
//Warning:  This function is different in NeXTSTEP.
void PSerrordict(void) {}
void PSexch(void) {}
void PSexec(void) {}
void PSexecform(void) {}
void PSexecstack(void) {}
void PSexecuteonly(void) {}
void PSexecuserobject(int index) {}
void PSexit(void) {}
void PSexp(void) {}
void PSfalse(void) {}
void PSfile(char *name, char *access) {}
void PSfilenameforall(void) {}
void PSfileposition(int *ppos) {}
void PSfill(void) {}
void PSfilter(void) {}
void PSfindencoding(char *key) {}
void PSfindfont(char *name) {}
void PSfindresource(char *key, char *category) {}
void PSfindwindow(float x, float y, int place, PS_userobject otherWindow, float *px, float *py, int *pwinFound, int *pdidFind) {}
void PSflattenpath(void) {}
void PSfloor(void) {}
void PSflush(void) {}
void PSflushfile(void) {}
void PSflushgraphics(void) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSFontDirectory(void) {}
void PSfor(void) {}
void PSforall(void) {}
void PSfork(void) {}
void PSframebuffer(int index, int nameLength, char name[], int *pslot, int *punit, int *pROMid, int *px, int *py, int *pwidth, int *pheight, int *pdepth) {}
void PSfrontwindow(int *pnum) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSgcheck(int *b) {}
void PSge(void) {}
void PSget(void) {}
void PSgetboolean(int *pflag) {}
void PSgetchararray(int size, char string[]) {}
void PSgetfloat(float *pvalue) {}
void PSgetfloatarray(int size, float array[]) {}
void PSgetint(int *pvalue) {}
void PSgetintarray(int size, float array[]) {}
void PSgetinterval(void) {}
void PSgetstring(char *string) {}
void PSGlobalFontDirectory(void) {}
void PSglobaldict(void) {}
void PSglyphshow(char *name) {}
void PSgrestore(void) {}
void PSgrestoreall(void) {}
void PSgsave(void) {}
void PSgstate(void) {}
void PSgt(void) {}
void PShidecursor(void) {}
void PShideinstance(float x, float y, float width, float height) {}
void PSidentmatrix(void) {}
void PSidiv(void) {}
void PSidtransform(float x, float y, float *px, float *py) {}
void PSif(void) {}
void PSifelse(void) {}
void PSimage(void) {}
void PSimagemask(void) {}
void PSindex(int n) {}
void PSineofill(float x, float y, int *pflag) {}
void PSinfill(float x, float y, int *pflag) {}
void PSinitclip(void) {}
void PSiniteventtimes(void) {}
void PSinitgraphics(void) {}
//Warning:  This function is different in NeXTSTEP.
void PSinitmatrix(void) {}
void PSinitviewclip(void) {}
void PSinstroke(float x, float y, int *pflag) {}
void PSinueofill(float x, float y, char nums[], int n, char ops[], int l, int *pflag) {}
void PSinufill(float x, float y, char nums[], int n, char ops[], int l, int *pflag) {}
void PSinustroke(float x, float y, char nums[], int n, char ops[], int l, int *pflag) {}
void PSinvertmatrix(void) {}
void PSISOLatin1Encoding(void) {}
void PSitransform(float x, float y, float *px, float *py) {}
void PSjoin(void) {}
void PSknown(int *pflag) {}
void PSkshow(char *string) {}
void PSlanguagelevel(int *n) {}
void PSle(void) {}
void PSleftbracket(void) {}
void PSleftleft(void) {}
void PSlength(int *pn) {}
void PSlineto(float x, float y) {}
void PSln(void) {}
void PSload(void) {}
void PSlock(void) {}
void PSlog(void) {}
void PSloop(void) {}
void PSlt(void) {}
void PSmachportdevice(int w, int h, int bbox[], int bboxSize, float matrix[], char *phost, char *pport, char *ppixelDict) {}
void PSmakefont(void) {}
void PSmakepattern(void) {}
void PSmark(void) {}
void PSmatrix(void) {}
void PSmaxlength(int *plength) {}
void PSmod(void) {}
void PSmonitor(void) {}
void PSmoveto(float x, float y) {}
void PSmovewindow(float x, float y, PS_userobject window) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSmul(void) {}
void PSne(void) {}
void PSneg(void) {}
void PSnewinstance(void) {}
void PSnewpath(void) {}
void PSnextrelease(int size, char string[]) {}
void PSnoaccess(void) {}
void PSnot(void) {}
void PSnotify(void) {}
void PSnull(void) {}
void PSnulldevice(void) {}
void PSobscurecursor(void) {}
void PSor(void) {}
void PSorderwindow(int place, PS_userobject otherWindow, PS_userobject window) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSosname(int size, char string[]) {}
void PSostype(int *ptype) {}
void PSpackedarray(void) {}
void PSpathbbox(float *pllx, float *plly, float *purx, float *pury) {}
void PSpathforall(void) {}
void PSplacewindow(float x, float y, float width, float height, PS_userobject window) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSplaysound(char *name, int priority) {}
void PSpop(void) {}
void PSposteventbycontext(int type, float x, float y, int time, int flags, int window, int subtype, int data1, int data2, int context, int *psuccess ) {}
void PSprint(void) {}
void PSprinteventtimes(void) {}
void PSprintobject(int code) {}
void PSproduct(void) {}
void PSprompt(void) {}
void PSpstack(void) {}
void PSput(void) {}
void PSputinterval(void) {}
void PSquit(void) {}
void PSrand(void) {}
void PSrcheck(int *pflag) {}
void PSrcurveto(float x, float y, float x2, float y2, float x3, float y3) {}
void PSread(int *pflag) {}
void PSreadhexstring(int *pflag) {}
void PSreadimage(void) {}
void PSreadline(int *pflag) {}
void PSreadonly(void) {}
void PSreadstring(int *pflag) {}
void PSrealtime(int *pi) {}
void PSrectclip(float x, float y, float width, float height) {}
void PSrectfill(float x, float y, float width, float height) {}
void PSrectstroke(float x, float y, float width, float height) {}
void PSrectviewclip(float x, float y, float width, float height) {}
void PSrenamefile(char *old, char *new) {}
void PSrepeat(void) {}
void PSresetfile(void) {}
void PSresourceforall(char *category) {}
void PSresourcestatus(char *key, char *category, int *b) {}
void PSrestore(void) {}
void PSrevealcursor(void) {}
void PSreversepath(void) {}
void PSrevision(int *n) {}
void PSrightbracket(void) {}
void PSrightbuttondown(int *pflag) {}
void PSrightright(void) {}
void PSrightstilldown(int eventNum, int *pflag) {}
void PSrlineto(float x, float y) {}
void PSrmoveto(float x, float y) {}
void PSrootfont(void) {}
void PSroll(int n, int j) {}
void PSrotate(float angle) {}
void PSround(void) {}
void PSrrand(void) {}
void PSrun(char *name) {}
void PSsave(void) {}
void PSscale(float sx, float sy) {}
void PSscalefont(float size) {}
void PSscheck(int *pflag) {}
void PSscreenlist(int context, int count, int windows[]) {}
void PSscreentobase(float x, float y, float *px, float *py) {}
void PSscreentocurrent(float x, float y, float *px, float *py) {}
void PSsearch(int *pflag) {}
void PSselectfont(char *name, float scale) {}
void PSsendboolean(int flag) {}
void PSsendchararray(char string[], int size) {}
void PSsendfloat(float value) {}
void PSsendfloatarray(float array[], int size) {}
void PSsendint(int value) {}
void PSsendintarray(int array[], int size) {}
void PSsendstring(char *string) {}
void PSserialnumber(int *n) {}
void PSsetactiveapp(int context) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSsetalpha(float coverage) {}
void PSsetautofill(int flag, PS_userobject window) {}
void PSsetbbox(float llx, float lly, float urx, float ury) {}
void PSsetblackgeneration(void) {}
void PSsetcachedevice(float wx, float wy, float llx, float lly, float urx, float ury) {}
void PSsetcachelimit(float num) {}
void PSsetcacheparams(void) {}
void PSsetcharwidth(float wx, float wy) {}
void PSsetcmykcolor(float c, float m, float y, float k) {}
void PSsetcolor(void) {}
void PSsetcolorrendering(void) {}
void PSsetcolorscreen(void) {}
void PSsetcolorspace(void) {}
void PSsetcolortransfer(void) {}
void PSsetcursor(float x, float y, float mx, float my) {}
void PSsetdash(float pattern[], int size, float offset) {}
void PSsetdefaultdepthlimit(int limit) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSsetdevparams(void) {}
void PSseteventmask(int mask, PS_userobject window) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSsetexposurecolor(void) {}
void PSsetfileposition(int pos) {}
void PSsetflat(float flatness) {}
void PSsetflushexposures(int flag) {}
void PSsetfont(PS_userobject font) {}
void PSsetframebuffertransfer(void) {}
void PSsetglobal(int b) {}
void PSsetgray(float num) {}
void PSsetgstate(PS_userobject gstate) {}
void PSsethalftone(void) {}
void PSsethalftonephase(float x, float y) {}
void PSsethsbcolor(float hue, float sat, float brt) {}
void PSsetinstance(int flag) {}
void PSsetlinecap(int linecap) {}
void PSsetlinejoin(int linejoin) {}
void PSsetlinewidth(float width) {}
void PSsetmatrix(void) {}
void PSsetmiterlimit(float limit) {}
void PSsetmouse(float x, float y) {}
void PSsetobjectformat(int code) {}
void PSsetoverprint(int b) {}
void PSsetowner(PS_userobject context, PS_userobject window) {}
void PSsetpacking(int flag) {}
void PSsetpagedevice(void) {}
void PSsetpattern(int patternDict) {}
void PSsetrgbcolor(float red, float green, float blue) {}
void PSsetscreen(void) {}
void PSsetsendexposed(int flag, PS_userobject window) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSsetshared(int flag) {}
void PSsetshowpageprocedure(int win) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSsetstrokeadjust(int flag) {}
void PSsetsystemparams(void) {}
void PSsettrackingrect(float x, float y, float width, float height, int leftFlag, int rightFlag, int inside, int userData, int trectNum, PS_userobject gstate) {}
void PSsettransfer(void) {}
void PSsetucacheparams(void) {}
void PSsetundercolorremoval(void) {}
void PSsetuserparams(void) {}
void PSsetvmthreshold(int i) {}
void PSsetwaitcursorenabled(int flag) {}
void PSsetwindowdepthlimit(int limit, PS_userobject window) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSsetwindowdict(PS_userobject window) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSsetwindowlevel(int level, PS_userobject window) {}
void PSsetwindowtype(int type, PS_userobject window) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSsetwriteblock(int flag) {}
void PSshareddict(void) {}
void PSSharedFontDirectory(void) {}
void PSshow(char *string) {}
void PSshowcursor(void) {}
void PSshowpage(void) {}
//Warning:  This function is different in NeXTSTEP.
void PSsin(void) {}
void PSsizeimage(float x, float y, float width, float height, int *ppixelsWide, int *ppixelsHigh, int *pbitsPerSample, float matrix[], int *pmultiProc, int *pnColors) {}
void PSsqrt(void) {}
void PSsrand(void) {}
void PSstack(void) {}
void PSStandardEncoding(void) {}
void PSstart(void) {}
void PSstartjob(int b, char *password) {}
void PSstatus(int *pflag) {}
void PSstatusdict(void) {}
void PSstilldown(int eventNum, int *pflag) {}
void PSstop(void) {}
void PSstopped(void) {}
void PSstore(void) {}
void PSstring(int length) {}
void PSstringwidth(char *string, float *px, float *py) {}
void PSstroke(void) {}
void PSstrokepath(void) {}
void PSsub(void) {}
void PSsystemdict(void) {}
void PStermwindow(PS_userobject window) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PStoken(int *pflag) {}
void PStransform(float x, float y, float *px, float *py) {}
void PStranslate(float x, float y) {}
void PStrue(void) {}
void PStruncate(void) {}
void PStype(void) {}
void PSuappend(char nums[], int n, char ops[], int l) {}
void PSucache(void) {}
void PSucachestatus(void) {}
void PSueofill(char nums[], int n, char ops[], int l) {}
void PSufill(char nums[], int n, char ops[], int l) {}
void PSundef(char *name) {}
void PSundefinefont(char *name) {}
void PSundefineresource(char *key, char *category) {}
void PSundefineuserobject(int index) {}
void PSupath(int flag) {}
void PSuserdict(void) {}
void PSuserobject(void) {}
void PSusertime(int *pmillisecs) {}
void PSustroke(char nums[], int n, char ops[], int l) {}
void PSustrokepath(char nums[], int n, char ops[], int l) {}
void PSversion(int bufsize, char buf[]) {}
void PSviewclip(void) {}
void PSviewclippath(void) {}
void PSvmreclaim(int code) {}
void PSvmstatus(int *plevel, int *pused, int *pmax) {}
void PSwait(void) {}
void PSwcheck(int *pflag) {}
void PSwhere(int *pflag) {}
void PSwidthshow(float x, float y, int c, char *string) {}
void PSwindow(float x, float y, float width, float height, int type, int *pwindow) {}
//Warning:  Don't use this function if you're using the Application Kit.
void PSwindowdevice(PS_userobject window) {}
void PSwindowdeviceround(PS_userobject window) {}
void PSwindowlist(int context, int count, int windows[]) {}
void PSwrite(void) {}
void PSwritehexstring(void) {}
void PSwriteobject(int code) {}
void PSwritestring(void) {}
void PSwtranslation(float *px, float *py) {}
void PSxcheck(int *pflag) {}
void PSxor(void) {}
void PSxshow(char *string, float numArray[], int size) {}
void PSxyshow(char *string, float numArray[], int size) {}
void PSyield(void) {}
void PSyshow(char *string, float numArray[], int size) {}

