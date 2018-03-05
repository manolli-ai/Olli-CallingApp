//
//  LoginOViewController.h
//  idoubs
//
//  Created by Man Huynh on 2/9/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "GoogleSignIn/GoogleSignIn.h"
#import "RegisterViewController.h"
@interface LoginOViewController : UIViewController<UITextFieldDelegate,GIDSignInUIDelegate> {
    BOOL isKeyboarShowing;
}
@property(nonatomic) BOOL isKeyboarShowing;
@property(nonatomic, retain) IBOutlet UIImageView *Logo;
@property(nonatomic, retain) IBOutlet UIButton *LoginBnt;
@property(nonatomic, retain) IBOutlet UIView *LoginView;
@property(nonatomic, retain) IBOutlet FBSDKLoginButton *Facebook;
@property(nonatomic, retain) IBOutlet UIButton *ForgotPassword;
@property(nonatomic, retain) IBOutlet UITextField *ID;
@property(nonatomic, retain) IBOutlet UITextField *Password;
@property(retain, nonatomic) IBOutlet GIDSignInButton *Google;

-(IBAction)Login:(id)sender;
- (IBAction)didTapSignOut:(id)sender;
- (IBAction)didTapSignIn:(id)sender;
-(IBAction)CreateNewAccountAct:(id)sender;
@end
