#import	"Remapper.h"
#import <appkit/appkit.h>

extern	id	flatRemapper_i;

@interface FlatRemapper:NSObject <Remapper>
{
	id	remapper_i;
}

- addToList:(char *)orgname to:(char *)newname;

@end
