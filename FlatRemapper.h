#import	"Remapper.h"
#import <appkit/appkit.h>

extern	id	flatRemapper_i;

@interface FlatRemapper:NSObject <Remapper>
{
	id	remapper_i;
}

- addToList: (NSString *) orgname to: (NSString *) newname;

@end
