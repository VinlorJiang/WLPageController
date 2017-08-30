//
//  WLPageTitleView.h
//  WLPageController
//
//  Created by dinpay on 2017/8/30.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WLPageTitleView;

@protocol WLPageTitleViewDelegate <NSObject>

- (void)pageTitleView:(WLPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex;

@end


@interface WLPageTitleView : UIView

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, weak) id<WLPageTitleViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;

- (void)titleWithProgress:(CGFloat)progress sourceIndex:(int)sourceIndex targetIndex:(int)targetIndex;
@end
