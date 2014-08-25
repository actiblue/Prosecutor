//
//  SceneVC.m
//  Prosecutor
//
//  Created by joanfen on 14-6-9.
//  Copyright (c) 2014年 joanfen. All rights reserved.
//

#import "SceneVC.h"
#import "PFlagListCell.h"
#import "DynamicsCell.h"
#import "sceneModel.h"
#import "sceneDetailVC.h"
@interface SceneVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataMArr;
}
@end
static  NSString *sceneCellID  = @"SceneCell";
@implementation SceneVC

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
    self.navigationItem.title = @"经检风貌";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerNib:[PFlagListCell nib] forCellReuseIdentifier:sceneCellID];
//    dispatch_queue_t urlRequest = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(urlRequest, ^{
        [self getListData];
//    });
}

- (void)getListData
{
    NSError *error;
    dataMArr = [[NSMutableArray alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL: KGetListData_URL(9,1)];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if (response==nil) {
        return;
    }
    
    NSArray *listArr = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    for (NSDictionary *dic in listArr) {
        sceneModel *modal = [[sceneModel alloc] init];
        modal.dic  = dic;
        [dataMArr addObject:modal];
    }
    [self.tableView reloadData];
    
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
#pragma mark - table delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark - tableView DataSource

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
    NSString *identify = @"sceneCell";
    DynamicsCell * cell = (DynamicsCell *)[tableView dequeueReusableCellWithIdentifier:identify];
    
    sceneModel *modal = dataMArr[indexPath.row];
    cell.titleLabel.text = modal.title;
    
    cell.dateLabel.text = modal.date;
    
    return  cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    sceneModel *modal = dataMArr[indexPath.row];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    sceneDetailVC *detailVC = [storyboard instantiateViewControllerWithIdentifier:@"sceneDetailVC"];
    detailVC.cid = modal.cid;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}


@end
