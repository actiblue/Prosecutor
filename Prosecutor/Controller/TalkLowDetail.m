//
//  TalkLowDetail.m
//  Prosecutor
//
//  Created by Jason on 14-7-2.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import "TalkLowDetail.h"

@interface TalkLowDetail ()

@end

@implementation TalkLowDetail

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
    // Do any additional setup after loading the view.
    dispatch_queue_t urlRequest = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(urlRequest, ^{
        NSURLRequest *request = [NSURLRequest requestWithURL:KGetDetail_URL((long)self.cid)];
        [self.webView loadRequest:request];
    });
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"案例详情";
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
