//
//  WLPageTitleView.h
//  WLPageController
//
//  Created by dinpay on 2017/8/30.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLPageTitleView : UIView

@property (nonatomic, strong) NSArray *titleArray;

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;
@end
