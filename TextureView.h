
#import <appkit/appkit.h>

typedef struct
{
	int	xoff,yoff;
	texpatch_t *p;
} delta_t;

@interface TextureView:NSView
{
	id	deltaTable;
}


@end
