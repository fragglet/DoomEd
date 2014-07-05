
#import <appkit/appkit.h>

@interface ThermoView:NSView
{
	float		thermoWidth;
}

- setThermoWidth:(int)current max:(int)maximum;

@end
