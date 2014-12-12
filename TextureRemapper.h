#import	"Remapper.h"
#import <appkit/appkit.h>

@interface TextureRemapper:NSObject <Remapper>
{
	id	remapper_i;
}

- addToList: (NSString *) orgname to: (NSString *) newname;

@end

extern TextureRemapper *textureRemapper_i;

