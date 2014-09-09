//
//  InformationModel.h
//  Prosecutor
//
//  Created by Jason on 14-7-9.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InformationModel : NSObject
@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *date;
@property(nonatomic,assign) NSInteger cid;
@property(nonatomic,copy)NSDictionary *dic;
@end
