//
//  FeaturedViewController.m
//  WLPageController
//
//  Created by dinpay on 2017/8/29.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import "FeaturedViewController.h"
#import "WLPageTitleView.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#define kTitleViewH 44


@interface FeaturedViewController ()

@property (nonatomic, strong) WLPageTitleView *titleView;


@end

@implementation FeaturedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"PageMenu_Example";
    
    [self.view addSubview:self.titleView];

}


- (WLPageTitleView *)titleView {
    
    if (!_titleView) {
        NSArray *titleArray = @[@"推荐", @"游戏",@"趣玩",@"娱乐"];
        
        _titleView = [[WLPageTitleView alloc] initWithFrame:CGRectMake(0, 64, kScreenW, kTitleViewH) titleArray:titleArray];
        
    }
    
    return _titleView;
}
@end
