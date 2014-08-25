//
//  PMainFunctionCell.h
//  Prosecutor
//
//  Created by xiaoliangwang on 14-6-9.
//  Copyright (c) 2014年 xiaoliangwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMainFunctionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImgView;

@property (weak, nonatomic) IBOutlet UILabel *title;

- (void)configureCellWithImage:(UIImage *)image title:(NSString *)title;
@end
