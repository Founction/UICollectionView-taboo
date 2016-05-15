//
//  LYWaterflowLayout.m
//  淘宝
//
//  Created by 李胜营 on 16/5/15.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "LYWaterflowLayout.h"
#import "shop.h"
//边距
static const UIEdgeInsets LYDefaultEdgeInsets = {10,10,10,10};
//和间隙
static const CGFloat LYDefaultMargin = 10;
//列数
static const NSInteger LYDefaultColumns = 3;
@interface LYWaterflowLayout()
/* layoutattr */
@property (strong, nonatomic) NSMutableArray * attrsArray;
/* cellHight */
@property (strong, nonatomic) NSMutableArray * columnHights;

@end

@implementation LYWaterflowLayout
- (NSMutableArray *)attrsArray
{
    if (_attrsArray == nil)
    {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;

}
- (NSMutableArray *)columnHights
{
    if (_columnHights == nil)
    {
        _columnHights = [NSMutableArray array];
    }
    return _columnHights;
    
}

- (void)prepareLayout
{
    /**
     *  创建每个cell对应的布局
     *  1.首先要拿到collectionview 才能针对每个cell进行布局
     *  2.每个cell进行布局设置。并将布局放在数组中
     */
    //every column
    for (int i = 0; i < LYDefaultColumns; i++)
    {
        [self.columnHights addObject:@(LYDefaultEdgeInsets.top)];
    }
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    //取出所有的cell，从collectionview中。
    for (int i = 0; i < count; i++)
    {
        //通过i获得每个cell的indexpath位置
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        //获取每个indexpath对应的布局,并调用自己的布局方法。（不要去吊用父类的）
        UICollectionViewLayoutAttributes *layoutAttr = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [self.attrsArray addObject:layoutAttr];
    }


}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;


}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //创建布局
    UICollectionViewLayoutAttributes *layoutAttr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //collectionview的宽度
    CGFloat collectionviewW = self.collectionView.frame.size.width;
    
    //计算每个cell的高度和宽度
    //width :减去边距，间隙，
    CGFloat w = (collectionviewW - LYDefaultEdgeInsets.left - LYDefaultEdgeInsets.right - (LYDefaultColumns - 1) * LYDefaultMargin) / LYDefaultColumns;
    //之后高度就要有图片决定了。可以定义属性传值过来
    CGSize itemSize = [(id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
//    shop *s = self.models[indexPath.item];
//    CGFloat h = s.image.size.height + 30;
    CGFloat h = itemSize.height;
    //find the shortest column
    
    //初始化该过程。
    NSInteger desCol = 0;
    CGFloat miniColumnHeight = [self.columnHights[0] doubleValue];
    for (int i = 1; i < LYDefaultColumns; i++)
    {
        if (miniColumnHeight > [self.columnHights[i] doubleValue])
        {
            miniColumnHeight = [self.columnHights[i] doubleValue];
            desCol = i;
        }
    }
    //计算x，y
    CGFloat x = LYDefaultEdgeInsets.left + desCol * (w + LYDefaultMargin);

    CGFloat y = miniColumnHeight;
    layoutAttr.frame = CGRectMake(x, y, w, h);
    self.columnHights[desCol] = @(CGRectGetMaxY(layoutAttr.frame));
    
    return layoutAttr;
}
- (CGSize)collectionViewContentSize
{
    //找出最高的列
    CGFloat maxColumnHeight = [self.columnHights[0] doubleValue];
    
    for (int i = 1; i < LYDefaultColumns; i++)
    {
        if (maxColumnHeight < [self.columnHights[i] doubleValue])
        {
            maxColumnHeight = [self.columnHights[i] doubleValue];
            
        }
    }
    return CGSizeMake(0, maxColumnHeight + LYDefaultEdgeInsets.bottom);
}
@end
