//
//  ApplyPublicVC.m
//  Prosecutor
//
//  Created by Jason on 14-7-9.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import "ApplyPublicVC.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperation.h"
#import <QuartzCore/QuartzCore.h>

@interface ApplyPublicVC ()<UITextFieldDelegate,UITextViewDelegate,NSURLConnectionDataDelegate>
{
    NSString *credentialsType;
}
@end

@implementation ApplyPublicVC

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
    credentialsType = @"身份证";
    self.resonTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.resonTextView.layer.borderWidth =1.0;
    self.resonTextView.layer.cornerRadius =5.0;
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

- (IBAction)OkBtn:(id)sender {
    
    if ([self.nameTextField.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"姓名不能为空!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    if ([self.companyTextField.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"工作单位不能为空!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    if ([self.credentialsTextField.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"证件号码不能为空!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    if ([self.telTextField.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"联系电话不能为空!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    if ([self.postcodeTextFeild.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"邮政编码不能为空!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    if ([self.addressTextField.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"联系地址不能为空!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    if ([self.faxTextFeild.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"传真不能为空!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    if (![self isValidateEmail:self.emailTextFeild.text]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"邮箱格式不正确,请重新输入!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;

    }
    [self postData];
}

- (void)postData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];//设置相应内容类型
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameters = @{@"resourcehotel.name":self.nameTextField.text,@"resourcehotel.gzdw":self.companyTextField.text,@"resourcehotel.zjmc":credentialsType,@"resourcehotel.zjhm":self.credentialsTextField.text,@"resourcehotel.lxdh":self.telTextField.text,@"resourcehotel.yzbm":self.postcodeTextFeild.text,@"resourcehotel.lxdz":self.addressTextField.text,@"resourcehotel.cz":self.faxTextFeild.text,@"resourcehotel.dzyx":self.emailTextFeild.text,@"resourcehotel.xxly":self.resonTextView.text};
    [manager POST:@"http://58.241.101.178:8089/zjjj/API_JJ_DEALYSQGK.action" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *responseData = responseObject;
        NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        [self requestSuccess:responseStr];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self postfailed:error];
    }];
}

- (void)requestSuccess:(NSString *)resStr
{
    int resInt = [resStr intValue];
    if (resInt == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"添加失败,请填写完整信息再提交!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
    if (resInt == 1) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"欢迎您的申请,我们将在7个工作日内通过电子邮箱告知审核结果,请注意查收!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
    if (resInt == 2) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"添加失败,同一IP一天只能提交一条!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

- (void)postfailed:(NSError *)error
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"添加失败,%@",error] message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

#pragma mark - NSURLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    NSLog(@"res ===== %@",[res allHeaderFields]);
}

- (IBAction)cancelBtn:(id)sender {
}

- (IBAction)selectCredentials:(id)sender {
    if (self.credentialsSegment.selectedSegmentIndex == 0) {
        credentialsType = @"身份证";
    }
    if (self.credentialsSegment.selectedSegmentIndex == 1) {
        credentialsType = @"军官证";
    }
    if (self.credentialsSegment.selectedSegmentIndex == 2) {
        credentialsType = @"社保号";
    }
}

#pragma mark - TextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [textField resignFirstResponder];
    textField.text = @"";
    return NO;
}

//开始编辑输入框的时候，软键盘出现，执行此事件
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
}

//验证邮箱
-(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark - TextViewDelegate

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    CGRect frame = textView.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    self.view.frame =CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
}



@end
