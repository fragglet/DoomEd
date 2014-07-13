#import "Storage.h"

#import <appkit/appkit.h>

typedef struct
{
	int		value;
	char		desc[32];
} thingstrip_t;

#define	THINGSTRIPNAME	@"ThingStripper"

@interface ThingStripper:NSObject
{
	id	thingBrowser_i;		// nib outlets
	id	thingStripPanel_i;

	CompatibleStorage *thingList_i;
}

- displayPanel:sender;
- addThing:sender;
- deleteThing:sender;
- doStrippingAllMaps:sender;
- doStrippingOneMap:sender;

@end
