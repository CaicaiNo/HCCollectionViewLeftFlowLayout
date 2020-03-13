//
//  ViewController.m
//  CCCollectionViewFlowLayout
//
//  Created by gensee on 2020/3/13.
//  Copyright © 2020年 sheng. All rights reserved.
//

#import "ViewController.h"

static NSString * const kCellIdentifier = @"CellIdentifier";

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 最小行间距，默认是0
    layout.minimumLineSpacing = 5;
    // 最小左右间距，默认是10
    layout.minimumInteritemSpacing = 5;
    // 区域内间距，默认是 UIEdgeInsetsMake(0, 0, 0, 0)
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    layout.scrollDirection = 
    
//    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    
    [self.view addSubview:self.collectionView];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return section == 0 ? 20 : 80;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    // cell 序号
    UILabel *label = (UILabel *)[cell viewWithTag:10];
    
    if (label == nil) {
        label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:20];
        label.adjustsFontSizeToFitWidth = YES;
        label.tag = 10;
        [cell addSubview:label];
    }
    [label setFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    label.text = [[NSString alloc] initWithFormat:@"%ld", indexPath.row + 1];
    cell.contentView.layer.borderWidth = 2;
    
    return cell;
}

#pragma mark - UICollectionViewDelegateLeftAlignedLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat randomWidth = (arc4random() % 120) + 30;
    return CGSizeMake(randomWidth, 60);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return section == 0 ? 15 : 5;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

@end
