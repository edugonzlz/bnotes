//
//  EGGNotebookViewCell.m
//  bnotes
//
//  Created by Edu González on 28/1/16.
//  Copyright © 2016 Edu González. All rights reserved.
//

#import "EGGNotebookViewCell.h"

@implementation EGGNotebookViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Class Methods

+(NSString *)cellID{
    return NSStringFromClass(self);//Te devuelve una cadena de texto desde el nombre de la clase
}
+(CGFloat) cellHeight{
    return 66.0f;
}

@end
