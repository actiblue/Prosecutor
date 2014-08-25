//
//  TalkLowVC.m
//  Prosecutor
//
//  Created by joanfen on 14-6-9.
//  Copyright (c) 2014年 joanfen. All rights reserved.
//

#import "TalkLowVC.h"
#import "talkLowModel.h"
#import "DynamicsCell.h"
#import "TalkLowDetail.h"
@interface TalkLowVC ()<UITabBarDelegate>
{
    NSMutableArray *dataMArr;
}
@end

@implementation TalkLowVC

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
    
    self.tabBar.selectedItem = self.tabBar.items[0];
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"经检说法";
    
    [self getListData];
    
}

- (void)getListData
{
//    dispatch_queue_t urlRequest = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(urlRequest, ^{
    NSError *error;
    NSURLRequest *request;
    dataMArr = [[NSMutableArray alloc] init];
    if (self.tabBar.selectedItem == self.tabBar.items[0]) {
        request = [NSURLRequest requestWithURL: KGetListData_URL(12,1)];
    }
    if (self.tabBar.selectedItem == self.tabBar.items[1]) {
        request = [NSURLRequest requestWithURL: KGetListData_URL(10,1)];
    }
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if (response==nil) {
        return;
    }
    NSArray *listArr = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    for (NSDictionary *dic in listArr) {
        talkLowModel *modal = [[talkLowModel alloc] init];
        modal.dic  = dic;
        [dataMArr addObject:modal];
    }
    [self.tableView reloadData];
//    });
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
//    if (self.tabBar.selectedItem == self.tabBar.items[0]) {
//        return 3;
//    }
    return dataMArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"talkLowCell";
    DynamicsCell * cell = (DynamicsCell *)[tableView dequeueReusableCellWithIdentifier:identify];
//    if (self.tabBar.selectedItem == self.tabBar.items[0]) {
//        
//        
//        talkLowModel *modal = dataMArr[indexPath.row];
//        
//        cell.titleLabel.text = modal.title;
//        
//        cell.dateLabel.text = modal.date;
//    }
//    if (self.tabBar.selectedItem == self.tabBar.items[1]) {
//        
//        
//        talkLowModel *modal = dataMArr[indexPath.row];
//        
//        cell.titleLabel.text = modal.title;
//        
//        cell.dateLabel.text = modal.date;
//
//        
//    }
    talkLowModel *modal = dataMArr[indexPath.row];
    
    cell.titleLabel.text = modal.title;
    
    cell.dateLabel.text = modal.date;
    
    return  cell;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.tabBar.selectedItem == self.tabBar.items[0]) {
        return KLowFuncArr[0];
    }
    return KLowFuncArr[1];
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    talkLowModel *modal = dataMArr[indexPath.row];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    TalkLowDetail *detailVC = [storyboard instantiateViewControllerWithIdentifier:@"TalkLowDetail"];
    detailVC.cid = modal.cid;
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - TabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    [self getListData];
    [self.tableView reloadData];
}

@end
