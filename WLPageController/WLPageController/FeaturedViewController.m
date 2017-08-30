//
//  FeaturedViewController.m
//  WLPageController
//
//  Created by dinpay on 2017/8/29.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import "FeaturedViewController.h"
#import "WLPageTitleView.h"
#import "WLPageContentView.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#define kTitleViewH 44


@interface FeaturedViewController()<WLPageTitleViewDelegate,WLPageContentViewDelegate>

@property (nonatomic, strong) WLPageTitleView *titleView;
@property (nonatomic, strong) WLPageContentView *contentView;

@end

@implementation FeaturedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"PageMenu_Example";
    
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.contentView];
}


- (WLPageTitleView *)titleView {
    
    if (!_titleView) {
        NSArray *titleArray = @[@"推荐", @"游戏",@"趣玩",@"娱乐"];
        
        _titleView = [[WLPageTitleView alloc] initWithFrame:CGRectMake(0, 64, kScreenW, kTitleViewH) titleArray:titleArray];
        _titleView.delegate = self;
    }
    
    return _titleView;
}
- (WLPageContentView *)contentView {
    
    
    if (!_contentView) {
        NSMutableArray *mutabArray = [NSMutableArray array];
        for (int i = 0; i < 4; i++) {
            int R = arc4random() % 255;
            UIViewController *vc = [[UIViewController alloc] init];
            vc.view.backgroundColor = [UIColor colorWithRed:R /255.0 green:R/255.0 blue:R/255.0 alpha:1.0];
            
//            vc.view.backgroundColor = [UIColor redColor];
            [mutabArray addObject:vc];
        }
        
        _contentView = [[WLPageContentView alloc] initWithFrame:CGRectMake(0, 64+44, kScreenW, kScreenH-108) childViewControllerArrays:mutabArray parentViewController:self];
        _contentView.delegate = self;
    }
    return _contentView;
}
#pragma mark - delegate
- (void)pageTitleView:(WLPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.contentView currrentIndex:selectedIndex];
}
- (void)pageContentView:(WLPageContentView *)pageContentView progress:(CGFloat)progress sourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex {
    [self.titleView titleWithProgress:progress sourceIndex:sourceIndex targetIndex:targetIndex];
}
@end
