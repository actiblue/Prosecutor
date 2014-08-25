//
//  PFlagListCell.m
//  Prosecutor
//
//  Created by joanfen on 14-6-11.
//  Copyright (c) 2014年 joanfen. All rights reserved.
//

#import "PFlagListCell.h"

@implementation PFlagListCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(UINib *)nib{
    return [UINib nibWithNibName:@"PFlagListCell" bundle:nil];
}
@end
