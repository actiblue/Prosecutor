//
//  ComeInVC.m
//  Prosecutor
//
//  Created by Jason on 14-6-9.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import "ComeInVC.h"
#import "AFNetworking.h"
#import "honourVC.h"


@interface ComeInVC ()<UIWebViewDelegate,UITabBarDelegate>
{
    UIActivityIndicatorView *activityIndicator;
    
    honourVC *vc;
}
@end

@implementation ComeInVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"走进经检";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.tabBar.selectedItem = self.tabBar.items[0];
//    NSURLRequest *request = [NSURLRequest requestWithURL:KGetWeb_URL(1)];

//    dispatch_queue_t urlRequest = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(urlRequest, ^{
        NSURLRequest *request =[[NSURLRequest alloc] initWithURL:KGetWeb_URL(1) cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:5];
        [self.webView loadRequest:request];
//    });

    
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.webView stopLoading];
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


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    int tag = (int)item.tag + 1;
//    dispatch_queue_t urlRequest = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(urlRequest, ^{
        NSURLRequest *request = [NSURLRequest requestWithURL:KGetWeb_URL(tag)];
        [self.webView loadRequest:request];
//    });
    if (item.tag == 2) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        vc = [storyboard instantiateViewControllerWithIdentifier:@"honour"];
        [self addChildViewController:vc];
        [vc.view setFrame:CGRectMake(0, 64, 320, 519)];
        [self.view addSubview:vc.view];
        [vc didMoveToParentViewController:self];
        [self.view bringSubviewToFront:tabBar];
    }
    else
    {
        [vc.view removeFromSuperview];
        [vc removeFromParentViewController];
    }
}




#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [activityIndicator setCenter:self.webView.center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [self.webView addSubview:activityIndicator] ;
    [activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@",error);
    [webView stopLoading];
    
    [activityIndicator stopAnimating];
}


@end
