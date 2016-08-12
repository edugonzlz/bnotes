//
//  UIViewController+Navigation.m
//  bnotes
//
//  Created by Edu González on 26/1/16.
//  Copyright © 2016 Edu González. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)


-(UINavigationController *)wrappedInNavigation{

    //crear un navigationController y me meto a mi mismo en el navigation
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:self];
    
    //devolvemos el navigation
    return nav;
}

@end
