//
//  EGGNotebooksViewController.m
//  bnotes
//
//  Created by Edu González on 25/1/16.
//  Copyright © 2016 Edu González. All rights reserved.
//

#import "EGGNotebooksViewController.h"
#import "EGGNotebook.h"

@interface EGGNotebooksViewController ()

@end

@implementation EGGNotebooksViewController

#pragma mark - View Lyfecycle

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.title = @"bnotes";
    
    //Creamos un boton para añadir notebooks
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                  target:self
                                  action:@selector(addNotebook:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    //boton de edicion
    self.navigationItem.leftBarButtonItem = self.editButtonItem;//todo UIViewController tiene una propidedad editButton...
    
    //Alta en notificacion de sensor de proximidad
    UIDevice *device = [UIDevice currentDevice];
    if ([self hasProximitySensor]) {
        [device setProximityMonitoringEnabled:YES];
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(proximityStateDidChange:)
                   name:UIDeviceProximityStateDidChangeNotification
                 object:nil];
        
    }

}
//Damos de baja la notificacion
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
    
}

#pragma mark - Actions
//añadir una notebook
-(void)addNotebook:(id)sender{
    
    [EGGNotebook notebookWithName:@"nuevo Notebook"
                          context:self.fetchedResultsController.managedObjectContext];
                        //el contexto que todo objeto de coreData tiene asociado y conoce
}

#pragma mark - Data Source

-(void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //avergiguamos la celda
        EGGNotebook *deleteNotebook = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        //la borramos del modelo
        [self.fetchedResultsController.managedObjectContext deleteObject:deleteNotebook];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Cual es la notebook
    EGGNotebook *notebook = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Creamos una celda
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellId];
    }
    
    //Sincronizamos la notebook con la vista, con la celda
    cell.textLabel.text = notebook.name;
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateStyle = NSDateFormatterMediumStyle;
    cell.detailTextLabel.text = [formater stringFromDate:notebook.modificationDate];
    
    //Devolvemos la celda
    return cell;
}

#pragma mark - Proximity Sensor
-(BOOL)hasProximitySensor{
    
    UIDevice *device = [UIDevice currentDevice];
    
    
    BOOL oldValue = [device isProximityMonitoringEnabled];
    [device setProximityMonitoringEnabled:!oldValue];

    BOOL newValue = [device isProximityMonitoringEnabled];
    [device setProximityMonitoringEnabled:oldValue];
    
    return (oldValue != newValue);
}

//UIDeviceProximityStateDidChangeNotification
-(void)proximityStateDidChange:(NSNotification *)notification{
    
    [self.fetchedResultsController.managedObjectContext.undoManager undo];
    
    
}

@end
