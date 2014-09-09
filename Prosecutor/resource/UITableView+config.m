//
//  UITableView+config.m
//  WenGe
//
//  Created by Jason on 14-5-15.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
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
