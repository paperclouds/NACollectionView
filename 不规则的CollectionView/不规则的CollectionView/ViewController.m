//
//  ViewController.m
//  不规则的CollectionView
//
//  Created by paperclouds on 2019/3/1.
//  Copyright © 2019年 hechang. All rights reserved.
//

#import "ViewController.h"
#import "NACollectionViewLayout.h"
#import "NACollectionViewCell.h"

//屏幕尺寸
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
#define screenScale screenWidth/375

#define NACollectionViewCellID @"NACollectionViewCellID"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createUI];
}

- (void)createUI{
    
    NACollectionViewLayout *layout = [[NACollectionViewLayout alloc]init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 100, screenWidth, 500) collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor yellowColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"NACollectionViewCell" bundle:nil] forCellWithReuseIdentifier:NACollectionViewCellID];
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NACollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NACollectionViewCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark - UICollectionViewDelegate

//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(screenWidth/3-20, 100);
//}

@end
