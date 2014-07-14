#import "Storage.h"

#import "EditWorld.h"
#import "idfunctions.h"

extern	CompatibleStorage *sectors;
extern	id	blockworld_i;
extern	BOOL	fillerror;

@interface BlockWorld : NSObject

- displayBlockMap;
- createBlockMap;
- drawBlockLine: (int) linenum;
- floodFillSector: (NSPoint *)pt;
- (BOOL)connectSectors;

@end
