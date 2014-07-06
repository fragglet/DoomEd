#import <appkit/appkit.h>
#import "EditWorld.h"

#define CPOINTSIZE	7		// size for clicking
#define CPOINTDRAW	4		// size for drawing

#define LINENORMALLENGTH	6	// length of line segment side normal
#define THINGDRAWSIZE		32

extern	BOOL	linecross[9][9];

@interface MapView: NSView
{
	float		scale;
	
	int		gridsize;
}

- initFromEditWorld;

- (float)currentScale;
- getCurrentOrigin: (NSPoint *)worldorigin;

- scaleMenuTarget: sender;
- gridMenuTarget: sender;

- zoomFrom:(NSPoint *)origin toScale:(float)newscale;

- displayDirty: (NSRect const *)dirty;

- getPoint:	(NSPoint *)point  from: 	(NXEvent const *)event;
- getGridPoint:	(NSPoint *)point  from: 	(NXEvent const *)event;

- adjustFrameForOrigin: (NSPoint const *)org scale:(float)scl;
- adjustFrameForOrigin: (NSPoint const *)org;
- setOrigin: (NSPoint const *)org scale: (float)scl;
- setOrigin: (NSPoint const *)org;

@end

// import category definitions

#import "MapViewDraw.h"
#import "MapViewResp.h"

