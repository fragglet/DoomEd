#import "MapView.h"
#import "MapWindow.h"
#import "PreferencePanel.h"
#import "Timing.h"
#import "ToolPanel.h"
#import "SettingsPanel.h"
#import "Coordinator.h"
#import "pathops.h"
#include <ctype.h>

// some arrays are shared by all mapview for temporary drawing data

BOOL	linecross[9][9];

#define MAXPOINTS	200

@implementation MapView

+ (void) initialize
{
	int	x1,y1,x2,y2;
	
	for (x1=0 ; x1<3 ; x1++)
		for (y1=0 ; y1<3 ; y1++)
			for (x2=0 ; x2<3 ; x2++)
				for (y2=0 ; y2<3 ; y2++)
				{
					if  ( ( (x1<=1 && x2>=1) || (x1>=1 && x2<=1) ) 
					&& ( (y1<=1 && y2>=1) || (y1>=1 && y2<=1) ) )
						linecross[y1*3+x1][y2*3+x2] = YES;
					else
						linecross[y1*3+x1][y2*3+x2] = NO;
				}
		
	return self;
}


/*
==================
=
= initFromEditWorld
=
==================
*/

-initFromEditWorld
{
	NSRect	aRect;

	 if (![editworld_i loaded])
	 {
		NSRunAlertPanel(@"Error",
			@"MapView inited with NULL world",
			nil, nil, nil);
		return NULL;
	}
	
	gridsize = 8;		// these are changed by the pop up menus
	scale = 1;
	
	NXSetRect (&aRect, 0,0, 100,100);	// call -setOrigin after installing in clip view
	[super initWithFrame: aRect];			// to set the proper rectangle
	[self setOpaque: YES];
		
	return self;
}


#define TESTOPS	1000

- testSpeed: sender
{
        id 		t4;
	NXStream	*stream;
	int		i;
	
        t4 = [Timing newWithTag:4];
		
	stream = NXOpenMemory (NULL, 0, NX_WRITEONLY);
	
printf ("Display\n");	
	[t4 reset];
	for (i=0 ; i<10 ; i++)
	{
		[t4 enter: WALLTIME];
		[self display];
		[t4 leave];
	}
	[t4 summary: stream];
printf ("No flush\n");	
	[t4 reset];
	[[self window] disableFlushWindow];
	for (i=0 ; i<10 ; i++)
	{
		[t4 enter: WALLTIME];
		[self display];
		[t4 leave];
	}
	[[self window] reenableFlushWindow];
	[t4 summary: stream];
	
	NXSaveToFile (stream, "/aardwolf/Users/johnc/timing.txt");
	NXClose (stream);
printf ("Done\n");	
	
	return self;
}

/*
=====================
=
= worldBoundsChanged
=
= adjust the frame rect and redraw scalers
=
=====================
*/

- worldBoundsChanged
{
	return self;
}



/*
====================
=
= scaleMenuTarget:
=
= Called when the scaler popup on the window is used
=
====================
*/

- scaleMenuTarget: sender
{
	NSString *item;
	float nscale;
	NSRect visrect;

	item = [sender titleOfSelectedItem];
	sscanf([item UTF8String], "%f", &nscale);
	nscale /= 100;

	if (nscale == scale)
		return NULL;

	// try to keep the center of the view constant
	visrect = [[self superview] visibleRect];
	visrect = [self convertRect: visrect fromView: [self superview]];
	visrect.origin.x += visrect.size.width/2;
	visrect.origin.y += visrect.size.height/2;

	[self zoomFrom: visrect.origin toScale: nscale];

	return self;
}


/*
====================
=
= gridMenuTarget:
=
= Called when the scaler popup on the window is used
=
====================
*/

- gridMenuTarget: sender
{
	NSString *item;
	int grid;

	item = [sender titleOfSelectedItem];
	sscanf([item UTF8String], "grid %d", &grid);

	if (grid == gridsize)
		return NULL;

	gridsize = grid;
	[self display];

	return self;
}

/*
===============================================================================

						FIRST RESPONDER METHODS

===============================================================================
*/

- cut: sender
{
	[editworld_i cut:sender];
}

- copy: sender
{
	[editworld_i copy:sender];
}

- paste: sender
{
	[editworld_i paste:sender];
}

- delete: sender
{
	[editworld_i delete:sender];
}

/*
===============================================================================

							RETURN INFO

===============================================================================
*/

- (BOOL)acceptsFirstMouse
{
	return YES;
}

- (float)currentScale
{
	return scale;
}


/*
================
=
= getCurrentOrigin
=
= Returns the global map coordinates (unscaled) of the lower left corner
=
================
*/

- (NSPoint) getCurrentOrigin
{
	NSRect	global;
	NSRect pt;

	global = [[self superview] bounds];

	return [self convertPoint: global.origin fromView: [self superview]];
}

- printInfo: sender
{
	NSPoint	wrld;

	wrld = [self getCurrentOrigin];
	printf ("getCurrentOrigin: %f, %f\n",wrld.x,wrld.y);

	return self;
}


