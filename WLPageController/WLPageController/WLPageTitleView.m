//
//  WLPageTitleView.m
//  WLPageController
//
//  Created by dinpay on 2017/8/30.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import "WLPageTitleView.h"

#define kBottomLineH 1



@interface WLPageTitleView ()<UIScrollViewDelegate> {
    
    UIScrollView *_scrollView;
    UIView *_bottomLine;
    UIView *_scrollLine;
    NSInteger _index;// 当前label点击的位置
    NSMutableArray <UILabel *> *_labelArray;
    
    NSArray *_normalColorArray;
    NSArray *_selectColorArray;
}



@end



@implementation WLPageTitleView

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        _index = 0;
        _labelArray = [NSMutableArray array];
        self.titleArray = titleArray;
        
#define kNormalColor (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
#define kSelectColor (CGFloat, CGFloat, CGFloat) = (255, 128, 0)
        
        _normalColorArray = @[@85, @85, @85];
        _selectColorArray = @[@255, @128, @0];
        [self createScrollView];
    }
    
    return self;
}

- (void)createScrollView {
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_scrollView];
    _scrollView.backgroundColor = [UIColor whiteColor];
    NSLog(@"frame:%@--bound:%@",NSStringFromCGRect(self.frame),NSStringFromCGRect(self.bounds));
    
//    _scrollView.showsHorizontalScrollIndicator = YES;
//    _scrollView.showsVerticalScrollIndicator = NO;
//    _scrollView.alwaysBounceVertical = NO;
//    _scrollView.bounces = NO;
//    _scrollView.scrollsToTop = NO;
//    _scrollView.alwaysBounceHorizontal = YES;
    _scrollView.delegate = self;
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width, -70)];
    [self createSubView];
    [self setupBottomLineAndScrollLine];
}

- (void)createSubView {

    CGFloat w = self.frame.size.width / self.titleArray.count;
    CGFloat h = self.frame.size.height - kBottomLineH;
    for (int i = 0; i < self.titleArray.count ; i++) {
        
        CGFloat x = w * i;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, -64, w, h)];
        [_scrollView addSubview:label];
        [_labelArray addObject:label];
        label.text = self.titleArray[i];
        label.tag = i;
        
        label.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.userInteractionEnabled = YES;
        
//        if (i == 0) {
//            label.textColor = [UIColor colorWithRed:255/255.0 green:128/255.0 blue:0/255.0 alpha:1.0];
//        }
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [label addGestureRecognizer:gesture];
    }
}
- (void)setupBottomLineAndScrollLine {
    
    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - kBottomLineH, self.frame.size.width, kBottomLineH)];
    [self addSubview:_bottomLine];
    _bottomLine.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *firstLabel = _labelArray[0];
    firstLabel.textColor = [UIColor colorWithRed:[_selectColorArray[0] integerValue]/255.0 green:[_selectColorArray[1] integerValue]/255.0 blue:[_selectColorArray[2] integerValue]/255.0 alpha:1.0];
    
    _scrollLine = [[UIView alloc] initWithFrame:CGRectMake(firstLabel.frame.origin.x, -22, firstLabel.frame.size.width, 2)];
    _scrollLine.backgroundColor = [UIColor orangeColor];
    [_scrollView addSubview:_scrollLine];
    
}
- (void)tap:(UITapGestureRecognizer *)gesture {
    
    // 当前点击的label
    UILabel *currentLabel = (UILabel *)gesture.view;
    
    if (currentLabel.tag == _index) {
        return;
    }
    
    UILabel *oldLabel = _labelArray[_index];
    
    currentLabel.textColor = [UIColor colorWithRed:255/255.0 green:128/255.0 blue:0/255.0 alpha:1.0];
    oldLabel.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1.0];
    
    _index = currentLabel.tag;
    
    CGFloat labelX = _index * _scrollLine.frame.size.width;
    
    [UIView animateWithDuration:0.15 animations:^{
        CGRect temp = _scrollLine.frame;
        temp.origin.x = labelX;
        _scrollLine.frame = temp;
    }];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    CGFloat h = scrollView.contentOffset.y;
    
    NSLog(@"%lf",h);
}
@end
