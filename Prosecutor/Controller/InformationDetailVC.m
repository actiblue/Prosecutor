//
//  InformationDetailVC.m
//  Prosecutor
//
//  Created by joanfen on 14-7-9.
//  Copyright (c) 2014年 joanfen. All rights reserved.
//

#import "InformationDetailVC.h"

@interface InformationDetailVC ()

@end

@implementation InformationDetailVC

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
