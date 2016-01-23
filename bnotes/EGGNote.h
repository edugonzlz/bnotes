#import "_EGGNote.h"

@interface EGGNote : _EGGNote {}

+(instancetype)noteWithName:(NSString *)name
                   notebook:(EGGNotebook *)notebook
                    context:(NSManagedObjectContext *)context;

@end
