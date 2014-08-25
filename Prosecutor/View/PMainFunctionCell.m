//
//  PMainFunctionCell.m
//  Prosecutor
//
//  Created by xiaoliangwang on 14-6-9.
//  Copyright (c) 2014年 xiaoliangwang. All rights reserved.
//

#import "PMainFunctionCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation PMainFunctionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)configureCellWithImage:(UIImage *)image title:(NSString *)title{
   
    self.ImgView.image = image;
    self.title.text = title;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5.0;
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.layer.borderWidth = 0.5;
}
@end
