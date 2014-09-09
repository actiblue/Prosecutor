//
//  dynamicsDetailVC.m
//  Prosecutor
//
//  Created by Jason on 14-7-1.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import "dynamicsDetailVC.h"

@interface dynamicsDetailVC ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation dynamicsDetailVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    dispatch_queue_t urlRequest = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(urlRequest, ^{
    
        NSURLRequest *request = [NSURLRequest requestWithURL:KGetDetail_URL((long)self.cid)];
        [self.webView loadRequest:request];
    });
}

- (void)viewWillAppear:(BOOL)animated
{
//    self.navigationController.navigationBarHidden = NO;
    [super viewWillAppear:animated];
    self.title = @"动态详情";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
