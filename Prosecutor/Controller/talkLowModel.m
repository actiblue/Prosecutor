//
//  talkLowModel.m
//  Prosecutor
//
//  Created by joanfen on 14-7-1.
//  Copyright (c) 2014年 joanfen. All rights reserved.
//

#import "talkLowModel.h"

@implementation talkLowModel
-(void)setDic:(NSDictionary *)dic{
    _dic = dic;
    self.title = dic[@"title"];
    self.date = dic[@"cdate"];
    self.cid = [dic[@"cid"] integerValue];
}
@end
