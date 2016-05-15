//
//  ViewController.m
//  淘宝
//
//  Created by 李胜营 on 16/5/14.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "ViewController.h"
#import "LYWaterflowLayout.h"
#import "shop.h"
#import "LYCollectionViewCell.h"

static NSString *ID = @"collectionCell";
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/* models */
@property (strong, nonatomic) NSMutableArray * models;
/* cellH */
@property (assign, nonatomic) LYCollectionViewCell *cell;
/* buju */
@property (strong, nonatomic) LYWaterflowLayout * layout;

@end

@implementation ViewController

- (NSMutableArray *)models
{
    if (_models == nil)
    {
        
        NSArray *shopNames = @[@"klweweirwoierw", @"wnsehowrjwoewojweirwrwrjiwrirwioweio", @"woiejoiwrwiriwew", @"hwoeiwoeeqeqeqwqwewewerwerw", @"jwoierj", @"wjeoifwirwjrweirjwerwerwerwerwerwrwerwerwrw", @"woejoiwjroiwerjwriweir", @"jjooiiiiiiwerwr"];
        NSArray *prices = @[@"19.00", @"189.43", @"1000.00", @"9.35", @"89.99", @"900.00", @"1.00", @"12000.00"];
        _models = [NSMutableArray array];
        for (int i = 0; i < shopNames.count; i++)
        {
            NSString *iamgeName = [NSString stringWithFormat:@"%d.jpeg",i+1];
            UIImage *image = [UIImage imageNamed:iamgeName];
            NSDictionary *dic = @{@"image":image,@"price":prices[i],@"title":shopNames[i]};
            shop *sshop = [shop shopWithDic:dic];
            [_models addObject:sshop];
        }
        
        
    }
    return _models;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    LYWaterflowLayout *layout = [[LYWaterflowLayout alloc] init];
    self.layout = layout;
    
    UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionV.dataSource = self;
    collectionV.delegate = self;
    [collectionV registerNib:[UINib nibWithNibName:NSStringFromClass([LYCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
    
    collectionV.backgroundColor = [UIColor blueColor];
    [self.view addSubview:collectionV];
}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    self.layout.models = self.models;
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.models.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    self.cell = cell;
    cell.model = self.models[indexPath.item];
    cell.backgroundColor = [UIColor redColor];
//    self.cellH = cell.bounds.size.height;
    
    return cell;

}
#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    shop *s = self.models[indexPath.item];
    return CGSizeMake(self.view.bounds.size.width / 2, s.image.size.height + 20);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
