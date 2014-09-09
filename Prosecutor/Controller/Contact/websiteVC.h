//
//  websiteVC.h
//  Prosecutor
//
//  Created by Jason on 14-7-2.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface websiteVC : UIViewController
@property (nonatomic, retain) NSURLRequest *request;
@property (nonatomic, retain) NSString *navigationTitle;
@property (strong, nonatomic) IBOutlet UIWebView *webview;

@end
