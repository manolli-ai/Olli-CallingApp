//
//  MMButonController.h
//  idoubs
//
//  Created by Man Huynh on 3/1/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMSideBarViewController.h"
#import "ProfilePageViewController.h"
#import "MediaPageViewController.h"
#import "NetworkPageViewController.h"

@interface MMButonController : UIButton <MMSideBarDelegate> {
    NSMutableIndexSet *optionIndices;
    UIViewController *parentView;
}
@property (nonatomic, assign) UIViewController *parentView;
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;

- (void)initButton;
@end
