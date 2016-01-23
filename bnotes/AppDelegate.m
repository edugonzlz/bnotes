//
//  AppDelegate.m
//  bnotes
//
//  Created by Edu González on 21/1/16.
//  Copyright © 2016 Edu González. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTSimpleCoreDataStack.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.model = [AGTSimpleCoreDataStack coreDataStackWithModelName:@"Model"];
    
    [self trastearConDatos];
    
    [self autoSave];
    
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //NSFetchRequest *rq = [NSFetchRequest fetchRequestWithEntityName:[EGGNotebook entityName]];//mogenerator ha creado el metodo de clase entityName
    //Ordenamos la busqueda
//    rq.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:EGGNamedEntityAttributes.modificationDate
//                                                         ascending:NO],
//                           //mogenerator ha creado constantes para las propiedades
//                           [NSSortDescriptor sortDescriptorWithKey:EGGNamedEntityAttributes.name
//                                                         ascending:YES]];
//    
//    NSFetchedResultsController *results = [[NSFetchedResultsController alloc]initWithFetchRequest:rq
//                                                                             managedObjectContext:self.model.context
//                                                                               sectionNameKeyPath:nil
//                                                                                        cacheName:nil];
//    
//    
//    EGGNotebooksViewController *nbVC = [[EGGNotebooksViewController alloc]
//                                        initWithFetchedResultsController:results
//                                        style:UITableViewStylePlain];
//    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:nbVC];
//    
//    self.window.rootViewController = navVC;
//    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma Mark Utils

-(void)trastearConDatos{
    
    
    //Creamos una libreta y unas notas
    
//    EGGNotebook *nb = [EGGNotebook notebookWithName:@"libreta"
//                                            context:self.model.context];
//    EGGNote *note = [EGGNote noteWithName:@"nota1"
//                                 notebook:nb
//                                  context:self.model.context];
//    
//    EGGNote *note2 = [EGGNote noteWithName:@"nota2"
//                                  notebook:nb
//                                   context:self.model.context];
//    
//    //Buscar
//    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[EGGNote entityName]];
//    //Ordenamos los resultados
//    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:EGGNamedEntityAttributes.name
//                                                              ascending:YES],
//                                [NSSortDescriptor sortDescriptorWithKey:EGGNamedEntityAttributes.modificationDate
//                                                              ascending:NO]];
//    //Crear un limite de busquedad -> request.fetchLimit
//    
//    //Ejecutar la busqueda
//    NSError *error = nil;
//    NSArray *results = [self.model.context executeFetchRequest:request
//                                                         error:&error];
//    
//    //Ver que nos han devuelto
//    if (results == nil) {
//        NSLog(@"error al buscar %@", results);
//    }else{
//        NSLog(@"Results %@", results);
//    }
//    
//    //Eliminar
//    [self.model.copy deleteObject:note];
    
}

-(void)save{
    
    [self.model saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar %s \n\n %@", __func__,  error);
    }];
}

-(void)autoSave{
    
//    if (AUTO_SAVE) {
//        
//        NSLog(@"Autoguardando");
//        
//        [self save];
//        
//        [self performSelector:@selector(autoSave)
//                   withObject:nil
//                   afterDelay:AUTO_SAVE_DELAY_IN_SECONDS];
//    
//    }
}

@end
