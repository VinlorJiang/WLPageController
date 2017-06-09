//
//  ViewController.m
//  WLPageController
//
//  Created by dinpay on 2017/6/9.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import "ViewController.h"
#import "WMMenuView.h"
#import "WLMenuView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *itemArr = @[@"推荐",@"热点",@"视频",@"社会",@"头条号",@"娱乐",@"科技",@"问答",@"汽车",@"体育",@"财经"];
    CGRect frame = CGRectMake(0, 64, 320, 40);
//    WMMenuView *menuView = [[WMMenuView alloc] initWithFrame:frame buttonItems:itemArr backgroundColor:[UIColor whiteColor] norSize:16.0 selSize:19.0 norColor:[UIColor blackColor] selColor:[UIColor redColor]];
    WLMenuView *menuView = [[WLMenuView alloc] initWithFrame:frame labelItems:itemArr backgroundColor:[UIColor lightGrayColor] norColor:[UIColor blueColor]selColor:[UIColor redColor] norSize:16.0 selSize:19.0];
    [self.view addSubview:menuView];
}


@end
