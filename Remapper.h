#import "Storage.h"

#import <appkit/appkit.h>

typedef struct
{
	NSString *orgname, *newname;
} type_t;

//
//	Methods to be implemented by the delegate
//
@protocol Remapper
- (NSString *) getOriginalName;
- (NSString *) getNewName;
- (int)doRemap: (NSString *) oldname to: (NSString *) newname;
- finishUp;
@end


@interface Remapper:NSObject
{
	id		original_i;
	id		new_i;
	id		remapPanel_i;
	id		remapString_i;
	id		status_i;
	id		browser_i;
	id		matrix_i;
	
	CompatibleStorage *storage_i;
	id		delegate_i;
	NSString *frameName;
}

//	EXTERNAL USE
- setFrameName:(NSString *)fname
  setPanelTitle:(NSString *)ptitle
  setBrowserTitle:(NSString *)btitle
  setRemapString:(NSString *)rstring
  setDelegate:(id)delegate;

//extern - (int)doRemap:(char *)oldname to:(char *)newname;

- showPanel;
  
- addToList: (NSString *) orgname to: (NSString *) newname;

//	INTERNAL USE
- remapGetButtons:sender;
- doRemappingOneMap:sender;
- doRemappingAllMaps:sender;
- addToList:sender;
- deleteFromList:sender;
- clearList:sender;

@end
