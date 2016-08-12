#import "_EGGPhoto.h"
@import UIKit;

@interface EGGPhoto : _EGGPhoto {}

//Creamos la propiedad image para que podamos trabajar con image en vez de data
@property (strong, nonatomic)UIImage *image;

+(instancetype) photoWithImage:(UIImage *)image context:(NSManagedObjectContext *)context;

@end
