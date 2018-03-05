//
//  LoginOViewController.m
//  idoubs
//
//  Created by Man Huynh on 2/9/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import "LoginOViewController.h"

#define LoginViewY self.LoginView.frame.origin.y
#define LoginViewH self.LoginView.frame.size.height

@interface LoginOViewController ()

@end

@implementation LoginOViewController
@synthesize isKeyboarShowing;

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField == self.ID)
       [self.Password becomeFirstResponder];
    if(textField == self.Password)
        [self.Password resignFirstResponder];
       
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    [GIDSignIn sharedInstance].uiDelegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)initUI {
    
    self.LoginBnt.layer.cornerRadius = 17.5;
//    self.Google.layer.cornerRadius = 25;
    self.Facebook.layer.cornerRadius = 25;
    
//    self.Logo.layer.cornerRadius = self.Logo.frame.size.width/2;
//    self.Logo.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.Logo.layer.borderWidth = 1.5;
    
    self.Logo.layer.shadowRadius  = 1.5f;
    self.Logo.layer.shadowColor   = [UIColor colorWithRed:176.f/255.f green:199.f/255.f blue:226.f/255.f alpha:1.f].CGColor;
    self.Logo.layer.shadowOffset  = CGSizeMake(1.5f, 1.5f);
    self.Logo.layer.shadowOpacity = 0.9f;
    self.Logo.layer.masksToBounds = NO;
    
//    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(0, 1.5f, -1.5f, 0);
    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRoundedRect:self.Logo.bounds cornerRadius:self.Logo.frame.size.height/2];//[UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(self.Logo.bounds, shadowInsets)];
    self.Logo.layer.shadowPath    = shadowPath.CGPath;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animatedLoginView {
    [UIView animateWithDuration:0.5f animations:^{
        if(self.LoginView.frame.origin.y > 190 && isKeyboarShowing == true)
            self.LoginView.frame = CGRectOffset(self.LoginView.frame, 0 , LoginViewY - LoginViewH);
        else  if(self.LoginView.frame.origin.y < 190 && isKeyboarShowing == false)
            self.LoginView.frame = CGRectOffset(self.LoginView.frame, 0 , LoginViewY + 28);
    }];
}

-(IBAction)Login:(id)sender {
    [self.ID resignFirstResponder];
    [self.Password resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapSignIn:(id)sender {
    [[GIDSignIn sharedInstance] signIn];
}
- (IBAction)didTapSignOut:(id)sender {
    [[GIDSignIn sharedInstance] signOut];
}
-(IBAction)CreateNewAccountAct:(id)sender {
    RegisterViewController *registerView = [[RegisterViewController alloc] init];
    [self presentViewController:registerView animated:YES completion:nil];
}
- (void)keyboardWasShown:(NSNotification *)aNotification {
    self.isKeyboarShowing = true;
    [self animatedLoginView];
}
- (void)keyboardWillBeHidden:(NSNotification *)aNotification
{
    self.isKeyboarShowing = false;
    [self animatedLoginView];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// Implement these methods only if the GIDSignInUIDelegate is not a subclass of
// UIViewController.

// Stop the UIActivityIndicatorView animation that was started when the user
// pressed the Sign In button
- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
    [UIActivityIndicatorView setAnimationDidStopSelector:NULL];
}

// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn
presentViewController:(UIViewController *)viewController {
    [self presentViewController:viewController animated:YES completion:nil];
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn
dismissViewController:(UIViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
