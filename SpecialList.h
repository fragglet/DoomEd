
#import "Storage.h"
#import <appkit/appkit.h>

typedef struct
{
	int		value;
	char		desc[32];
} speciallist_t;

@protocol SpecialListDelegate <NSObject>
- specialChosen: (int)value;
@end

@interface SpecialList:NSObject
{
	id	specialDesc_i;
	id	specialBrowser_i;
	id	specialValue_i;
	id	specialPanel_i;
	CompatibleStorage *specialList_i;

	id<SpecialListDelegate> delegate;
	char		title[32];
	char		frameString[32];
}

- (CompatibleStorage *) getSpecialList;
- scrollToItem:(int)i;
- setSpecialTitle:(char *)string;
- setFrameName:(char *)string;
- saveFrame;
- displayPanel;
- addSpecial:sender;
- suggestValue:sender;
- chooseSpecial:sender;
- updateSpecialsDSP:(FILE *)stream;
- (int)findSpecial:(int)value;
- validateSpecialString:sender;
- setSpecial:(int)which;
- fillSpecialData:(speciallist_t *)special;
- setDelegate: (id<SpecialListDelegate>)dg;
- empty;

@end

