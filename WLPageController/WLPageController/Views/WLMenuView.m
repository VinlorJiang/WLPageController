//
//  WLMenuView.m
//  WLPageController
//
//  Created by dinpay on 2017/6/9.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import "WLMenuView.h"
#import "WLMenuItem.h"

@interface WLMenuView ()

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) WLMenuItem *selectedMenuItem;
@property (nonatomic, strong) NSMutableArray *frames;

@end

@implementation WLMenuView
- (NSMutableArray *)frames {
    if (!_frames) {
//        _frames = @[].mutableCopy;
        _frames = [NSMutableArray array];
    }
    return _frames;
}
- (instancetype)initWithFrame:(CGRect)frame labelItems:(NSArray *)items {
    if (self = [super initWithFrame:frame]) {
        _items = items;
        self.backgroundColor = [UIColor whiteColor];
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
    //    item.delegate = self;
        item.text = self.items[i];
        item.textAlignment = NSTextAlignmentCenter;
        item.userInteractionEnabled = YES;
        item.backgroundColor = [UIColor clearColor];
        
        if (i == 0) {
            item.textColor = [UIColor redColor];
            self.selectedMenuItem = item;
        }
        [self.scrollView addSubview:item];
    }
}
- (void)calculateItemFrames {
    CGFloat contentWidth = 0.0 ;
    for (int i = 0; i < self.items.count; i++) {
        CGFloat itemW = 60;
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
@end
