//
//  ProfileAvataTableViewCell.h
//  idoubs
//
//  Created by Man Huynh on 2/28/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileAvataTableViewCell : UITableViewCell {
    
}
@property(nonatomic,weak) IBOutlet UIImageView *avata;
@property(nonatomic,weak) IBOutlet UILabel *title;
- (void)initUI;
@end
