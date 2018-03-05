//
//  RegisterViewController.m
//  idoubs
//
//  Created by Man Huynh on 2/22/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import "RegisterViewController.h"

#define RegisterViewY self.RegisterView.frame.origin.y
#define RegisterViewH self.RegisterView.frame.size.height

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize isKeyboarShowing;

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField == self.Username)
        [self.Email becomeFirstResponder];
    else if(textField == self.Email)
        [self.Password becomeFirstResponder];
    else if(textField == self.Password)
        [self.RePassword becomeFirstResponder];
    else if(textField == self.RePassword)
        [self.RePassword resignFirstResponder];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self InitUI];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)InitUI {
    self.RegisterBnt.layer.cornerRadius = 30;
}
- (void)animatedRegisterView {
    [UIView animateWithDuration:0.5f animations:^{
        if(self.RegisterView.frame.origin.y > 182 && isKeyboarShowing == true)
            self.RegisterView.frame = CGRectOffset(self.RegisterView.frame, 0 , RegisterViewY - RegisterViewH);
        else  if(self.RegisterView.frame.origin.y < 182 && isKeyboarShowing == false)
            self.RegisterView.frame = CGRectOffset(self.RegisterView.frame, 0 , RegisterViewY + 28);
    }];
}

- (void)keyboardWasShown:(NSNotification *)aNotification {
    self.isKeyboarShowing = true;
    NSLog(@"kiem tra y %f", self.RegisterView.frame.origin.y);
    [self animatedRegisterView];
}
- (void)keyboardWillBeHidden:(NSNotification *)aNotification
{
    self.isKeyboarShowing = false;
    [self animatedRegisterView];
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

-(BOOL)validationTextF {
    return false;
}
-(IBAction)RegisterAct:(id)sender {
    //    TODO : call web service
}
-(IBAction)CancelAct:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
