//
//  WLPageMenuView.m
//  WLPageController
//
//  Created by apple on 2017/8/29.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import "WLPageMenuView.h"

#define kBottomLineH 1

@interface WLPageMenuView () {
    
    UIScrollView *_scrollView;
    UILabel *_titleLabel;
    UIView *_bottomLine;
}



@end



@implementation WLPageMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self createScrollView];
    }
    
    return self;
}

- (void)createScrollView {
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_scrollView];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.bounces = NO;
    
    [self createSubView];
}

- (void)createSubView {
    
    CGFloat w = self.frame.size.width / self.titleArray.count;
    CGFloat h = self.frame.size.height - kBottomLineH;
    for (int i = 0; i < self.titleArray.count ; i++) {
        
        UILabel *label = [[UILabel alloc] init];
        CGFloat x = w * i;
        CGRect frame = CGRectMake(x, 0, w, h);
        label.frame = frame;
        
        [_scrollView addSubview:label];
        label.text = self.titleArray[i];
        label.textColor = [UIColor orangeColor];
        label.textAlignment = NSTextAlignmentCenter;
        
       
    }
}
@end
