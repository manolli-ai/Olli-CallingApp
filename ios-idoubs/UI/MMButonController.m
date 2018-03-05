//
//  MMButonController.m
//  idoubs
//
//  Created by Man Huynh on 3/1/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import "MMButonController.h"

@implementation MMButonController
@synthesize optionIndices;
@synthesize parentView;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib {
    [super awakeFromNib];
    [self initButton];
}

- (void)initButton {
    [self addTarget:self action:@selector(onLeftMenuTapAct) forControlEvents:UIControlEventTouchUpInside];
}

-(void)onLeftMenuTapAct {
    NSArray *images = @[
                        [UIImage imageNamed:@"profile"],
                        [UIImage imageNamed:@"star"],
                        [UIImage imageNamed:@"globe"],
                        [UIImage imageNamed:@"gear"],
                        ];
    NSArray *colors = @[
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        ];
    NSArray *titles = @[
                        @"Profile",
                        @"Media",
                        @"NetWork",
                        @"Setting",
                        ];
    MMSideBarViewController *leftMenu = [[MMSideBarViewController alloc] initWithImages:images selectedIndices:self.optionIndices borderColors:colors titles:titles];
    leftMenu.delegate = self;
    [leftMenu show];
}

- (void)presentSettingPageFromRootView:(UIViewController *)page {
    UIViewController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (controller.presentedViewController != nil) {
        controller = controller.presentedViewController;
    }
    [controller presentViewController:page animated:YES completion:nil];
}

#pragma mark - MMSidebarDelegate

- (void)sidebar:(MMSideBarViewController *)sidebar didTapItemAtIndex:(NSUInteger)index {
    switch (index) {
        case 0:
        {
        //            OPen profile page
            ProfilePageViewController *profilePage = [[ProfilePageViewController alloc] init];
            [self presentSettingPageFromRootView:profilePage];
        break;
        }
            case 1:
        {
    //            OPen Media Setting page
            MediaPageViewController *mediaPage = [[MediaPageViewController alloc] init];
            [self presentSettingPageFromRootView:mediaPage];
            break;
        }
        case 2:
        {
            //            OPen Network setting page
            NetworkPageViewController *networkPage = [[NetworkPageViewController alloc] init];
            [self presentSettingPageFromRootView:networkPage];
            break;
        }
        case 3:
            //            OPen Setting up device page
            break;
        default:
            break;
}
    if(index != 3)
        [sidebar dismissAnimated:YES completion:nil];
}

- (void)sidebar:(MMSideBarViewController *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index {
    if (itemEnabled) {
        [self.optionIndices addIndex:index];
    }
    else {
        [self.optionIndices removeIndex:index];
    }
}

@end
