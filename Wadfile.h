#import "Storage.h"

#import <appkit/appkit.h>


@interface Wadfile : NSObject
{
	int		handle;
	char		*pathname;
	CompatibleStorage *info;
	BOOL	dirty;
}

- initFromFile: (char const *)path;
- initNew: (char const *)path;
- close;
- (void) dealloc;

- (int)numLumps;
- (int)lumpsize: (int)lump;
- (int)lumpstart: (int)lump;
- (char const *)lumpname: (int)lump;
- (int)lumpNamed: (char const *)name;
- (void *)loadLump: (int)lump;
- (void *)loadLumpNamed: (char const *)name;

- addName: (char const *)name data: (void *)data size: (int)size;
- writeDirectory; 

@end
