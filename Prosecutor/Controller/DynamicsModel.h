//
//  DynamicsModel.h
//  Prosecutor
//
//  Created by joanfen on 14-7-1.
//  Copyright (c) 2014年 joanfen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicsModel : NSObject
@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *date;
@property(nonatomic,assign) NSInteger cid;
@property(nonatomic,copy)NSDictionary *dic;
@end
