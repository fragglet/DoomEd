
#import <appkit/appkit.h>

extern	id	settingspanel_i;

@interface SettingsPanel:NSObject
{
	int	segmenttype;
}

- menuTarget:sender;
- (int) segmentType;

@end
