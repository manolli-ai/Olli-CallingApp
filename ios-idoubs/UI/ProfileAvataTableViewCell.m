//
//  ProfileAvataTableViewCell.m
//  idoubs
//
//  Created by Man Huynh on 2/28/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import "ProfileAvataTableViewCell.h"

@implementation ProfileAvataTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)initUI {
    self.avata.layer.cornerRadius = 20;
}

@end
