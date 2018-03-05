//
//  ProfilePageViewController.m
//  idoubs
//
//  Created by Man Huynh on 2/28/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import "ProfilePageViewController.h"

@interface ProfilePageViewController ()

@end

@implementation ProfilePageViewController
@synthesize profileData;
@synthesize isKeyboarShowing;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    [self initProfileData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
    self.logOutBnt.layer.cornerRadius = 25;
}
- (void)initProfileData {
    self.profileData = @[
                         @[
                            @"Avata",
                            @"Display Name",
                            @"Code",
                         ],
                         @[
                            @"Dob",
                            @"Email",
                            @"Phone number",],
                         ];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellProfile";
    static NSString *cellAvataIdentifier = @"cellProfileAvata";
    if(indexPath.section == 0 && indexPath.row == 0) {
            ProfileAvataTableViewCell *cellAvata = (ProfileAvataTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellAvataIdentifier];
        if(cellAvata == nil) {
            cellAvata = [[[NSBundle mainBundle] loadNibNamed:@"ProfileAvataTableViewCell" owner:self options:nil] lastObject];
        }
        [cellAvata initUI];
        cellAvata.avata.image = [UIImage imageNamed:@"profile"];
        return cellAvata;
    }
    else {
        ProfileTableViewCell *cell = (ProfileTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if(cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ProfileTableViewCell" owner:self options:nil] lastObject];
        }
        if(indexPath.section > 0)
            cell.index = 1 + indexPath.row + [[self.profileData objectAtIndex:indexPath.section] count];
        else
            cell.index = 1 + indexPath.section + indexPath.row ;
        [cell initConfigCell];
        cell.title.text = [(NSArray *)[self.profileData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        return cell;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"Private information";
            break;
        case 1:
            sectionName =@"your app information";
            break;
            // ...
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSInteger row = 0;
//    if(section == 0)
//        row = [[self.profileData objectAtIndex:section] count];
//    else if(section == 1)
//        row = 3;
//    return row;
    return [[self.profileData objectAtIndex:section] count];
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
    return CGSizeMake(40, 40);
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
    return  YES;
}

- (void)updateFocusIfNeeded {
    //
}


-(IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)LogOut:(id)sender {
    LoginOViewController *loginView = [[LoginOViewController alloc] init];
    [self presentViewController:loginView animated:YES completion:^{

    }];
}
- (void)keyboardWasShown:(NSNotification *)aNotification {
    self.isKeyboarShowing = true;
    [self animateProfileTableView];
}
- (void)keyboardWillBeHidden:(NSNotification *)aNotification
{
    self.isKeyboarShowing = false;
    [self animateProfileTableView];
}

- (void)animateProfileTableView {
    [UIView animateWithDuration:0.5f animations:^{
        if(self.profileTableView.frame.origin.y > 100 && isKeyboarShowing == true)
            self.profileTableView.frame = CGRectOffset(self.profileTableView.frame, 0 , -120);
        else  if(self.profileTableView.frame.origin.y < 100 && isKeyboarShowing == false)
            self.profileTableView.frame = CGRectOffset(self.profileTableView.frame, 0 , 120);
    }];
}

@end
