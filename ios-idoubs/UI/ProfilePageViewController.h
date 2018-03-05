//
//  ProfilePageViewController.h
//  idoubs
//
//  Created by Man Huynh on 2/28/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileTableViewCell.h"
#import "ProfileAvataTableViewCell.h"
#import "LoginOViewController.h"
@interface ProfilePageViewController : UIViewController <UITableViewDelegate,UITableViewDataSource> {
    NSArray *profileData;
    BOOL isKeyboarShowing;
}
@property(nonatomic) BOOL isKeyboarShowing;
@property(nonatomic,retain) IBOutlet UITableView *profileTableView;
@property(nonatomic,retain)NSArray *profileData;
@property(nonatomic,weak) IBOutlet UIButton *logOutBnt;
@property(nonatomic,weak) IBOutlet UIButton *backBnt;
-(IBAction)Back:(id)sender;
-(IBAction)LogOut:(id)sender;
@end
