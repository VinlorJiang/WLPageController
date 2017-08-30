//
//  WLPageContentView.h
//  WLPageController
//
//  Created by dinpay on 2017/8/30.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WLPageContentView;

@protocol WLPageContentViewDelegate <NSObject>

- (void)pageContentView:(WLPageContentView *)pageContentView progress:(CGFloat)progress sourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex;

@end


@interface WLPageContentView : UIView

@property (nonatomic, strong) NSArray <UIViewController *> *childVCs;
@property (nonatomic, strong) UIViewController *parentVC;

@property (nonatomic, weak) id<WLPageContentViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame childViewControllerArrays:(NSArray <UIViewController *>*)childViewControllerArrays parentViewController:(UIViewController *)parentViewController;

- (void)currrentIndex:(NSInteger)currrentIndex;
@end
