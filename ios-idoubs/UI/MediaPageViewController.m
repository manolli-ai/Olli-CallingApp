//
//  MediaPageViewController.m
//  idoubs
//
//  Created by Man Huynh on 3/1/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import "MediaPageViewController.h"

@interface MediaPageViewController ()

@end

@implementation MediaPageViewController
@synthesize mediaData;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initMediaData];
}

- (void)initMediaData {
//    self.mediaData = @[
//                       @[
//                           @"profile",
//                           @"preferred video size",
//                           @"zero video artifacts(perfect quality)",
//                           ],
//                       @[
//                           @"OPUS",
//                           @"PCMA",
//                           @"PCMU",
//                           ],
//                       @[
//                           @"H.264 Base Profile",
//                           @"H.264 Main Profile",
//                           @"VP8",
//                           ],
//    ];
    
    self.mediaData = @[
                       @{
                           @"Media": @[
                                   @{@"OPUS":@"OPUS"},
                                   @{@"PCMA":@"PCMA"},
                                   @{@"PCMU":@"PCMU"},
                                   ]
                           },
                       @{
                           @"Audio codec": @[
                                   @{@"profile":@"profile"},
                                   @{@"preferred video size":@"preferred video size"},
                                   @{@"zero video artifacts(perfect quality)":@"zero video artifacts(perfect quality)"},
                                   ]
                           },
                       @{
                           @"Video codec": @[
                                   @{@"H.264 Base Profile":@"H.264 Base Profile"},
                                   @{@"H.264 Main Profile":@"H.264 Main Profile"},
                                   @{@"VP8":@"VP8"},
                                   ]
                           },
                       ];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellMediaIdentifier = @"cellMedia";
    MediaTableViewCell *cell = (MediaTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellMediaIdentifier];
    if(cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MediaTableViewCell" owner:self options:nil] lastObject];
    }
    cell.title.text = [[[[[[self.mediaData objectAtIndex:indexPath.section] allValues] objectAtIndex:0] objectAtIndex:indexPath.row] allValues] objectAtIndex:0];
    return cell;
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    NSString *title;
//    switch (section) {
//        case 0:
//        {
//            title = @"Media";
//            break;
//        }
//        case 1:{
//            title = @"Audio codec";
//            break;
//        }
//        case 2:{
//            title = @"Video codec";
//            break;
//        }
//        default:
//            break;
//    }
//    return title;
    return [[[self.mediaData objectAtIndex:section] allKeys] objectAtIndex:0];
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[[self.mediaData objectAtIndex:section] allValues] objectAtIndex:0] count];
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    //
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    //
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    //
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeMake(44, 44);
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    //
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    //
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    //
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    //
}

- (void)setNeedsFocusUpdate {
    //
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return YES;
}

- (void)updateFocusIfNeeded {
    //
}

@end
