//
//  MediaPageViewController.h
//  idoubs
//
//  Created by Man Huynh on 3/1/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaTableViewCell.h"
@interface MediaPageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
    NSArray *mediaData;
}
@property(nonatomic, retain) NSArray *mediaData;
@property(nonatomic, weak) IBOutlet UIButton *backBnt;
@property(nonatomic, retain) IBOutlet UITableView *mediaTbv;

-(IBAction)Back:(id)sender;
@end
