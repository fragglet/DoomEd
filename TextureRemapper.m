#import	"EditWorld.h"
#import	"TexturePalette.h"
#import	"TextureRemapper.h"

TextureRemapper *textureRemapper_i;

@implementation TextureRemapper

//===================================================================
//
//	REMAP TEXTURES IN MAP
//
//===================================================================
- init
{
	textureRemapper_i = self;

	remapper_i = [[Remapper alloc]
		setFrameName: @"TextureRemapper"
		setPanelTitle: @"Texture Remapper"
		setBrowserTitle: @"List of textures to be remapped"
		setRemapString: @"Texture"
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

- addToList: (NSString *) orgname to: (NSString *) newname;
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
	return [NSString stringWithUTF8String:
		[texturePalette_i getSelTextureName]];
}

- (NSString *) getNewName
{
	return [self getOriginalName];
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
		if (!strcasecmp ( oldname,lines[i].side[0].bottomtexture))
		{
			strcpy(lines[i].side[0].bottomtexture, newname );
			flag++;
		}
		if (!strcasecmp( oldname,lines[i].side[0].midtexture))
		{
			strcpy(lines[i].side[0].midtexture, newname );
			flag++;
		}
		if (!strcasecmp( oldname ,lines[i].side[0].toptexture))
		{
			strcpy(lines[i].side[0].toptexture, newname );
			flag++;
		}

		// SIDE 1
		if (!strcasecmp ( oldname,lines[i].side[1].bottomtexture))
		{
			strcpy(lines[i].side[1].bottomtexture, newname );
			flag++;
		}
		if (!strcasecmp( oldname,lines[i].side[1].midtexture))
		{
			strcpy(lines[i].side[1].midtexture, newname );
			flag++;
		}
		if (!strcasecmp( oldname ,lines[i].side[1].toptexture))
		{
			strcpy(lines[i].side[1].toptexture, newname );
			flag++;
		}

		if (flag)
		{
			printf("Remapped texture %s to %s.\n",oldname,newname);
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
