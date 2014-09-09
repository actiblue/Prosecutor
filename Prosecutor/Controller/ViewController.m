//
//  ViewController.m
//  Prosecutor
//
//  Created by Jason on 14-6-9.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import "ViewController.h"
#import "PMainFunctionCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"主页";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return KMainFuncArr.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"PMFCell";
    PMainFunctionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[PMainFunctionCell alloc] init];
    }
    
    [cell configureCellWithImage:[UIImage imageNamed:KMainFuncImgArr[indexPath.row]] title:KMainFuncArr[indexPath.row]];
    return  cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [main instantiateViewControllerWithIdentifier:KMainVCSArr[indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
