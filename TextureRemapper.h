#import	"Remapper.h"
#import <appkit/appkit.h>

@interface TextureRemapper:NSObject <Remapper>
{
	id	remapper_i;
}

- addToList:(char *)orgname to:(char *)newname;

@end

extern TextureRemapper *textureRemapper_i;

