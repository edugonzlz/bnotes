//
//  EGGNotebooksViewController.m
//  bnotes
//
//  Created by Edu González on 25/1/16.
//  Copyright © 2016 Edu González. All rights reserved.
//

#import "EGGNotebooksViewController.h"
#import "EGGNotebook.h"
#import "EGGNotebookViewCell.h"

//constante definida solo para mostrar como registrar una celda personalizada de otra forma alternativa
#define CUSTOM_CELL_ID_1 @"CustomCellId1"

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
    
    //Registramos el nib de la celda
    UINib *cellNib = [UINib nibWithNibName:@"EGGNotebookCellView"
                                    bundle:nil];
    [self.tableView registerNib:cellNib
         forCellReuseIdentifier:[EGGNotebookViewCell cellID]];
    
    //Tambien se puede registrar asi
//    [self.tableView registerClass:[EGGNotebookViewCell class]
//           forCellReuseIdentifier:CUSTOM_CELL_ID_1];


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
        //averiguamos la celda
        EGGNotebook *deleteNotebook = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        //la borramos del modelo
        [self.fetchedResultsController.managedObjectContext deleteObject:deleteNotebook];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Cual es la notebook
    EGGNotebook *notebook = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
//    //Creamos una celda
//    static NSString *cellId = @"cellId";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
//                                     reuseIdentifier:cellId];
//    }
//    
//    //Sincronizamos la notebook con la vista, con la celda
//    cell.textLabel.text = notebook.name;
//    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
//    formater.dateStyle = NSDateFormatterMediumStyle;
//    cell.detailTextLabel.text = [formater stringFromDate:notebook.modificationDate];
    
    //Creamos la celda
    EGGNotebookViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[EGGNotebookViewCell cellID]];
    
    //Sincronizamos con la vista
    cell.nameView.text = notebook.name;
    cell.numberOfNotesView.text = [NSString stringWithFormat:@"%lu", (unsigned long)notebook.notes.count];
    
    //Devolvemos la celda
    return cell;
}

#pragma mark - TableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [EGGNotebookViewCell cellHeight];
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
    
    //Como ejemplo realizamos un undo
    [self.fetchedResultsController.managedObjectContext.undoManager undo];
    
}

@end
