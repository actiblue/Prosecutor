//
//  ApplyPublicVC.h
//  Prosecutor
//
//  Created by Jason on 14-7-9.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplyPublicVC : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *companyTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *credentialsSegment;
@property (strong, nonatomic) IBOutlet UITextField *credentialsTextField;
@property (strong, nonatomic) IBOutlet UITextField *telTextField;
@property (strong, nonatomic) IBOutlet UITextField *postcodeTextFeild;
@property (strong, nonatomic) IBOutlet UITextField *addressTextField;
@property (strong, nonatomic) IBOutlet UITextField *faxTextFeild;
@property (strong, nonatomic) IBOutlet UITextField *emailTextFeild;
@property (strong, nonatomic) IBOutlet UITextView *resonTextView;
- (IBAction)OkBtn:(id)sender;
- (IBAction)cancelBtn:(id)sender;
- (IBAction)selectCredentials:(id)sender;


@end
