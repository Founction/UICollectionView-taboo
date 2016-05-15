//
//  LYCollectionViewCell.h
//  淘宝
//
//  Created by 李胜营 on 16/5/15.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class shop;
@interface LYCollectionViewCell : UICollectionViewCell
/* mode */
@property (strong, nonatomic) shop * model;
+ (LYCollectionViewCell *)collectionCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)calculateCellHeight;
@end
