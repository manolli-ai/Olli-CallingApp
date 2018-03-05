//
//  NetworkPageViewController.h
//  idoubs
//
//  Created by Man Huynh on 3/5/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkTableViewCell.h"
#import "LoginOViewController.h"

@interface NetworkPageViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
    NSArray *netWorkData ;
}

@property(nonatomic, retain) NSArray *netWorkData ;
@property(nonatomic, weak) IBOutlet UIButton *backBnt;
@property(nonatomic, retain) IBOutlet UIButton *relogBnt;

-(IBAction)Back:(id)sender;
-(IBAction)Relog:(id)sender;
@end
