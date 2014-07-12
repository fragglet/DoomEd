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
- (NSPoint) getCurrentOrigin;

- scaleMenuTarget: sender;
- gridMenuTarget: sender;

- zoomFrom:(NSPoint)origin toScale:(float)newscale;

- displayDirty: (NSRect const *)dirty;

- (NSPoint) getPointFrom: (NSEvent const *)event;
- (NSPoint) getGridPointFrom: (NSEvent const *)event;

- adjustFrameForOrigin: (NSPoint)org scale:(float)scl;
- adjustFrameForOrigin: (NSPoint)org;
- setOrigin: (NSPoint)org scale: (float)scl;
- setOrigin: (NSPoint)org;

@end

// import category definitions

#import "MapViewDraw.h"
#import "MapViewResp.h"

