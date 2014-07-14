
#import <Foundation/NSObject.h>

@interface CompatibleStorage:NSObject
{
	uint8_t *data;
	unsigned int elements;
	unsigned int elementSize;
	const char *description;
}

- (void) addElement:(void *)anElement;
//- copyFromZone:(NXZone *)zone;
- (unsigned int)count;
- (const char *)description;
- (void *)elementAt:(unsigned int)index;
- (void) empty;
- (void) dealloc;
- (CompatibleStorage *) initCount:(unsigned int)count
                        elementSize: (unsigned int) sizeInBytes
                        description: (const char *) string;
- (void) insertElement:(void *)anElement at:(unsigned int)index;
- (void) removeElementAt:(unsigned int)index;
- (void) replaceElementAt:(unsigned int)index with:(void *)anElement;

@end

