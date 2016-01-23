// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EGGNotebook.h instead.

#import <CoreData/CoreData.h>
#import "EGGNamedEntity.h"

extern const struct EGGNotebookRelationships {
	__unsafe_unretained NSString *notes;
} EGGNotebookRelationships;

@class EGGNote;

@interface EGGNotebookID : EGGNamedEntityID {}
@end

@interface _EGGNotebook : EGGNamedEntity {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) EGGNotebookID* objectID;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _EGGNotebook (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(EGGNote*)value_;
- (void)removeNotesObject:(EGGNote*)value_;

@end

@interface _EGGNotebook (CoreDataGeneratedPrimitiveAccessors)

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
