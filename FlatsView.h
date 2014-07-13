
#import <appkit/appkit.h>
#import "Storage.h"

#ifndef	H_DIVIDERT
#define	H_DIVIDERT
typedef struct
{
	int		x,y;
	char		string[32];
} divider_t;
#endif

@interface FlatsView:NSView
{
	CompatibleStorage *dividers_i;
}

- addDividerX:(int)x Y:(int)y String:(char *)string;
- dumpDividers;

@end
