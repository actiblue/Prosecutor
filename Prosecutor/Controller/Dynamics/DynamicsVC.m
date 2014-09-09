//
//  DynamicsVC.m
//  Prosecutor
//
//  Created by Jason on 14-6-9.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import "DynamicsVC.h"
#import "PFlagListCell.h"
#import "AFHTTPRequestOperation.h"
#import "DynamicsModel.h"
#import "DynamicsCell.h"

#import "dynamicsDetailVC.h"
#import "MJRefresh.h"
#import "UITableView+config.h"
@interface DynamicsVC ()<NSURLConnectionDataDelegate>
{
    NSMutableArray *dataMArr;
    NSMutableDictionary *ListData;
    NSInteger selectID;
    int currentPage;
}
@end



@implementation DynamicsVC



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
    self.navigationItem.title = @"动态经检";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    dataMArr = [[NSMutableArray alloc] init];
    currentPage = 0;
    [self.tableView addFooterWithTarget:self action:@selector(getListData)];
    [self.tableView setExtraCellLineHidden];
    [self getListData];
}

- (void)getListData
{
//    [_tableView footerBeginRefreshing];
    currentPage++;
    
//    dispatch_queue_t urlRequest = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(urlRequest, ^{
        NSError *error;
        
        NSURLRequest *request = [NSURLRequest requestWithURL: KGetListData_URL(4,currentPage)];
        
        
        
        
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
        
        if (response==nil) {
            return;
        }
        NSArray *listArr = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
        for (NSDictionary *dic in listArr) {
            DynamicsModel *modal = [[DynamicsModel alloc] init];
            modal.dic  = dic;
            [dataMArr addObject:modal];
        }
        [self.tableView reloadData];
        [self.tableView footerEndRefreshing];
    
//    });
    
    
    
}
-(void)headerRefreshing{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    dynamicsDetailVC *detailVC = [segue destinationViewController];
//    detailVC.cid = selectID;
//}

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
    NSString *identify = @"dynamicsCell";
    DynamicsCell * cell = (DynamicsCell *)[tableView dequeueReusableCellWithIdentifier:identify];
   
    DynamicsModel *modal = dataMArr[indexPath.row];
    cell.titleLabel.text = modal.title;
   
    cell.dateLabel.text = modal.date;
    
    return  cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DynamicsModel *modal = dataMArr[indexPath.row];
    
    selectID =modal.cid;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    dynamicsDetailVC *detailVC = [storyboard instantiateViewControllerWithIdentifier:@"dynamicsDetailVC"];
    detailVC.cid = modal.cid;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}


@end
