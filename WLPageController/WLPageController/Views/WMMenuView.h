//
//  WMMenuView.h
//  WMPageController
//
//  Created by Mark on 15/4/26.
//  Copyright (c) 2015年 yq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WMMenuView;
@class WMMenuItem;


@protocol WMMenuViewDelegate <NSObject>
@optional
- (void)menuView:(WMMenuView *)menu didSelesctedIndex:(NSInteger)index currentIndex:(NSInteger)currentIndex;
- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index;
- (CGFloat)menuView:(WMMenuView *)menu itemMarginAtIndex:(NSInteger)index;
@end

@interface WMMenuView : UIView
@property (nonatomic, assign) CGFloat progressHeight;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, weak) id<WMMenuViewDelegate> delegate;
@property (nonatomic, copy) NSString *fontName;

- (instancetype)initWithFrame:(CGRect)frame buttonItems:(NSArray *)items backgroundColor:(UIColor *)bgColor norSize:(CGFloat)norSize selSize:(CGFloat)selSize norColor:(UIColor *)norColor selColor:(UIColor *)selColor;
- (void)slideMenuAtProgress:(CGFloat)progress;
- (void)selectItemAtIndex:(NSInteger)index;
@end
