//
//  LYCollectionViewCell.m
//  淘宝
//
//  Created by 李胜营 on 16/5/15.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "LYCollectionViewCell.h"
#import "shop.h"
@interface LYCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *price;

@property (weak, nonatomic) IBOutlet UILabel *title;


@end
@implementation LYCollectionViewCell

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    NSLog(@"%s",__func__);
//    self = [super initWithFrame: frame];
//    self.backgroundColor = [UIColor redColor];
//    
//    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
//    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
//    return self;
//}
//
//+ (LYCollectionViewCell *)collectionCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *ID = @"collectionCell";
//    
//    LYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    
//    return cell;
//}
- (void)setModel:(shop *)model
{
    _model = model;
    self.imageView.image = model.image;
    self.price.text = model.price;
    self.title.text = model.title;
    
}
- (CGFloat)calculateCellHeight
{
   
    return CGRectGetMaxY(self.title.frame);

}


@end
