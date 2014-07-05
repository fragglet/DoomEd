#import	"Remapper.h"
#import <appkit/appkit.h>

extern	id	thingRemapper_i;

@interface ThingRemapper:NSObject <Remapper>
{
	id	remapper_i;
}

- menuTarget:sender;
- addToList:(char *)orgname to:(char *)newname;

@end
