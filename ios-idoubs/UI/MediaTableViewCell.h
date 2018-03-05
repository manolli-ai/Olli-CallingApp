//
//  MediaTableViewCell.h
//  idoubs
//
//  Created by Man Huynh on 3/2/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaTableViewCell : UITableViewCell {
    
}
@property(nonatomic, weak) IBOutlet UILabel *title;
@property(nonatomic, weak) IBOutlet UISwitch *value;
@end
