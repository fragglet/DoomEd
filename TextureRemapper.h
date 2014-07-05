#import	"Remapper.h"
#import <appkit/appkit.h>

extern	id	textureRemapper_i;

@interface TextureRemapper:NSObject <Remapper>
{
	id	remapper_i;
}

- addToList:(char *)orgname to:(char *)newname;

@end
