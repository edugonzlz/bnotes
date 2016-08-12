#import "EGGPhoto.h"

@interface EGGPhoto ()

// Private interface goes here.

@end

@implementation EGGPhoto

#pragma mark - properties

-(void)setImage:(UIImage *)image{
    
    //Sincronizamos con imageData
    self.imageData = UIImagePNGRepresentation(image);
}

-(UIImage *)image{
    
    return [UIImage imageWithData:self.imageData];
}



#pragma mark - class methods

+(instancetype) photoWithImage:(UIImage *)image
                       context:(NSManagedObjectContext *)context{
    
    EGGPhoto *photo = [NSEntityDescription insertNewObjectForEntityForName:[EGGPhoto entityName]
                                                    inManagedObjectContext:context];
    
    //Convertimos con una funcion la imagen en un Data, porque es lo que usa CoreData
    photo.imageData = UIImageJPEGRepresentation(image, 0.9);//0.9 es la cantidad de compresion
    
    
    return photo;
}

@end
