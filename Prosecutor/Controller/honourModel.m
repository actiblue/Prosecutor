//
//  honourModel.m
//  Prosecutor
//
//  Created by Jason on 14-7-2.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import "honourModel.h"

@implementation honourModel
-(void)setDic:(NSDictionary *)dic{
    _dic = dic;
    self.pic = dic[@"pic"];
}
@end
