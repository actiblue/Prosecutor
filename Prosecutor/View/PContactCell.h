//
//  PContactCell.h
//  Prosecutor
//
//  Created by joanfen on 14-6-12.
//  Copyright (c) 2014年 joanfen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PContactCell : UITableViewCell

+(UINib *)nib;

@property (strong, nonatomic) IBOutlet UIImageView *iconImg;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@end
