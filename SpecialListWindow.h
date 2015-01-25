
#import <appkit/appkit.h>

@interface SpecialListWindow:NSWindow
{
	id parent_i;
	NSString *string;
}

- setParent:(id)p;

@end
