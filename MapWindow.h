#import <appkit/appkit.h>

@interface MapWindow: NSWindow
{
	id		scrollview_i;
	id		mapview_i;
	
	id		scalemenu_i, scalebutton_i;
	id		gridmenu_i, gridbutton_i;	
	
	NXPoint	oldscreenorg;			// taken when resizing to keep view constant
	NXPoint	presizeorigin;			// map view origin before resize
}

- initFromEditWorld;
- mapView;

- scalemenu;
- scalebutton;
- gridmenu;
- gridbutton;

- reDisplay: (NSRect *)dirty;

@end
