//
//  WLMenuItem.h
//  WLPageController
//
//  Created by dinpay on 2017/6/9.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WLMenuItem;
@protocol WLMenuItemDelegate <NSObject>

- (void)didPressedMenuItem:(WLMenuItem *)menuItem;

@end

@interface WLMenuItem : UILabel
@property (nonatomic, assign) CGFloat rate;
@property (nonatomic, assign) CGFloat normalSize;
@property (nonatomic, assign) CGFloat selectedSize;
/** normal color */
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, weak) id<WLMenuItemDelegate> delegate;
@property (nonatomic, assign, getter=isSelected) BOOL selected;

- (void)selectedItemWithAnimation;
- (void)deselectedItemWithAnimation;
@end
