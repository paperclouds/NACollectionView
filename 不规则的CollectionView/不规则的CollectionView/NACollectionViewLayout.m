//
//  NACollectionViewLayout.m
//  不规则的CollectionView
//
//  Created by paperclouds on 2019/3/1.
//  Copyright © 2019年 hechang. All rights reserved.
//

#import "NACollectionViewLayout.h"

#define Margin 32

#define LineSapce 15

#define getAvailableWidth(w) ((w) - self.sectionInset.left - self.sectionInset.right-Margin)

@implementation NACollectionViewLayout

-(void)prepareLayout{
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.minimumLineSpacing = LineSapce;
    self.minimumInteritemSpacing = Margin;
    self.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    for (int i = 0; i < array.count; i++) {
        UICollectionViewLayoutAttributes *attribute = array[i];
        
        NSInteger width = getAvailableWidth(self.collectionView.frame.size.width);
        CGFloat bili1 = 90.00/getAvailableWidth(375);
        CGFloat bili2 = 212.00/getAvailableWidth(375);
        
        CGFloat wh_bili1 = 90.00/131;
        CGFloat wh_bili2 = 212.00/131;
        
        // 计算attribute的frame
        CGFloat X = 0+self.sectionInset.left;
        CGFloat Y = 0+self.sectionInset.top;
        
        switch (i) {
            case 0:
                attribute.frame = CGRectMake(X, Y, width*bili1, width*bili1/wh_bili1);
                break;
            case 1:
                attribute.frame = CGRectMake(X+width*bili1+Margin, Y, width*bili1, width*bili1/wh_bili1);
                break;
            case 2:
                attribute.frame = CGRectMake(X+width*bili1*2+Margin*2, Y, width*bili1, width*bili1/wh_bili1);
                break;
            case 3:
                attribute.frame = CGRectMake(X, Y+width*bili1/wh_bili1+LineSapce, width*bili2, width*bili2/wh_bili2);
                break;
            case 4:
                attribute.frame = CGRectMake(X+width*bili1*2+Margin*2, Y+width*bili1/wh_bili1+LineSapce, width*bili1, width*bili1/wh_bili1);
                break;
            case 5:
                attribute.frame = CGRectMake(X, Y+width*bili1/wh_bili1*2+LineSapce*2, width*bili1, width*bili1/wh_bili1);
                break;
            case 6:
                attribute.frame = CGRectMake(X+width*bili1+Margin, Y+width*bili1/wh_bili1*2+LineSapce*2, width*bili1, width*bili1/wh_bili1);
                break;
            case 7:
                attribute.frame = CGRectMake(X+width*bili1*2+Margin*2, Y+width*bili1/wh_bili1*2+LineSapce*2, width*bili1, width*bili1/wh_bili1);
                break;
            default:
                break;
        }
    }
    
    return array;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

@end
