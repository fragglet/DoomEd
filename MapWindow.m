#import "MapWindow.h"
#import "MapView.h"
#import "PopScrollView.h"
#import "EditWorld.h"

NSSize	minsize = {256, 256};
NSSize	newsize = {400, 400};

static	int	cornerx = 128, cornery = 64;

@implementation MapWindow

- initFromEditWorld
{
	id		oldobj_i;
	NSRect	screensize;
	NSRect	wframe;
	NSPoint	origin;
	NSRect	mapbounds;
	NSScreen *scrn;

//
// set up the window
//
	scrn = [NSScreen mainScreen];
	screensize = [scrn visibleFrame];
	if (cornerx + newsize.width > screensize.size.width - 70)
		cornerx = 128;
	if (cornery + newsize.height > screensize.size.height - 70)
		cornery = 64;
	wframe.origin.x = cornerx;
	wframe.origin.y = screensize.size.height - newsize.height - cornery;
	wframe.size = newsize;

#if 0
	cornerx += 32;
	cornery += 32;
#endif
	[self initWithContentRect: wframe
	      styleMask: NSResizableWindowMask
	      backing: NSBackingStoreBuffered
	      defer: NO
	      screen: scrn
	// buttonMask:		NX_CLOSEBUTTONMASK | NX_MINIATURIZEBUTTONMASK
	];

	[self	setMinSize:	minsize];

// initialize the map view
	mapview_i = [[MapView alloc] initFromEditWorld];
	[scrollview_i setAutoresizingMask:
		NSViewWidthSizable | NSViewHeightSizable];

// initialize the pop up menus
//
	scalebutton_i = [[NSPopUpButton alloc]
		initWithFrame: CGRectZero
		pullsDown: NO
	];
	[scalebutton_i setTarget: mapview_i];
	[scalebutton_i setAction: @selector(scaleMenuTarget:)];

	[scalebutton_i addItemWithTitle: @"3.125%"];
	[scalebutton_i addItemWithTitle: @"6.25%"];
	[scalebutton_i addItemWithTitle: @"12.5%"];
	[scalebutton_i addItemWithTitle: @"25%"];
	[scalebutton_i addItemWithTitle: @"50%"];
	[scalebutton_i addItemWithTitle: @"100%"];
	[scalebutton_i addItemWithTitle: @"200%"];
	[scalebutton_i addItemWithTitle: @"400%"];
	[scalebutton_i selectItemAtIndex: 5];

	gridbutton_i = [[NSPopUpButton alloc]
		initWithFrame: CGRectZero
		pullsDown: NO
	];
	[gridbutton_i setTarget: mapview_i];
	[gridbutton_i setAction: @selector(gridMenuTarget:)];

	[gridbutton_i addItemWithTitle: @"grid 1"];
	[gridbutton_i addItemWithTitle: @"grid 2"];
	[gridbutton_i addItemWithTitle: @"grid 4"];
	[gridbutton_i addItemWithTitle: @"grid 8"];
	[gridbutton_i addItemWithTitle: @"grid 16"];
	[gridbutton_i addItemWithTitle: @"grid 32"];
	[gridbutton_i addItemWithTitle: @"grid 64"];

	[gridbutton_i selectItemAtIndex: 3];

// initialize the scroll view
	wframe.origin.x = wframe.origin.y = 0;
	scrollview_i = [[PopScrollView alloc]
		initWithFrame: 	wframe
		button1: scalebutton_i
		button2: gridbutton_i
	];
	[scrollview_i setAutoresizingMask:
		NSViewWidthSizable | NSViewHeightSizable];

// link objects together
	[self setDelegate: self];

	[scrollview_i setDocView: mapview_i];
	[self  setContentView: scrollview_i];

// scroll to the middle
	mapbounds = [editworld_i getBounds];
	origin.x = mapbounds.origin.x + mapbounds.size.width / 2 - newsize.width /2;
	origin.y = mapbounds.origin.y + mapbounds.size.height / 2 - newsize.width /2;
	[mapview_i setOrigin: origin scale:1];

	return self;
}

- mapView
{
	return mapview_i;
}

- scalemenu
{
	return scalemenu_i;
}

- scalebutton
{
	return scalebutton_i;
}


- gridmenu
{
	return gridmenu_i;
}

- gridbutton
{
	return gridbutton_i;
}


- reDisplay: (NSRect *)dirty
{
	[mapview_i displayDirty: dirty];
	return self;
}

/*
=============================================================================

					DELEGATE METHODS

=============================================================================
*/

/*
=================
=
= windowWillResize: toSize:
=
= note the origin of the window on the screen so that windowDidResize can change the
= MapView origin if the origin corner of the window is moved.
=
= This will be called continuosly during resizing, even though it only needs to be called once.
=
==================
*/

- windowWillResize:sender toSize:(NSSize *)frameSize
{
	oldscreenorg.x = oldscreenorg.y = 0;
	[self convertBaseToScreen: oldscreenorg];
	presizeorigin = [mapview_i getCurrentOrigin];
	return self;
}

/*
======================
=
= windowDidResize:
=
= expand / shrink bounds
= When this is called all the views have allready been resized and possible scrolled (sigh)
=
======================
*/

- windowDidResize:sender
{
	NSRect	wincont, scrollcont;
	float		scale;
	NSPoint	newscreenorg;

//
// change frame if needed
//	
	newscreenorg.x = newscreenorg.y = 0;
	[self convertBaseToScreen: newscreenorg];

	scale = [mapview_i currentScale];
	presizeorigin.x += (newscreenorg.x - oldscreenorg.x)/scale;
	presizeorigin.y += (newscreenorg.y - oldscreenorg.y)/scale;
	[mapview_i setOrigin: presizeorigin];

//
// resize drag image
//
	wincont = [NSWindow contentRectForFrameRect: [self frame]
	                    styleMask: NSResizableWindowMask];

	scrollcont.size = [NSScrollView contentSizeForFrameSize: wincont.size
	                                hasHorizontalScroller: YES
					hasVerticalScroller: YES
					borderType: NSNoBorder];
	return self;
}


@end
