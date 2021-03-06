#import	"EditWorld.h"
#import	"SectorEditor.h"
#import	"FlatRemapper.h"

id	flatRemapper_i;

@implementation FlatRemapper
//===================================================================
//
//	REMAP FLATS IN MAP
//
//===================================================================
- init
{
	flatRemapper_i = self;

	remapper_i = [[Remapper alloc]
		setFrameName: @"FlatRemapper"
		setPanelTitle: @"Flat Remapper"
		setBrowserTitle: @"List of flats to be remapped"
		setRemapString: @"Flat"
		setDelegate: self
	];
	return self;
}

//===================================================================
//
//	Bring up panel
//
//===================================================================
- menuTarget:sender
{
	[remapper_i	showPanel];
	return self;
}

- addToList: (NSString *)orgname to: (NSString *) newname;
{
	[remapper_i addToList:orgname to:newname];
	return self;
}

//===================================================================
//
//	Delegate methods
//
//===================================================================
- (NSString *)getOriginalName
{
	return [sectorEdit_i flatName:[sectorEdit_i getCurrentFlat] ];
}

- (NSString *)getNewName
{
	return [sectorEdit_i flatName:[sectorEdit_i getCurrentFlat] ];
}

- (int)doRemap: (NSString *) oldn to: (NSString *) newn
{
	const char *oldname, *newname;
	int i;
	int linenum;
	int flag;

	oldname = [oldn UTF8String];
	newname = [newn UTF8String];

	linenum = 0;
	for (i = 0;i < numlines; i++)
	{
		flag = 0;
		// SIDE 0
		if (!strcasecmp ( oldname,lines[i].side[0].ends.floorflat))
		{
			strcpy(lines[i].side[0].ends.floorflat, newname );
			flag++;
		}
		if (!strcasecmp( oldname,lines[i].side[0].ends.ceilingflat))
		{
			strcpy(lines[i].side[0].ends.ceilingflat, newname );
			flag++;
		}

		// SIDE 1
		if (!strcasecmp ( oldname,lines[i].side[1].ends.floorflat))
		{
			strcpy(lines[i].side[1].ends.floorflat, newname );
			flag++;
		}
		if (!strcasecmp( oldname,lines[i].side[1].ends.ceilingflat))
		{
			strcpy(lines[i].side[1].ends.ceilingflat, newname );
			flag++;
		}
		
		if (flag)
		{
			printf("Remapped flat %s to %s.\n",oldname,newname);
			linenum++;
		}
	}
	
	
	return linenum;
}

- finishUp
{
	return self;
}

@end
