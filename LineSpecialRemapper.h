#import	"Remapper.h"
#import <appkit/appkit.h>

extern	id	lineSpecialRemapper_i;

@interface LineSpecialRemapper:NSObject <Remapper>
{
	id	remapper_i;
}

- addToList:(char *)orgname to:(char *)newname;
- menuTarget:sender;

@end
