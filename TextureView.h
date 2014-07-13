
#import "Storage.h"
#import <appkit/appkit.h>

typedef struct
{
	int	xoff,yoff;
	texpatch_t *p;
} delta_t;

@interface TextureView:NSView
{
	CompatibleStorage *deltaTable;
}


@end
