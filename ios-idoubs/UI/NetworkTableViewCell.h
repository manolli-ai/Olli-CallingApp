//
//  NetworkTableViewCell.h
//  idoubs
//
//  Created by Man Huynh on 3/5/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkTableViewCell : UITableViewCell {
    
}

@property(nonatomic,retain) IBOutlet UILabel *title;
@property(nonatomic, retain) IBOutlet UITextField *content;

@end
