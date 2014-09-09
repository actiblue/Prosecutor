//
//  PMainFunctionCell.h
//  Prosecutor
//
//  Created by Jason on 14-6-9.
//  Copyright (c) 2014年 江苏联盟信息工程有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMainFunctionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImgView;

@property (weak, nonatomic) IBOutlet UILabel *title;

- (void)configureCellWithImage:(UIImage *)image title:(NSString *)title;
@end
