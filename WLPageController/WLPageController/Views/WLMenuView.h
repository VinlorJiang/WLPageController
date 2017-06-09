//
//  WLMenuView.h
//  WLPageController
//
//  Created by dinpay on 2017/6/9.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLMenuView : UIView

@property (nonatomic, strong) NSArray *items;


- (instancetype)initWithFrame:(CGRect)frame labelItems:(NSArray *)items backgroundColor:(UIColor *)bgColor norColor:(UIColor *)norColor selColor:(UIColor *)selColor norSize:(CGFloat)norSize selSize:(CGFloat)selSize;
@end
