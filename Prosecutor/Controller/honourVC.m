//
//  honourVC.m
//  Prosecutor
//
//  Created by joanfen on 14-7-1.
//  Copyright (c) 2014年 joanfen. All rights reserved.
//

#import "honourVC.h"
#import "honourModel.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"

@interface honourVC ()<UIScrollViewDelegate>
{
    NSMutableArray *imageArr;
    NSMutableArray *dataMArr;
    NSInteger autoPage;
}
@end

@implementation honourVC

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
    
    autoPage = 0;
    dispatch_queue_t urlRequest = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(urlRequest, ^{
        NSURLRequest *request = [NSURLRequest requestWithURL:KGetWeb_URL(3)];
        [self.webView loadRequest:request];
    });
   
   
    [self getListData];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(autoSwipe) userInfo:nil repeats:YES];
    
    [timer fire];
}

- (void)autoSwipe
{
    
    if (autoPage>self.pageControl.numberOfPages) {
        autoPage = 0;
    }
    autoPage++;
    [self.scrollView scrollRectToVisible:CGRectMake((autoPage-1)*320, 0, 320, 156) animated:YES];
}

- (void)getListData
{
    
    dataMArr = [[NSMutableArray alloc] init];
    
    dispatch_queue_t urlReuqest = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(urlReuqest, ^{
        
        NSError *error;
  
        NSURLRequest *request = [NSURLRequest requestWithURL: KGetPicList_URL];
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
        if (response==nil) {
            return;
        }
        dataMArr = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
        
        dispatch_queue_t image = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(image, ^{
            
            imageArr = [[NSMutableArray alloc] init];
            for (NSDictionary *dic in dataMArr) {
                NSData *data = [NSData dataWithContentsOfURL:KGetPic_URL(dic[@"pic"])];
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIImage *image = [[UIImage alloc] initWithData:data];
                    [imageArr addObject:image];
                    self.scrollView.contentSize = CGSizeMake(320*imageArr.count, 156);
                    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(320*(imageArr.count-1), 0, 320, 176)];
                    
                    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 300, 176)];
                    [imageView setImage:image];
                    [view addSubview:imageView];
                    
                    [self.scrollView addSubview:view];
                    [self.scrollView sendSubviewToBack:view];
                    self.pageControl.numberOfPages = imageArr.count;

            });
            
        }
        
    });
    });
    
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    
//    for (NSDictionary *dic in dataMArr) {
////        UIImage *image = [[UIImage alloc] init];
////        [imageArr addObject:image];
//        self.scrollView.contentSize = CGSizeMake(320*imageArr.count, 156);
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(320*(imageArr.count-1), 0, 320, 176)];
//        
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 319, 176)];
////        [imageView setImage:image];
//        [view addSubview:imageView];
//        
//        
//
//        __block UIActivityIndicatorView *activityIndicator;
//        __weak UIImageView *weakImageView = imageView;
//        [imageView sd_setImageWithURL:KGetPic_URL(dic[@"pic"])
//                          placeholderImage:nil
//                                   options:SDWebImageProgressiveDownload
//                                  progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//                                      if (!activityIndicator) {
//                                          [weakImageView addSubview:activityIndicator = [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray]];
//                                          activityIndicator.center = weakImageView.center;
//                                          [activityIndicator startAnimating];
//                                      }
//                                  }
//                                 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                                     [activityIndicator removeFromSuperview];
//                                     activityIndicator = nil;
//                                     [imageArr addObject:image];
//                                 }];
//        [self.scrollView addSubview:view];
//        [self.scrollView sendSubviewToBack:view];
//        self.pageControl.numberOfPages = imageArr.count;
//        
//    }
    
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x>=0&&scrollView.contentOffset.x+320<=scrollView.contentSize.width) {
        self.pageControl.currentPage = scrollView.contentOffset.x/320;
    }
    
}
-(void)Swipe:(UISwipeGestureRecognizer *)recognizer{
    NSInteger currentPage;
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
//        self.pageControl.currentPage++;
        autoPage++;
       
       
    }
    else if(recognizer.direction == UISwipeGestureRecognizerDirectionRight){
//        self.pageControl.currentPage--;
        autoPage--;
    }
    currentPage = self.pageControl.currentPage;
    
    [self.scrollView scrollRectToVisible:CGRectMake((autoPage-1)*320, 0, 320, 156) animated:YES];
}
@end
