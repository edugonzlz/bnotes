// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EGGPhoto.h instead.

#import <CoreData/CoreData.h>

extern const struct EGGPhotoAttributes {
	__unsafe_unretained NSString *imageData;
} EGGPhotoAttributes;

extern const struct EGGPhotoRelationships {
	__unsafe_unretained NSString *notes;
} EGGPhotoRelationships;

@class EGGNote;

@interface EGGPhotoID : NSManagedObjectID {}
@end

@interface _EGGPhoto : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) EGGPhotoID* objectID;

@property (nonatomic, strong) NSData* imageData;

//- (BOOL)validateImageData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _EGGPhoto (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(EGGNote*)value_;
- (void)removeNotesObject:(EGGNote*)value_;

@end

@interface _EGGPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveImageData;
- (void)setPrimitiveImageData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
