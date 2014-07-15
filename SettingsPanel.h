
#import <appkit/appkit.h>

@interface SettingsPanel:NSObject
{
	int	segmenttype;
}

- menuTarget:sender;
- (int) segmentType;

@end

extern SettingsPanel *settingspanel_i;

