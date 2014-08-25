//
//  honourModel.m
//  Prosecutor
//
//  Created by joanfen on 14-7-2.
//  Copyright (c) 2014年 joanfen. All rights reserved.
//

#import "honourModel.h"

@implementation honourModel
-(void)setDic:(NSDictionary *)dic{
    _dic = dic;
    self.pic = dic[@"pic"];
}
@end
