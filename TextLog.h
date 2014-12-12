
#import <appkit/appkit.h>

@interface TextLog:NSObject
{
	id	text_i;
	NSWindow *window_i;
}

- initTitle: (NSString *) title;
- msg:(char *)string;
- display:sender;
- clear:sender;

@end
