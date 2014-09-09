//
//  InformationDetailVC.h
//  Prosecutor
//
//  Created by Jason on 14-7-9.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationDetailVC : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property(nonatomic,assign)NSInteger cid;
@end
