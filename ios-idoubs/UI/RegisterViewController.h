//
//  RegisterViewController.h
//  idoubs
//
//  Created by Man Huynh on 2/22/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UITextFieldDelegate> {
    BOOL isKeyboarShowing;
}
@property(nonatomic) BOOL isKeyboarShowing;
@property(nonatomic,retain) IBOutlet UIView *RegisterView;
@property(nonatomic, retain) IBOutlet UITextField *Username;
@property(nonatomic, retain) IBOutlet UITextField *Email;
@property(nonatomic, retain) IBOutlet UITextField *Password;
@property(nonatomic, retain) IBOutlet UITextField *RePassword;
@property(nonatomic, retain) IBOutlet UIButton *RegisterBnt;
@property(nonatomic, retain) IBOutlet UIButton *CancelBnt;

-(IBAction)RegisterAct:(id)sender;
-(IBAction)CancelAct:(id)sender;
@end
