#import	"LinePanel.h"
#import "LineSpecialRemapper.h"
#import	"SpecialList.h"

id	lineSpecialRemapper_i;

@implementation LineSpecialRemapper

//===================================================================
//
//	REMAP Line Specials IN MAP
//
//===================================================================
- init
{
	lineSpecialRemapper_i = self;

	remapper_i = [[Remapper alloc]
		setFrameName: @"LineSpecialRemapper"
		setPanelTitle: @"Line Special Remapper"
		setBrowserTitle: @"List of line specials to be remapped"
		setRemapString: @"Special"
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

- addToList: (NSString *) orgname to: (NSString *) newname
{
	[remapper_i addToList:orgname to:newname];
	return self;
}

//===================================================================
//
//	Delegate methods
//
//===================================================================
- (NSString *) getOriginalName
{
	speciallist_t	special;

	[lineSpecialPanel_i fillSpecialData:&special];
	return [NSString stringWithFormat: @"%d:%s",
	                                   special.value,special.desc];
}

- (NSString *) getNewName
{
	return [self getOriginalName];
}

- (int)doRemap: (NSString *) oldname to: (NSString *) newname
{
	int i;
	int linenum;
	int flag;
	char string[80];
	int oldval;
	int newval;

	sscanf([oldname UTF8String], "%d:%s", &oldval, string);
	sscanf([newname UTF8String], "%d:%s", &newval, string);

	linenum = 0;
	for (i = 0; i < numlines; i++)
	{
		flag = 0;

		if (lines[i].special == oldval)
		{
			lines[i].special = newval;
			flag++;
		}

		if (flag)
		{
			printf("Remapped Line Special %s to %s.\n",
			       [oldname UTF8String], [newname UTF8String]);
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
