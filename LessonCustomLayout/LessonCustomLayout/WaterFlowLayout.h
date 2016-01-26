//
//  WaterFlowLayout.h
//  LessonCustomLayout
//
//  Created by lanou on 16/1/26.
//  Copyright (c) 2016年 MR. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WaterFlowLayout;

@protocol  WaterFlowLayoutDelegate <NSObject>

//关键方法，此方法的作用是返回每一个item的size大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(WaterFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(WaterFlowLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(WaterFlowLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(WaterFlowLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;

@end

@interface WaterFlowLayout : UICollectionViewLayout

@property (nonatomic, assign)NSUInteger numberOfColumn;

@property (nonatomic, assign)id<WaterFlowLayoutDelegate>delegate;



@end
