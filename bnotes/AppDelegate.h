//
//  AppDelegate.h
//  bnotes
//
//  Created by Edu González on 21/1/16.
//  Copyright © 2016 Edu González. All rights reserved.
//

@class AGTSimpleCoreDataStack;
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AGTSimpleCoreDataStack *model;


@end

