//
//  sceneModel.m
//  Prosecutor
//
//  Created by Jason on 14-7-2.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import "sceneModel.h"

@implementation sceneModel
-(void)setDic:(NSDictionary *)dic{
    _dic = dic;
    self.title = dic[@"title"];
    self.date = dic[@"cdate"];
    self.cid = [dic[@"cid"] integerValue];
}
@end
