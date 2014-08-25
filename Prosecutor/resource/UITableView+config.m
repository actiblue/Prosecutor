//
//  UITableView+config.m
//  WenGe
//
//  Created by 张琼芳 on 14-5-15.
//  Copyright (c) 2014年 江苏网商软件. All rights reserved.
//

#import "UITableView+config.h"

@implementation UITableView (config)
-(void)setExtraCellLineHidden
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
    
}
@end
