
#import <appkit/appkit.h>

@interface FindLine:NSObject
{
	id	window_i;
	id	status_i;
	id	numfield_i;
	id	delSound;
	id	fromBSP_i;
}

#define MARGIN		64			// margin from window edge
#define	PREFNAME	@"FindLinePanel"

- (int)getRealLineNum:(int)num;
- findLine:sender;
- deleteLine:sender;
- menuTarget:sender;
- (void)rectFromPoints:(NSRect *)r p1:(NSPoint)p1 p2:(NSPoint)p2;

@end
