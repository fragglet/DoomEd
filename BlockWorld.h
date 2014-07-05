#import "EditWorld.h"
#import "idfunctions.h"

extern	id	sectors;
extern	id	blockworld_i;
extern	BOOL	fillerror;

@interface BlockWorld : NSObject

- displayBlockMap;
- createBlockMap;
- drawBlockLine: (int) linenum;
- floodFillSector: (NXPoint *)pt;
- (BOOL)connectSectors;

@end
