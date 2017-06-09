//
//  WLMenuItem.m
//  WLPageController
//
//  Created by dinpay on 2017/6/9.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import "WLMenuItem.h"

#define kSelectedSize 18
#define kNormalSize 15
#define kSelectedColor [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1]
#define kNormalColor [UIColor colorWithRed:0 green:0 blue:0 alpha:1];


@implementation WLMenuItem {
    CGFloat _rgba[4];
    CGFloat _rgbaGAP[4];
    BOOL    _hasRGBA;
}
#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self =[super initWithFrame:frame]) {
        _hasRGBA = NO;
        _normalColor = kNormalColor;
        _selectedColor = kSelectedColor;
        _normalSize = kNormalSize;
        _selectedSize = kSelectedSize;
    }
    return self;
}
#pragma mark - setter methods
- (void)selectedItemWithAnimation {
    _rate = 0.0;
    _selected = YES;
}
- (void)deselectedItemWithAnimation {
    _rate = 1.0;
    _selected = NO;
    
}
- (void)setSelected:(BOOL)selected {
    if (self.selected == selected) return;
    [UIView animateWithDuration:0.3 animations:^{
        if (self.selected) {
            self.rate = 0.0;
        } else {
            self.rate = 1.0;
        }
        _selected = selected;
    }];
}
- (void)setRate:(CGFloat)rate {
    _rate = rate;
    if (!_hasRGBA) {
        [self setRGBA];
    }
    CGFloat r = _rgba[0] + _rgbaGAP[0]*self.rate;
    CGFloat g = _rgba[1] + _rgbaGAP[1]*self.rate;
    CGFloat b = _rgba[2] + _rgbaGAP[2]*self.rate;
    CGFloat a = _rgba[3] + _rgbaGAP[3]*self.rate;
    
    self.textColor = [UIColor colorWithRed:r green:g blue:b alpha:a];
    CGFloat minScale = self.normalSize / self.selectedSize;
    CGFloat trueScale = minScale + (1-minScale)*rate;
    self.transform = CGAffineTransformMakeScale(trueScale, trueScale);
}
#pragma mark - private methods
- (void)setRGBA {
    int numNormal = (int)CGColorGetNumberOfComponents(self.normalColor.CGColor);
    int numSelected = (int)CGColorGetNumberOfComponents(self.selectedColor.CGColor);
    if (numNormal == 4 && numSelected == 4) {
        const CGFloat *norComponents = CGColorGetComponents(self.normalColor.CGColor);
        const CGFloat *selComponents = CGColorGetComponents(self.selectedColor.CGColor);
        _rgba[0] = norComponents[0];
        _rgbaGAP[0] = selComponents[0] - _rgba[0];
        _rgba[1] = norComponents[1];
        _rgbaGAP[1] = selComponents[1] - _rgba[1];
        _rgba[2] = norComponents[2];
        _rgbaGAP[2] = selComponents[2] - _rgba[2];
        _rgba[3] = norComponents[3];
        _rgbaGAP[3] = selComponents[3] - _rgba[3];
    } else if (numNormal == 2 || numSelected == 2) {
        if (numNormal == 2) {
            const CGFloat *norComponents = CGColorGetComponents(self.normalColor.CGColor);
            self.normalColor = [UIColor colorWithRed:norComponents[0] green:norComponents[0] blue:norComponents[0] alpha:norComponents[1]];
        }
        if (numSelected == 2) {
            const CGFloat *selConponents = CGColorGetComponents(self.selectedColor.CGColor);
            self.selectedColor = [UIColor colorWithRed:selConponents[0] green:selConponents[0] blue:selConponents[0] alpha:selConponents[1]];
            
        }
        [self setRGBA];
        return;
    } else {
        NSAssert(NO, @"颜色有问题");
    }
    _hasRGBA = YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.delegate respondsToSelector:@selector(didPressedMenuItem:)]) {
        [self.delegate didPressedMenuItem:self];
    }
}
@end
