//
//  ContactVC.h
//  Prosecutor
//
//  Created by joanfen on 14-6-9.
//  Copyright (c) 2014年 joanfen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
