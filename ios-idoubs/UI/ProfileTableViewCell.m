//
//  ProfileTableViewCell.m
//  idoubs
//
//  Created by Man Huynh on 2/28/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import "ProfileTableViewCell.h"

@implementation ProfileTableViewCell
@synthesize index;
@synthesize isKeyboarShowing;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)initConfigCell {
    self.content.tag = self.index;
}
@end
