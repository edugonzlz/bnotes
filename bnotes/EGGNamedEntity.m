#import "EGGNamedEntity.h"

@interface EGGNamedEntity ()

+(NSArray *)observableKeyNames;

@end

@implementation EGGNamedEntity

#pragma mark - Class Methods

+(NSArray *)observableKeyNames{
    
    return @[@"name", @"creationDate"];
}

#pragma mark - KVO

//Vamos a observar nuestras propiedades para actualizar la modificationDate cada vez que hay un cambio
//alta en la notificacion de cambio
-(void)setupKVO{
    
    for (NSString *key in [[self class] observableKeyNames]) {
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld//Que quiero que me envien
                  context:NULL];
    }
}
//baja en la notificacion
-(void)tearDownKVO{
    
    for (NSString *key in [[self class] observableKeyNames]) {
        [self removeObserver:self
                  forKeyPath:key];
    }
    
}

//que hacemos cuando recibimos la notificacion de cambio
-(void)observeValueForKeyPath:(NSString *)keyPath //la clave que ha cambiado
                     ofObject:(id)object //el objeto de la clave que ha cambiado
                       change:(NSDictionary<NSString *,id> *)change //el cambio
                      context:(void *)context{
    
    self.modificationDate = [NSDate date];
    
}

#pragma  mark - Life Cycle

//Todos los objetos de coreData reciben estos mensajes durante su ciclo de vida
//Los implementamos para comenzar la observacion con KVO cuando corresponda

//Se manda cuando se crea el objeto NSManagedObjectModel
//Se recibe una sola vez, cuando se crea
-(void)awakeFromInsert{
    [super awakeFromInsert];
    [self setupKVO];
}

//Se manda cuando se crea en una busqueda el objeto NSManagedObjectModel o se vuelve de un Fault
-(void)awakeFromFetch{
    [super awakeFromFetch];
    [self setupKVO];
}

//Se recibe cuando el objeto se convierte en un fault
//Aqui damos de baja la notificacion porque el objeto esta "vacio"
-(void)willTurnIntoFault{
    [super willTurnIntoFault];
    [self tearDownKVO];
}

@end
