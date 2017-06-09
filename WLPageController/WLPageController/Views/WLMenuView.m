//
//  WLMenuView.m
//  WLPageController
//
//  Created by dinpay on 2017/6/9.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import "WLMenuView.h"
#import "WLMenuItem.h"

#define kItemWidth 60
#define kTapGap    1111
#define kBGColor   [UIColor colorWithRed:172.0/255.0 green:165.0/255.0 blue:162.0/255.0 alpha:1.0];

@interface WLMenuView ()<WLMenuItemDelegate> {
    CGFloat _norSize;
    CGFloat _selSize;
    UIColor *_norColor;
    UIColor *_selColor;
}


@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) WLMenuItem *selectedMenuItem;
@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) NSMutableArray *frames;

@end

@implementation WLMenuView
- (NSMutableArray *)frames {
    if (!_frames) {
        _frames = @[].mutableCopy;
        
    }
    return _frames;
}

- (instancetype)initWithFrame:(CGRect)frame labelItems:(NSArray *)items backgroundColor:(UIColor *)bgColor norColor:(UIColor *)norColor selColor:(UIColor *)selColor norSize:(CGFloat)norSize selSize:(CGFloat)selSize {
    if (self = [super initWithFrame:frame]) {
        _items = items;
        if (bgColor) {
            _bgColor = bgColor;
        } else {
            _bgColor = kBGColor;
        }
        _norSize = norSize;
        _selSize = selSize;
        _norColor = norColor;
        _selColor = selColor;
        
        [self addScrollView];
        [self addItems];
    }
    return self;
}
- (void)addScrollView {
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGRect frame = CGRectMake(0, 0, width, height);
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    
}
- (void)addItems {
    [self calculateItemFrames];
    
    for (int i = 0; i < self.items.count; i++) {
        CGRect frame = [self.frames[i] CGRectValue];
        WLMenuItem *item = [[WLMenuItem alloc] initWithFrame:frame];
        item.tag = i + 111;
        item.delegate = self;
        item.text = self.items[i];
        item.textAlignment = NSTextAlignmentCenter;
        item.userInteractionEnabled = YES;
        item.backgroundColor = [UIColor clearColor];
        
        if (i == 0) {
            [item selectedItemWithAnimation];
            self.selectedMenuItem = item;
        } else {
            [item deselectedItemWithAnimation];
        }
        [self.scrollView addSubview:item];
    }
}
- (void)calculateItemFrames {
    CGFloat contentWidth = 0.0 ;
    for (int i = 0; i < self.items.count; i++) {
        CGFloat itemW = kItemWidth;
        CGRect frame = CGRectMake(contentWidth, 0, itemW, self.frame.size.height);
        [self.frames addObject:[NSValue valueWithCGRect:frame]];
        contentWidth += itemW ;
    }
    if (contentWidth < self.frame.size.width) {
        CGFloat distance = self.frame.size.width - contentWidth;
        CGFloat gap = distance / (self.items.count + 1);
        for (int i = 0; i < self.frames.count; i++) {
            CGRect frame = [self.frames[i] CGRectValue];
            frame.origin.x += gap * (i+1);
            self.frames[i] = [NSValue valueWithCGRect:frame];
        }
        contentWidth = self.frame.size.width;
    }
    self.scrollView.contentSize = CGSizeMake(contentWidth, self.frame.size.height);
}
- (void)didPressedMenuItem:(WLMenuItem *)menuItem {
    if (self.selectedMenuItem == menuItem) {
        return;
    }
    
    menuItem.selected = YES;
    self.selectedMenuItem.selected = NO;
    self.selectedMenuItem = menuItem;
    
    [self refreshContentOffset];
}
- (void)refreshContentOffset {
    CGRect frame = self.selectedMenuItem.frame;
    CGFloat itemX = frame.origin.x;
    CGFloat width = self.scrollView.frame.size.width;
    CGSize contentSize = self.scrollView.contentSize;
    if (itemX > width/2) {
        CGFloat targetX;
        if ((contentSize.width - itemX) <= width/2) {
            targetX =  contentSize.width - width;
        } else {
            targetX = frame.origin.x - width/2 + frame.size.width/2;
        }
        if (targetX + width > contentSize.width) {
            targetX = contentSize.width - width;
        }
        [self.scrollView setContentOffset:CGPointMake(targetX, 0) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}
@end
