//
//  FeaturedViewController.m
//  WLPageController
//
//  Created by dinpay on 2017/8/29.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import "FeaturedViewController.h"
#import "WLPageMenuView.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#define kMenuViewH 44


@interface FeaturedViewController ()

@property (nonatomic, strong) WLPageMenuView *menuView;


@end

@implementation FeaturedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"PageMenu_Example";
    
    [self.view addSubview:self.menuView];

}


- (WLPageMenuView *)menuView {
    
    if (!_menuView) {
        _menuView = [[WLPageMenuView alloc] initWithFrame:CGRectMake(0, 64, kScreenW, kMenuViewH)];
        _menuView.titleArray = @[@"直播",@"游戏",@"趣玩",@"新闻"];
            }
    
    return _menuView;
}
@end
