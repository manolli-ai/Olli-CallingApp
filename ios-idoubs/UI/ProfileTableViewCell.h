//
//  ProfileTableViewCell.h
//  idoubs
//
//  Created by Man Huynh on 2/28/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileTableViewCell : UITableViewCell<UITextFieldDelegate> {
    BOOL isKeyboarShowing;
}
@property(nonatomic) BOOL isKeyboarShowing;
@property(nonatomic, assign) NSUInteger index;
@property(nonatomic,weak) IBOutlet UILabel *title;
@property(nonatomic,weak) IBOutlet UITextField *content;
- (void)initConfigCell;
@end
