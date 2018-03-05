//
//  NetworkPageViewController.m
//  idoubs
//
//  Created by Man Huynh on 3/5/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import "NetworkPageViewController.h"

@interface NetworkPageViewController ()

@end

@implementation NetworkPageViewController
@synthesize netWorkData;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    [self initData];
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
-(void)initUI {
    self.relogBnt.layer.cornerRadius = 25;
}
-(void)initData {
    self.netWorkData = @[
                         @"Proxy Host",
                         @"Proxy Port",
                         @"Transport",
                         ];
}

-(IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)Relog:(id)sender {
    LoginOViewController *logView = [[LoginOViewController alloc] init];
    [self presentViewController:logView animated:YES completion:nil];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellNetworkindentifier = @"cellNetwork";
    NetworkTableViewCell *cell = (NetworkTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellNetworkindentifier];
    if(cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NetworkTableViewCell" owner:self options:nil] lastObject];
    }
    cell.title.text = [self.netWorkData objectAtIndex:indexPath.row];
    NSString *placeHolder;
    switch (indexPath.row) {
        case 0:
            placeHolder = @"127.0.0.1";
            break;
        case 1:
            placeHolder = @"5060";
            break;
        case 2:
            placeHolder = @"UDP";
            break;
        default:
            break;
    }
    cell.content.placeholder = placeHolder;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.netWorkData count];
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
