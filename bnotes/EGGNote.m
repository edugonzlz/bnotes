#import "EGGNote.h"

@interface EGGNote ()

+(NSArray *)observableKeyNames;

@end

@implementation EGGNote

+(NSArray *)observableKeyNames{
    
    return @[@"name", @"creationDate", @"notebook", @"photo"];
}

+(instancetype)noteWithName:(NSString *)name
                   notebook:(EGGNotebook *)notebook
                    context:(NSManagedObjectContext *)context{
    
    EGGNote *note = [NSEntityDescription insertNewObjectForEntityForName:[EGGNote entityName]
                                                  inManagedObjectContext:context];
    
    note.creationDate = [NSDate date];
    note.modificationDate = [NSDate date];
    note.name = name;
    note.notebook = notebook;
    
    return note;
}

@end
