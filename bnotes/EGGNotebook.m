#import "EGGNotebook.h"

@interface EGGNotebook ()

+(NSArray *)observableKeyNames;

@end

@implementation EGGNotebook

+(NSArray *)observableKeyNames{
    return @[@"creationDate", @"name", @"notes"];
}

+(instancetype)notebookWithName:(NSString *)name context:(NSManagedObjectContext *)context{
    
    EGGNotebook *notebook = [NSEntityDescription insertNewObjectForEntityForName:[EGGNotebook entityName]
                                                          inManagedObjectContext:context];
    
    notebook.name = name;
    notebook.creationDate = [NSDate date];
    notebook.modificationDate = [NSDate date];
    
    return notebook;
}


@end
