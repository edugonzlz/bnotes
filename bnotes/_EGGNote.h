// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EGGNote.h instead.

#import <CoreData/CoreData.h>
#import "EGGNamedEntity.h"

extern const struct EGGNoteAttributes {
	__unsafe_unretained NSString *text;
} EGGNoteAttributes;

extern const struct EGGNoteRelationships {
	__unsafe_unretained NSString *notebook;
	__unsafe_unretained NSString *photos;
} EGGNoteRelationships;

@class EGGNotebook;
@class EGGPhoto;

@interface EGGNoteID : EGGNamedEntityID {}
@end

@interface _EGGNote : EGGNamedEntity {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) EGGNoteID* objectID;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) EGGNotebook *notebook;

//- (BOOL)validateNotebook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *photos;

- (NSMutableSet*)photosSet;

@end

@interface _EGGNote (PhotosCoreDataGeneratedAccessors)
- (void)addPhotos:(NSSet*)value_;
- (void)removePhotos:(NSSet*)value_;
- (void)addPhotosObject:(EGGPhoto*)value_;
- (void)removePhotosObject:(EGGPhoto*)value_;

@end

@interface _EGGNote (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (EGGNotebook*)primitiveNotebook;
- (void)setPrimitiveNotebook:(EGGNotebook*)value;

- (NSMutableSet*)primitivePhotos;
- (void)setPrimitivePhotos:(NSMutableSet*)value;

@end
