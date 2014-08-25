//
//  websiteVC.h
//  Prosecutor
//
//  Created by joanfen on 14-7-2.
//  Copyright (c) 2014年 joanfen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface websiteVC : UIViewController
@property (nonatomic, retain) NSURLRequest *request;
@property (nonatomic, retain) NSString *navigationTitle;
@property (strong, nonatomic) IBOutlet UIWebView *webview;

@end
