#import "PopScrollView.h"

@implementation PopScrollView

/*
====================
=
= initFrame: button:
=
= Initizes a scroll view with a button at it's lower right corner
=
====================
*/

- initFrame:(const NSRect *)frameRect button1:b1 button2:b2
{
	[super  initFrame: frameRect];	
	[self addSubview: b1];
	[self addSubview: b2];

	button1 = b1;
	button2 = b2;

	[self setHorizScrollerRequired: YES];
	[self setVertScrollerRequired: YES];
		
	return self;
}


/*
================
=
= tile
=
= Adjust the size for the pop up scale menu
=
=================
*/

- tile
{
	NSRect	scrollerframe;
	NSRect	buttonframe, buttonframe2;
	NSRect	newframe;
	
	[super tile];
	[button1 getFrame: &buttonframe];
	[button2 getFrame: &buttonframe2];
	[[self horizScroller] getFrame: &scrollerframe];

	newframe.origin.y = scrollerframe.origin.y;
	newframe.origin.x = [self frame].size.width - buttonframe.size.width;
	newframe.size.width = buttonframe.size.width;
	newframe.size.height = scrollerframe.size.height;
	scrollerframe.size.width -= newframe.size.width;
	[button1 setFrame: newframe];
	newframe.size.width = buttonframe2.size.width;
	newframe.origin.x -= newframe.size.width;
	[button2 setFrame: newframe];
	scrollerframe.size.width -= newframe.size.width;

	[[self horizScroller] setFrame: scrollerframe];

	return self;
}


@end

