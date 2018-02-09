/* Copyright (C) 2010-2011, Mamadou Diop.
 * Copyright (c) 2011, Doubango Telecom. All rights reserved.
 *
 * Contact: Mamadou Diop <diopmamadou(at)doubango(dot)org>
 *       
 * This file is part of iDoubs Project ( http://code.google.com/p/idoubs )
 *
 * idoubs is free software: you can redistribute it and/or modify it under the terms of 
 * the GNU General Public License as published by the Free Software Foundation, either version 3 
 * of the License, or (at your option) any later version.
 *       
 * idoubs is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
 * See the GNU General Public License for more details.
 *       
 * You should have received a copy of the GNU General Public License along 
 * with this program; if not, write to the Free Software Foundation, Inc., 
 * 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *
 */
#import "NumpadViewController.h"
#import "CallViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "idoubs2AppDelegate.h"
#import "idoubs2Constants.h"

#define kTAGStar		10
#define kTAGSharp		11
#define kTAGAudioCall	12
#define kTAGDelete		13
#define kTAGMessages	14
#define kTAGVideoCall	15

@interface NumpadViewController(Private)
-(void) updateStatus:(MBProgressHUD *)hud;
@end

@interface NumpadViewController(SipCallbacks)
-(void) onRegistrationEvent:(NSNotification*)notification;
-(void) onLongClick:(UIButton*)sender;
@end

@implementation NumpadViewController(Private)

-(void) updateStatus:(MBProgressHUD *)hud{
	if([mSipService isRegistered]){
		viewStatus.backgroundColor = [UIColor greenColor];
		labelStatus.text = @"Connected";
            dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                // Do something...
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                });
            });
	}
	else {
		viewStatus.backgroundColor = [UIColor grayColor];
		labelStatus.text = @"Not Connected";
	}
}

@end

@implementation NumpadViewController(SipCallbacks)

//== REGISTER events == //
-(void) onRegistrationEvent:(NSNotification*)notification {
	NgnRegistrationEventArgs* eargs = [notification object];
	switch (eargs.eventType) {
			// provisional responses
		case REGISTRATION_INPROGRESS:
		case UNREGISTRATION_INPROGRESS:
        {
			[activityIndicator startAnimating];
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
			break;
        }
			// final responses
		case REGISTRATION_OK:
		case REGISTRATION_NOK:
		case UNREGISTRATION_OK:
		case UNREGISTRATION_NOK:
		default:
			[activityIndicator stopAnimating];
			break;
	}
    [self updateStatus:nil];
}

-(void) onLongClick:(UIButton*)sender{
	if(sender.tag == 0){
		if([labelNumber.text hasSuffix: @"0"]){
			labelNumber.text = [NSString stringWithFormat:@"%@+", [labelNumber.text substringToIndex: [labelNumber.text length]-1]];
		}
	}
}

@end


@implementation NumpadViewController

@synthesize activityIndicator;
@synthesize labelStatus;
@synthesize viewStatus;
@synthesize labelNumber;
@synthesize buttonMakeAudioCall;

/*
- (id)initWithCoder:(NSCoder *)decoder{
	self = [super initWithCoder:decoder];
    if (self) {
		for(UIView *v in self.view.subviews){
			if([v isKindOfClass: [UIButton class]]){
				switch (((UIButton*)v).tag) {
					case kTAGMessages: case kTAGAudioCall: case kTAGDelete: case kTAGStar: case kTAGSharp:
					case 0: case 1: case 2: case 3: case 4: case 5: case 6: case 7: case 8: case 9:
						[((UIButton*)v) setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d_keypad", ((UIButton*)v).tag]] forState:UIControlStateNormal];
						[((UIButton*)v) setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d_keypad_pressed", ((UIButton*)v).tag]] forState:UIControlStateSelected];
						break;
				}
			}
		}
    }
    return self;
}
*/
- (void)viewDidLoad {
    [super viewDidLoad];
	
	NgnEngine* ngnEngine = [[NgnEngine sharedInstance] retain];
	mSipService = [[ngnEngine getSipService] retain];
	mConfigurationService = [[ngnEngine getConfigurationService] retain];
	[ngnEngine release];
	
    [self updateStatus:nil];
	
	[[NSNotificationCenter defaultCenter]
	 addObserver:self selector:@selector(onRegistrationEvent:) name:kNgnRegistrationEventArgs_Name object:nil];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
	[[NSNotificationCenter defaultCenter] removeObserver: self];
	
	[mSipService release];
	[mConfigurationService release];
}

-(void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	[[NgnEngine sharedInstance].soundService setSpeakerEnabled:YES];
}

- (IBAction)Login:(id)sender {
//    [[NgnEngine sharedInstance] start];
    [[NgnEngine sharedInstance].sipService registerIdentity];
    [self updateStatus:nil];
}

- (IBAction)Logout:(id)sender {
    [[NgnEngine sharedInstance].sipService unRegisterIdentity];
    [self updateStatus:nil];
}

- (IBAction) onButtonNumpadDown: (id) sender event: (UIEvent*) e{
	NSInteger tag = ((UIButton*)sender).tag;
	
	switch (tag) {
		case kTAGMessages:
		{
			idoubs2AppDelegate* appDelegate = ((idoubs2AppDelegate*) [[UIApplication sharedApplication] delegate]);
            [appDelegate.tabBarController presentViewController:appDelegate.messagesViewController animated:YES completion:nil];
			break;
		}
			
		case kTAGAudioCall:
		case kTAGVideoCall:
		{
			if(tag == kTAGVideoCall){
				[CallViewController makeAudioVideoCallWithRemoteParty: labelNumber.text  andSipStack: [mSipService getSipStack]];
			}
			else{
				[CallViewController makeAudioCallWithRemoteParty: labelNumber.text  andSipStack: [mSipService getSipStack]];
			}
			labelNumber.text = @"";
			break;
		}
			
		case kTAGDelete:
		{
			NSString* number = labelNumber.text;
			if([number length] >0){
				labelNumber.text = [number substringToIndex:([number length]-1)];
			}
			break;
		}
			
		case kTAGStar:
		{
			labelNumber.text = [labelNumber.text stringByAppendingString:@"*"];
			[[NgnEngine sharedInstance].soundService playDtmf:kTAGStar];
			break;
		}
			
		case kTAGSharp:
		{
			labelNumber.text = [labelNumber.text stringByAppendingString:@"#"];
			[[NgnEngine sharedInstance].soundService playDtmf:kTAGSharp];
			break;
		}
			
		case 0: case 1: case 2: case 3: case 4: case 5: case 6: case 7: case 8: case 9:
		{
            labelNumber.text = [labelNumber.text stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)tag]];
			if(tag == 0){
				[self performSelector:@selector(onLongClick:) withObject:sender afterDelay:.5];
			}
			[[NgnEngine sharedInstance].soundService playDtmf:tag];
			break;
		}
	}
}

- (IBAction) onButtonNumpadUp: (id) sender event: (UIEvent*) e{
	if(((UIButton*)sender).tag == 0){
		[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(onLongClick:) object:sender];
	}
}

- (void)dealloc {
	[activityIndicator release];
	[labelStatus release];
	[viewStatus release];
	[labelNumber release];
	[buttonMakeAudioCall release];
	
    [super dealloc];
}


@end
