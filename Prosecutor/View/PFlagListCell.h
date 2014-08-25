//
//  PFlagListCell.h
//  Prosecutor
//
//  Created by joanfen on 14-6-11.
//  Copyright (c) 2014年 joanfen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFlagListCell : UITableViewCell


+(UINib *)nib;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@end
