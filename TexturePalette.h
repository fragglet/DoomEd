#import "Storage.h"

#import	"TextureEdit.h"
#import <appkit/appkit.h>

typedef struct
{
	id	image;
	int	patchamount;
	char	 name[9];
	NSRect	r;
	int	WADindex;
	int	oldIndex;
} texpal_t;

@interface TexturePalette:NSObject
{
	id	window_i;
	id	texturePalView_i;
	id	texturePalScrView_i;
	id	titleField_i;
	id	widthField_i;
	id	heightField_i;
	id	searchField_i;
	id	patchField_i;
	id	widthSearch_i;
	id	heightSearch_i;
	
	id	texturePatches;
	CompatibleStorage *allTextures;
	CompatibleStorage *newTextures;
	int	selectedTexture;
	id	lsTextField_i;
	id	lsPanel_i;
	id	lsStatus_i;
}

- setupPalette;
- initTextures;
- finishInit;
- searchForTexture:sender;
- (int) getNumTextures;
- (int) getTextureIndex:(char *)name;
- createAllTextureImages;
- (texpal_t) createTextureImage:(int)which;

- computePalViewSize;
- (texpal_t *)getNewTexture:(int)which;
- (int)selectTextureNamed:(char *)name;

- (texpal_t *)getTexture:(int)which;
- storeTexture:(int)which;
- (char *)getSelTextureName;
- setSelTexture:(char *)name;
- (int) currentSelection;
- selectTexture:(int)val;
- menuTarget:sender;
- saveFrame;

- searchWidth:sender;
- searchHeight:sender;
- showTextureInMap:sender;

- saveTextureLBM:sender;
- saveAllTexturesAsLBM:sender;
- doSaveAllTexturesAsLBM:sender;

@end

extern TexturePalette *texturePalette_i;

//
//	Converting a texture to an LBM
//
void vgaPatchDecompress(patch_t *patchData,byte *dest_p);
void moveVgaPatch(byte *raw, byte *dest, int x, int y,
	int	width, int height,
	int clipwidth, int clipheight);
void createVgaTexture(char *dest, int which,int width, int height);
void createAndSaveLBM(char *name, int cs, FILE *fp);

