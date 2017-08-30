//
//  WLPageContentView.m
//  WLPageController
//
//  Created by dinpay on 2017/8/30.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import "WLPageContentView.h"

static NSString *contentCellID = @"ContentCellID";

@interface WLPageContentView ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    
    UICollectionView *_collectionView;
    BOOL _isForbidScrollDelegate;
    CGFloat _startOffsetX;
}

@end


@implementation WLPageContentView

- (instancetype)initWithFrame:(CGRect)frame childViewControllerArrays:(NSArray<UIViewController *> *)childViewControllerArrays parentViewController:(UIViewController *)parentViewController {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.childVCs = childViewControllerArrays;
        self.parentVC = parentViewController;
        _isForbidScrollDelegate = NO;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    for (UIViewController *childViewController in self.childVCs) {
        [self.parentVC addChildViewController:childViewController];
    }
    [self addCollectionView];
}

- (void)addCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.itemSize = self.frame.size;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:layout];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.pagingEnabled = YES;
    _collectionView.bounces = NO;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.scrollsToTop = NO;
    _collectionView.scrollEnabled = YES;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:contentCellID];
    [self addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _childVCs.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:contentCellID forIndexPath:indexPath];
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    UIViewController *vc = _childVCs[indexPath.row];
    vc.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:vc.view];
    
    return cell;
}
#pragma mark - delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _isForbidScrollDelegate = NO;
    _startOffsetX = scrollView.contentOffset.x;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (_isForbidScrollDelegate) {
        return;
    }
    
    CGFloat progress = 0;
    int sourceIndex = 0;
    int targetIndex = 0;
    
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    CGFloat scrollViewW = scrollView.bounds.size.width;
    
    if (currentOffsetX > _startOffsetX) {// 左滑
        // 1.计算progress
        progress = currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW);
        
        // 2.计算sourceIndex
        sourceIndex = currentOffsetX / scrollViewW;
        
        // 3.计算targetIndex
        targetIndex = sourceIndex + 1;
        if (targetIndex >= self.childVCs.count) {
            targetIndex = (int)self.childVCs.count - 1;
        }
        
        // 4.如果完全划过去
        if (currentOffsetX - _startOffsetX == scrollViewW) {
            progress = 1;
            targetIndex = sourceIndex;
        }
    } else {// 右滑
        
        progress = 1 - (currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW));
        
        targetIndex = currentOffsetX / scrollViewW;
        
        sourceIndex = targetIndex + 1;
        if (sourceIndex >= self.childVCs.count) {
            sourceIndex = (int)self.childVCs.count - 1;
        }
    }
    
    if ([self.delegate respondsToSelector:@selector(pageContentView:progress:sourceIndex:targetIndex:)]) {
        [self.delegate pageContentView:self progress:progress sourceIndex:sourceIndex targetIndex:targetIndex];
    }

    NSLog(@"progress:%lf--sourceIndex:%i--targetIndex:%i",progress,sourceIndex,targetIndex);
}
- (void)currrentIndex:(NSInteger)currrentIndex {
    _isForbidScrollDelegate = YES;
    CGFloat offsetX = currrentIndex * _collectionView.frame.size.width;
    _collectionView.contentOffset = CGPointMake(offsetX, 0);
}
@end
