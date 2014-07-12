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
	NSSize	screensize;
	NSRect	wframe;
	NSPoint	origin;
	NSRect	mapbounds;

//
// set up the window
//		
	[NSApp getScreenSize: &screensize];
	if (cornerx + newsize.width > screensize.width - 70)
		cornerx = 128;
	if (cornery + newsize.height > screensize.height - 70)
		cornery = 64;
	wframe.origin.x = cornerx;
	wframe.origin.y = screensize.height - newsize.height - cornery;
	wframe.size = newsize;

#if 0
	cornerx += 32;
	cornery += 32;
#endif
	[self initWithContentRect: wframe
	      styleMask: NSResizableWindowMask
	      backing: NSBackingStoreBuffered
	      defer: NO
	      screen: nil
	// buttonMask:		NX_CLOSEBUTTONMASK | NX_MINIATURIZEBUTTONMASK
	];

	[self	setMinSize:	minsize];

// initialize the map view
	mapview_i = [[MapView alloc] initFromEditWorld];
	[scrollview_i setAutoresizingMask:
		NSViewWidthSizable | NSViewHeightSizable];

// initialize the pop up menus
//
	scalemenu_i = [[PopUpList alloc] init];
	[scalemenu_i setTarget: mapview_i];
	[scalemenu_i setAction: @selector(scaleMenuTarget:)];

	[scalemenu_i addItem: "3.125%"];
	[scalemenu_i addItem: "6.25%"];
	[scalemenu_i addItem: "12.5%"];
	[scalemenu_i addItem: "25%"];
	[scalemenu_i addItem: "50%"];
	[scalemenu_i addItem: "100%"];
	[scalemenu_i addItem: "200%"];
	[scalemenu_i addItem: "400%"];
	[[scalemenu_i itemList] selectCellAtRow: 5 column: 0];
	
	scalebutton_i = NXCreatePopUpListButton(scalemenu_i);


	gridmenu_i = [[PopUpList alloc] init];
	[gridmenu_i setTarget: mapview_i];
	[gridmenu_i setAction: @selector(gridMenuTarget:)];

	[gridmenu_i addItem: "grid 1"];
	[gridmenu_i addItem: "grid 2"];
	[gridmenu_i addItem: "grid 4"];
	[gridmenu_i addItem: "grid 8"];
	[gridmenu_i addItem: "grid 16"];
	[gridmenu_i addItem: "grid 32"];
	[gridmenu_i addItem: "grid 64"];
	
	[[gridmenu_i itemList] selectCellAtRow: 3 column: 0];
	
	gridbutton_i = NXCreatePopUpListButton(gridmenu_i);

// initialize the scroll view
	wframe.origin.x = wframe.origin.y = 0;
	scrollview_i = [[PopScrollView alloc] 
		initFrame: 	&wframe 
		button1: 		scalebutton_i
		button2:		gridbutton_i
	];
	[scrollview_i setAutoresizingMask:
		NSViewWidthSizable | NSViewHeightSizable];

// link objects together
	[self setDelegate: self];

	[scrollview_i setDocView: mapview_i];
	[self  setContentView: scrollview_i];

// scroll to the middle
	[editworld_i getBounds: &mapbounds];
	origin.x = mapbounds.origin.x + mapbounds.size.width / 2 - newsize.width /2;
	origin.y = mapbounds.origin.y + mapbounds.size.height / 2 - newsize.width /2;
	[mapview_i setOrigin: &origin scale:1];

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
	[mapview_i getCurrentOrigin: &presizeorigin];
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
	[mapview_i setOrigin: &presizeorigin];

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
