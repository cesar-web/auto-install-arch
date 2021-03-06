/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 2;        /* gaps between windows */
static const unsigned int snap      = 30;       /* snap pixel */
static const int vertpad            = 0;        /* vertical padding of bar */
static const int sidepad            = 0;        /* horizontal padding of bar */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "JetBrains Mono:size=10"};
static const char dmenufont[]       = "JetBrains Mono:size=10";
static char normbgcolor[]           = "#222222";
static char normbordercolor[]       = "#444444";
static char normfgcolor[]           = "#bbbbbb";
static char selfgcolor[]            = "#eeeeee";
static char selbordercolor[]        = "#d99a25";
static char selbgcolor[]            = "#d99a25";
static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

/* tagging */
//static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
//static const char *tagsalt[] = { "", "", "", "", "", "", "", "", "" };
static const char *tags[] = { "U", "I", "O", "P" };
static const char *tagsalt[] = { "1", "2", "3", "4" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
//	{ "mpv",      NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
    { "TLE",      tile },
    { "STK",      monocle },
	{ "CTM",      centeredmaster },
	{ "FLT",      NULL },    /* no layout function means floating behavior */
	//{ ">M>",      centeredfloatingmaster },
};

/* key definitions */
#define MODALT Mod1Mask
//#define MODSUP Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODALT,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODALT|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODALT|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODALT|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbordercolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "alacritty", NULL };
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "alacritty", "-t", scratchpadname, NULL };

#include "movestack.c"
static Key keys[] = {
	/* modifier                     key        function        argument */

    // Lanuch programs (most of the programs are in xbindkeysrc)
    { MODALT,                       XK_Return, spawn,          {.v = termcmd } },
    { MODALT,                       XK_minus,  killclient,     {0} },
    { MODALT|ShiftMask,             XK_q,      killclient,     {0} },
    { MODALT,                       XK_a,      setlayout,      {0} },

    // Manipulate windows
	{ MODALT,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODALT,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODALT|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
	{ MODALT|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	{ MODALT,                       XK_n,      incnmaster,     {.i = +1 } },
	{ MODALT,                       XK_m,      incnmaster,     {.i = -1 } },
	{ MODALT,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODALT,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODALT|ShiftMask,             XK_Return, zoom,           {0} },

    { MODALT,                       XK_space,  togglescratch,  {.v = scratchpadcmd } },
	{ MODALT|ShiftMask,             XK_space,  togglesticky,   {0} },
	{ MODALT,                       XK_f,      togglefullscr,  {0} },

    // Multiple monitors
	{ MODALT,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODALT,                       XK_period, focusmon,       {.i = +1 } },
	{ MODALT|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODALT|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODALT,                       XK_F5,     xrdb,           {.v = NULL } },

    // dwm status
    { MODALT,                       XK_d,      togglebar,      {0} },
	{ MODALT|ShiftMask,             XK_d,      togglealttag,   {0} },

    // Gaps
	{ MODALT,                       XK_z,      setgaps,        {.i = -1 } },
	{ MODALT|ShiftMask,             XK_z,      setgaps,        {.i = +1 } },

    // Change layouts
    { MODALT,                       XK_q,      setlayout,      {.v = &layouts[0]} },
    { MODALT,                       XK_w,      setlayout,      {.v = &layouts[2]} },
    { MODALT,                       XK_e,      setlayout,      {.v = &layouts[1]} },
    { MODALT,                       XK_r,      setlayout,      {.v = &layouts[3]} },

    // Move through tags
    { MODALT,                       XK_Tab,    view,           {0} },
    { MODALT,                       XK_0,      view,           {.ui = ~0 } },
    { MODALT|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	TAGKEYS(                        XK_u,                      0)
	TAGKEYS(                        XK_i,                      1)
	TAGKEYS(                        XK_o,                      2)
    TAGKEYS(                        XK_p,                      3)
	{ MODALT|ControlMask,           XK_x,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODALT,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODALT,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODALT,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODALT,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODALT,         Button3,        toggletag,      {0} },
};

void
setlayoutex(const Arg *arg)
{
	setlayout(&((Arg) { .v = &layouts[arg->i] }));
}

void
viewex(const Arg *arg)
{
	view(&((Arg) { .ui = 1 << arg->ui }));
}

void
viewall(const Arg *arg)
{
	view(&((Arg){.ui = ~0}));
}

void
toggleviewex(const Arg *arg)
{
	toggleview(&((Arg) { .ui = 1 << arg->ui }));
}

void
tagex(const Arg *arg)
{
	tag(&((Arg) { .ui = 1 << arg->ui }));
}

void
toggletagex(const Arg *arg)
{
	toggletag(&((Arg) { .ui = 1 << arg->ui }));
}

void
tagall(const Arg *arg)
{
	tag(&((Arg){.ui = ~0}));
}

/* signal definitions */
/* signum must be greater than 0 */
/* trigger signals using `xsetroot -name "fsignal:<signame> [<type> <value>]"` */
static Signal signals[] = {
	/* signum           function */
	{ "focusstack",     focusstack },
	{ "setmfact",       setmfact },
	{ "togglebar",      togglebar },
	{ "incnmaster",     incnmaster },
	{ "togglefloating", togglefloating },
	{ "focusmon",       focusmon },
	{ "tagmon",         tagmon },
	{ "zoom",           zoom },
	{ "view",           view },
	{ "viewall",        viewall },
	{ "viewex",         viewex },
	{ "toggleview",     view },
	{ "toggleviewex",   toggleviewex },
	{ "tag",            tag },
	{ "tagall",         tagall },
	{ "tagex",          tagex },
	{ "toggletag",      tag },
	{ "toggletagex",    toggletagex },
	{ "killclient",     killclient },
	{ "quit",           quit },
	{ "setlayout",      setlayout },
	{ "setlayoutex",    setlayoutex },
};
