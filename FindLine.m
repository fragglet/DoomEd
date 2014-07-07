#import	"EditWorld.h"
#import "FindLine.h"

@implementation FindLine

//=============================================================
//
//	Find Line init
//
//=============================================================
- init
{
	window_i = NULL;
	delSound = [[Sound alloc] initFromSection:"D_EPain"];	return self;
}

//=============================================================
//
//	Pop up the window from the menu
//
//=============================================================
- menuTarget:sender
{
	if (!window_i)
	{
		[NSApp 
			loadNibSection:	"FindLine.nib"
			owner:			self
			withNames:		NO
		];
		
		[status_i	setStringValue:" "];
		[window_i	setFrameUsingName:PREFNAME];
	}
	[window_i	makeKeyAndOrderFront:self];
	
	return self;
}

//=============================================================
//
//	Find the line and scroll it to center
//
//=============================================================
- findLine:sender
{
	int				linenum;
	NSRect			r;
	worldline_t		*l;
	id				window;
	
	linenum = [numfield_i	intValue];
	if ([fromBSP_i	intValue])
		linenum = [self	getRealLineNum:linenum];
	if (linenum < 0)
	{
		[status_i	setStringValue:"No such line!"];
		return self;
	}
	
	[editworld_i	selectLine:linenum];
	[editworld_i	selectPoint:lines[linenum].p1];
	[editworld_i	selectPoint:lines[linenum].p2];
	
	l = &lines[linenum];
	[self	rectFromPoints:&r p1:points[l->p1].pt p2:points[l->p2].pt];
	window = [editworld_i	getMainWindow];
	r.origin.x -= MARGIN;
	r.origin.y -= MARGIN;
	r.size.width += MARGIN*2;
	r.size.height += MARGIN*2;
	[[[window	contentView] docView] scrollRectToVisible:&r];
	[editworld_i	redrawWindows];
	[status_i	setStringValue:"Found it!"];
	
	return self;
}

//=============================================================
//
//	Delete the line
//
//=============================================================
- deleteLine:sender
{
	int		linenum;
	
	linenum = [numfield_i	intValue];
	if ([fromBSP_i	intValue])
		linenum = [self	getRealLineNum:linenum];

	if (linenum < 0)
	{
		[status_i	setStringValue:"No such line!"];
		return self;
	}
	
	[editworld_i	selectLine:linenum];
	[editworld_i	selectPoint:lines[linenum].p1];
	[editworld_i	selectPoint:lines[linenum].p2];
	
	lines[linenum].selected = -1;
	[status_i	setStringValue:"Toasted it!"];
	[delSound play];
	
	return self;
}

//=============================================================
//
//	Skip all the deleted lines in the list and find the correct one
//
//=============================================================
- (int)getRealLineNum:(int)num
{
	int	index;
	int	i;
	
	index = 0;
	for (i = 0;i < numlines;i++)
	{
		if (index == num)
			return i;
		if (lines[i].selected != -1)
			index++;
	}
	
	return -1;
}

//=============================================================
//
//	Wow, this needed to be written.
//
//=============================================================
- (void)rectFromPoints:(NSRect *)r p1:(NSPoint)p1 p2:(NSPoint)p2
{
	if (p1.x < p2.x)
	{
		r->origin.x = p1.x;
		r->size.width = p2.x - p1.x;
	}
	else
	{
		r->origin.x = p2.x;
		r->size.width = p1.x - p2.x;
	}
	
	if (p1.y < p2.y)
	{
		r->origin.y = p1.y;
		r->size.height = p2.y - p1.y;
	}
	else
	{
		r->origin.y = p2.y;
		r->size.height = p1.y - p2.y;
	}
}

- appWillTerminate:sender
{
	if (window_i)
		[window_i	saveFrameUsingName:PREFNAME];
	return self;
}

@end

