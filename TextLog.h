
#import <appkit/appkit.h>

@interface TextLog:NSObject
{
	id	text_i;
	id	window_i;
}

- initTitle:(char *)title;
- msg:(char *)string;
- display:sender;
- clear:sender;

@end
