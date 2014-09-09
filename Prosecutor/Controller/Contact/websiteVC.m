//
//  websiteVC.m
//  Prosecutor
//
//  Created by Jason on 14-7-2.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import "websiteVC.h"

@interface websiteVC ()

@end

@implementation websiteVC

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
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:KGetDetail_URL(self.cid)];
    self.title = self.navigationTitle;
    [self.webview loadRequest:self.request];
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
