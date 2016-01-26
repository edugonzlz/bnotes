// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EGGNote.m instead.

#import "_EGGNote.h"

const struct EGGNoteAttributes EGGNoteAttributes = {
	.text = @"text",
};

const struct EGGNoteRelationships EGGNoteRelationships = {
	.notebook = @"notebook",
	.photos = @"photos",
};

@implementation EGGNoteID
@end

@implementation _EGGNote

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Note";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Note" inManagedObjectContext:moc_];
}

- (EGGNoteID*)objectID {
	return (EGGNoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic text;

@dynamic notebook;

@dynamic photos;

- (NSMutableSet*)photosSet {
	[self willAccessValueForKey:@"photos"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"photos"];

	[self didAccessValueForKey:@"photos"];
	return result;
}

@end

