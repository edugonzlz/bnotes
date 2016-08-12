//
//  EGGNotebookViewCell.h
//  bnotes
//
//  Created by Edu González on 28/1/16.
//  Copyright © 2016 Edu González. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGGNotebookViewCell : UITableViewCell

@property (nonatomic, strong)IBOutlet UILabel *nameView;
@property (nonatomic, strong)IBOutlet UILabel *numberOfNotesView;

+(NSString *)cellID;
+(CGFloat) cellHeight;

@end
