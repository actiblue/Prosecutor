//
//  ContactVC.m
//  Prosecutor
//
//  Created by Jason on 14-6-9.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import "ContactVC.h"
#import "PContactCell.h"
#import "UITableView+config.h"

#import "websiteVC.h"
@interface ContactVC ()
{
    NSInteger selectRow;
}
@end

static  NSString *contactCellID  = @"ContactCell";

@implementation ContactVC

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
    self.navigationItem.title = @"联系经检";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerNib:[PContactCell nib] forCellReuseIdentifier:contactCellID];
    [self.tableView setExtraCellLineHidden];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    websiteVC *website = [segue destinationViewController];
    NSArray *array = @[KSina_STR, KTX_STR, KProsecutor_STR, KJSJC];
    NSURL *url = [NSURL URLWithString:array[selectRow]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    website.request = request;
    website.navigationTitle = KContactFuncArr[selectRow];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return KContactFuncArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PContactCell *cell = [tableView dequeueReusableCellWithIdentifier:contactCellID];
    if (cell == nil) {
        cell = [(PContactCell *)[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contactCellID];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.iconImg.layer.masksToBounds = YES;
    cell.iconImg.layer.cornerRadius = 5.0;
    cell.nameLabel.text = KContactFuncArr[indexPath.row];
    
    cell.iconImg.image =[UIImage imageNamed: KContactImageArr[indexPath.row]];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectRow = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"website" sender:nil];
}
@end