/*
====================
=
= displayDirty:
=
= Adjust for the scale and size of control points and line tics
=
====================
*/

- displayDirty: (NSRect const *)dirty
{
	NSRect	rect;
	float		adjust;
	
	adjust = CPOINTDRAW*scale;
	if (adjust <= LINENORMALLENGTH)
		adjust = LINENORMALLENGTH+1;
		
	rect.origin.x = dirty->origin.x - adjust;
	rect.origin.y = dirty->origin.y - adjust;
	rect.size.width = dirty->size.width + adjust*2;
	rect.size.height = dirty->size.height + adjust*2;
	
	NXIntegralRect (&rect);
	
	return [self display: &rect : 1];
}


/*
===============================================================================

						UTILITY METHODS

===============================================================================
*/

/*
=======================
=
= getPointFrom:
=
= Returns the global (unscaled) world coordinates of an event location
=
=======================
*/

- (NSPoint) getGridPointFrom: (NSEvent const *)event
{
// convert to view coordinates
	NSPoint point;

	point = [event locationInWindow];
	point = [self convertPoint: point fromView: nil];

// adjust for grid
	point.x = (int)(((point.x)/gridsize)+0.5*(point.x<0?-1:1));
	point.y = (int)(((point.y)/gridsize)+0.5*(point.y<0?-1:1));
	point.x *= gridsize;
	point.y *= gridsize;
//	printf("X:%f\tY:%f\tgridsize:%d\n",point->x,point->y,gridsize);
	return point;
}

- (NSPoint) getPointFrom: (NSEvent const *)event
{
// convert to view coordinates
	NSPoint point;

	point = [event locationInWindow];
	return [self convertPoint:point fromView: nil];
}

/*
=================
=
= adjustFrameForOrigin:scale:
=
= Increases or decreases the frame size to accomodate a new origin and/or scale
= Org is in global map coordinates (unscaled)
= Does not redrawing, change the origin position, or scale
= Call this every time the window is scrolled, zoomed, resized, or the map bounds changes
=
==================
*/

- adjustFrameForOrigin: (NSPoint)org
{
	return [self adjustFrameForOrigin: org scale:scale];
}

- adjustFrameForOrigin: (NSPoint)org scale: (float)scl
{
	NSRect map;
	NSRect newbounds;
	NSRect viewbounds;
	
// the frame rect of the MapView is the union of the map rect and the visible rect
// if this is different from the current frame, resize it
	if (scl != scale)
	{
//printf ("changed scale\n");
		[self setDrawSize: [self frame].size.width/scl : [self frame].size.height/scl];
		scale = scl;
	}
	
	
//
// get the rects that is displayed in the superview
//
	newbounds = [[self superview] visibleRect];
	newbounds = [self convertRect: newbounds fromView: [self superview]];
	newbounds.origin = org;

	map = [editworld_i getBounds];

	NXUnionRect (&map, &newbounds);

	viewbounds = [self bounds];

	if (newbounds.size.width != viewbounds.size.width ||
	    newbounds.size.height != viewbounds.size.height)
	{
//printf ("changed size\n");
		[self sizeTo: newbounds.size.width*scale : newbounds.size.height*scale];
	}

	if (newbounds.origin.x != viewbounds.origin.x ||
	    newbounds.origin.y != viewbounds.origin.y)
	{
//printf ("changed origin\n");
		[self setDrawOrigin: newbounds.origin.x : newbounds.origin.y];
	}

	return self;
}


/*
=======================
=
= setOrigin: scale:
=
= Scrolls and/or scales the view to a new position and displays
= Org is in global map coordinates (unscaled)
= Do not call before the view is installed in a scroll view!
=
=======================
*/

- setOrigin: (NSPoint) org
{
	return [self setOrigin: org scale: scale];
}

- setOrigin: (NSPoint) org scale: (float)scl
{
	[self adjustFrameForOrigin: org scale:scl];
	[self scrollPoint: org];
	return self;
}

/*
====================
=
= zoomFrom:(NSPoint)origin scale:(float)newscale
=
= The origin is in screen pixels from the lower left corner of the clip view
=
====================
*/

- zoomFrom:(NSPoint)origin toScale:(float)newscale
{
	NSPoint		neworg, orgnow;
	
	[[self window] disableDisplay];		// don't redraw twice (scaling and translating)
//
// find where the point is now
//
	neworg = [self convertPoint: origin toView: nil];

//
// change scale
//
	[self setDrawSize: [self frame].size.width/newscale : [self frame].size.height/newscale];
	scale = newscale;

//
// convert the point back
//
	[self convertPoint: neworg fromView: NULL];
	orgnow = [self getCurrentOrigin];
	orgnow.x += origin.x - neworg.x;
	orgnow.y += origin.y - neworg.y;
	[self setOrigin: orgnow];

//
// redraw
// 
	[[self window] reenableDisplay];
	[[[self superview] superview] display];  // redraw everything just once
	
	return self;
}



@end

