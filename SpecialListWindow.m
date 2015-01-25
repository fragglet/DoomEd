#import "SpecialList.h"
#import "DoomProject.h"
#import "SpecialListWindow.h"
#import	"TextureEdit.h"

@implementation SpecialListWindow

- setParent:(id)p
{
	parent_i = p;
	return self;
}

//===================================================================
//
//	Match keypress to first letter
//
//===================================================================
- (void) keyDown:(NSEvent *)event
{
	NSString *string2;
	speciallist_t *s;
	CompatibleStorage *specialList_i;
	int found;
	int tries;
	int i;

	string = [string stringByAppendingString: [event characters]];

	specialList_i = [parent_i  getSpecialList];
	tries = 2;
	while (tries > 0)
	{
		found = 0;

		for (i = 0; i < [specialList_i count]; i++)
		{
			NSRange range = NSMakeRange(0, [string length]);

			s = [specialList_i elementAt:i];
			string2 = [NSString stringWithUTF8String: s->desc];

			if ([string compare:string2
			            options:NSCaseInsensitiveSearch
			            range:range] == 0)
			{
				[parent_i scrollToItem:i];
				found = 1;
				tries = 0;
				break;
			}
		}

		if (!found)
		{
			string = [event characters];
			tries--;
		}
	}
}

@end
