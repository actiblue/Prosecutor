//
//  InformationVC.m
//  Prosecutor
//
//  Created by Jason on 14-6-9.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import "InformationVC.h"
#import "InformationModel.h"
#import "MJRefresh.h"
#import "UITableView+config.h"
#import "InformationCell.h"
#import "InformationDetailVC.h"
#import "ApplyPublicVC.h"

@interface InformationVC ()<NSURLConnectionDataDelegate,UITabBarDelegate>
{
    NSMutableArray *dataMArr;
    NSMutableDictionary *ListData;
    NSInteger selectID;
    int currentPage;
    ApplyPublicVC *vc;
}
@end

@implementation InformationVC

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
    self.navigationItem.title = @"案件信息公开";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.selectedItem = self.tabBar.items[0];
    dataMArr = [[NSMutableArray alloc] init];
    currentPage = 0;
    [self.tableView addFooterWithTarget:self action:@selector(getListData)];
    [self.tableView setExtraCellLineHidden];
    
//    dispatch_queue_t urlRequest = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(urlRequest, ^{
        [self getListData];
//    });
}

- (void)getListData
{
    //    [_tableView footerBeginRefreshing];
    currentPage++;
    
    NSError *error;
    
    NSURLRequest *request = [NSURLRequest requestWithURL: KGetListData_URL(11,currentPage)];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if (response == nil) {
        return;
    }
    
    NSArray *listArr = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    for (NSDictionary *dic in listArr) {
        InformationModel *modal = [[InformationModel alloc] init];
        modal.dic  = dic;
        [dataMArr addObject:modal];
    }
    [self.tableView reloadData];
    [self.tableView footerEndRefreshing];
    
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

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataMArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"InformationCell";
    InformationCell * cell = (InformationCell *)[tableView dequeueReusableCellWithIdentifier:identify];
    
    InformationModel *modal = dataMArr[indexPath.row];
    cell.titleLabel.text = modal.title;
    
    cell.dateLabel.text = modal.date;
    
    return  cell;
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    InformationModel *modal = dataMArr[indexPath.row];
    
    selectID =modal.cid;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    InformationDetailVC *detailVC = [storyboard instantiateViewControllerWithIdentifier:@"InformationDetailVC"];
    detailVC.cid = modal.cid;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
    if (item.tag == 1) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        vc = [storyboard instantiateViewControllerWithIdentifier:@"ApplyPublicVC"];
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


@end
