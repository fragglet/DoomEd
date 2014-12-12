#import	"Remapper.h"
#import <appkit/appkit.h>

extern	id	thingRemapper_i;

@interface ThingRemapper:NSObject <Remapper>
{
	id	remapper_i;
}

- menuTarget:sender;
- addToList: (NSString *) orgname to: (NSString *) newname;

@end
