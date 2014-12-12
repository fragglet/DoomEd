#import	"Remapper.h"
#import <appkit/appkit.h>

extern	id	lineSpecialRemapper_i;

@interface LineSpecialRemapper:NSObject <Remapper>
{
	id	remapper_i;
}

- addToList: (NSString *) orgname to: (NSString *) newname;
- menuTarget:sender;

@end
