#import "ps_quartz.h"

//
// This belongs to TextureEdit (docView of TextureEdit's ScrollView)
//
#import "TextureEdit.h"
#import "EditWorld.h"
#import "TextureView.h"
//#import "wadfiles.h"


@implementation TextureView

- (BOOL) acceptsFirstResponder
{
	return YES;
}

- initWithFrame:(NSRect)frameRect
{
	[super initWithFrame:frameRect];
	deltaTable = [[CompatibleStorage alloc]
		initCount:0
		elementSize:sizeof(delta_t)
		description:NULL
	];

	return self;
}

- (void) keyDown:(NSEvent *)theEvent
{
	switch ([theEvent keyCode])
	{
		case NSDeleteCharacter:    // delete patch
			[textureEdit_i	deleteCurrentPatch:NULL];
			break;
		case 0x6c:	// toggle lock
			[textureEdit_i	doLockToggle];
			break;
		case 0xac:
		case 0xaf:	// sort down
			[textureEdit_i	sortDown:NULL];
			break;
		case 0xad:
		case 0xae:	// sort up
			[textureEdit_i	sortUp:NULL];
			break;
		case 0xd:
			[textureEdit_i	finishTexture:NULL];
			break;
		#if 0
		default:
			printf("charCode:%x\n", [theEvent keyCode]);
			break;
		#endif
	}
}

- drawSelf:(const NSRect *)rects :(int)rectCount
{
	int		ct,i,outlineflag;
	int		patchCount;
	texpatch_t	*tpatch;
	
	ct = [textureEdit_i	getCurrentTexture];
	if (ct < 0)
		return self;
		
	NXSetColor(NXConvertRGBToColor(1,0,0));
	NSRectFill(rects[0]);
	
	outlineflag = [textureEdit_i	getOutlineFlag];
	PSsetgray(NX_DKGRAY);

	//
	// draw all patches
	//
	patchCount = [texturePatches	count];
	for (i = 0;i < patchCount; i++)
	{
		tpatch = [texturePatches	elementAt:i];
//		if (NSIntersectsRect(tpatch->r, rects[0]))
			[tpatch->patch->image_x2	composite:NSCompositeSourceOver toPoint:&tpatch->r.origin];
	}

	//
	// overlay outlines
	//
	if (outlineflag)
		for (i = patchCount - 1;i >= 0;i--)
		{
			tpatch = [texturePatches	elementAt:i];
//			if (NSIntersectsRect(tpatch->r, rects[0]))
				NXFrameRectWithWidth(&tpatch->r,5);
		}

	//
	// if multiple selections, draw their outlines
	//
	if ([[textureEdit_i	getSTP]		count])
	{
		int	max;
		
		max = [[textureEdit_i	getSTP]	count];
		for (i = 0;i<max;i++)
		{
			tpatch = [texturePatches	elementAt:*(int *)[[textureEdit_i getSTP] elementAt:i]];
			PSsetgray(NX_WHITE);
			NXFrameRectWithWidth(&tpatch->r,5);
		}
	}
	
	return self;
}

- (void) rightMouseDown:(NSEvent *)theEvent
{
	[[textureEdit_i	getSTP]	empty];
	[self display];
}

- (void) mouseDown:(NSEvent *)theEvent
{
	NSPoint	loc,newloc;
	int	i,patchcount,oldwindowmask,ct,max,j,warn,clicked;
	texpatch_t	*patch;
	NSEvent	*event;

	// TODO: Needed?
	//oldwindowmask = [[self window] addToEventMask:NX_LMOUSEDRAGGEDMASK];
	loc = [theEvent locationInWindow];
	[self convertPoint:loc	fromView:NULL];
	ct = [textureEdit_i	getCurrentTexture];

	//
	// see if a patch was clicked on...
	//
	patchcount = [texturePatches	count];
	clicked = 0;		// no patch clicked on yet...
	for (i = patchcount - 1;i >= 0;i--)
	{
		patch = [texturePatches	elementAt:i];
		if (NSPointInRect(loc, patch->r) == YES)
		{
			//
			// shift-click adds the patch to the select list
			//
			if (([theEvent modifierFlags] & NSShiftKeyMask) != 0)
			{
				if ([textureEdit_i	selTextureEditPatchExists:i] == NO)
					[textureEdit_i	addSelectedTexturePatch:i];
				else
					[textureEdit_i	removeSelTextureEditPatch:i];
				[textureEdit_i	updateTexPatchInfo];
			}
			else
			if (![textureEdit_i	selTextureEditPatchExists:i])
			{
				[[textureEdit_i	getSTP]	empty];
				[textureEdit_i	addSelectedTexturePatch:i];
				[textureEdit_i	updateTexPatchInfo];
			}
			[self	display];
			clicked = 1;
			break;
		}
	}
	
	//
	// Did user click outside area? If so, get rid of all selections
	//
	if (!clicked)
		[[textureEdit_i	getSTP]	empty];
	
	//
	// move around texture patches
	//
	max = [[textureEdit_i getSTP]	count];
	[deltaTable	empty];
	for (j = 0; j < max; j++)
	{
		delta_t	d;
		d.p = [texturePatches	elementAt:
				*(int *)[[textureEdit_i getSTP] elementAt:j]];
		d.xoff = loc.x - d.p->r.origin.x;
		d.yoff = loc.y - d.p->r.origin.y;
		[deltaTable	addElement:&d];
	}

	do
	{
		event = [[self window]
			nextEventMatchingMask:
			    NSLeftMouseUp | NSLeftMouseDraggedMask
		];
		if (event == nil)
			continue;

		newloc = [event locationInWindow];
		[self convertPoint:newloc  fromView:NULL];
		warn = 0;
		for (j = 0;j < max;j++)
		{
			delta_t	*d;
			NSPoint	l;
			
			d = [deltaTable	elementAt:j];
			l = newloc;
			l.x = ((int)l.x - d->xoff) & -2;
			l.y = ((int)l.y - d->yoff) & -2;
			//
			// dragged selections off texture? if so, pull back the ones already lost.
			//
			if (l.x < 0 || l.y < 0 || l.x/2 > textures[ct].width || l.y/2 > textures[ct].height)
				warn = 1;
			d->p->r.origin = l;
			d->p->patchInfo.originx = l.x / 2;
			d->p->patchInfo.originy = textures[ct].height - 
								((l.y / 2) + (d->p->r.size.height / 2));

		}
		[ self		display ];
		[textureEdit_i	updateTexPatchInfo];
		[textureEdit_i	setWarning:warn];
	} while ([event type] != NSLeftMouseUp);

	if ([[textureEdit_i	getSTP] count] == 1)
	{
		delta_t *d;
		d = [deltaTable elementAt:0];
//		[textureEdit_i	setOldVars:d->p->patchInfo.originx + d->p->r.size.width/2
//					:(textures[ct].height - d->p->patchInfo.originy) - d->p->r.size.height/2];
		[textureEdit_i	setOldVars:d->p->patchInfo.originx + d->p->r.size.width/2
					:d->p->patchInfo.originy];
	}
}

@end
