//
//  ILProductViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-14.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILProductViewController.h"

#define ILProductCellID @"product"

#import "ILProduct.h"

#import "ILProductCell.h"

@interface ILProductViewController ()

@property (nonatomic, strong) NSArray *products;

@end

@implementation ILProductViewController

- (NSArray *)products
{
    if (_products == nil) {
        
        // JSON文件路径
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
        // 加载JSON文件
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        // 将JSON转为NSArray
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            ILProduct *p = [ILProduct productWithDict:dict];
            [arrM addObject:p];
        }
        _products = arrM;

        
    }
    return _products;
}

// 重写init的好处，不让外界知道里面是怎么搞的，封装性，外面只要拿来用就好了，至于里面怎么做，他不需要知道，我们也没必要告诉她
- (id)init
{
    
    // 1.为什么要传Layout，因为collectionView里面是一个一个小格子，这些小格子是怎么排布，取决于布局对象
    // 2.UICollectionViewLayout 这个是一个抽象类，没有任何布局，我们一般用流水布局
    // 3.什么是流水布局，当我们的collectionView的宽度增加时，后面的item会自动流上去，如果宽度降低，会自动流下去
    // 打开流水布局头文件，里面可以设置些什么内容，可以设置Item的尺寸，和每个item的间隔
    

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 每个item的尺寸
    layout.itemSize = CGSizeMake(80, 80);
    // 水平间距 320 / 80 = 4 一行4个
    layout.minimumInteritemSpacing = 0;
    // 垂直间距
    layout.minimumLineSpacing = 10;
    // 内边距
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    // 大括号里面不需要任何操作，我就直接返回了。
    return [super initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 注册cell，如果缓存池没有，就会自动创建这种类型的cell
    UINib *xib = [UINib nibWithNibName:@"ILProductCell" bundle:nil];
    [self.collectionView registerNib:xib forCellWithReuseIdentifier:ILProductCellID];
//    [self.collectionView registerClass:[ILProductCell class] forCellWithReuseIdentifier:ILProductCellID];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
}

// 返回有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.products.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    ILProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ILProductCellID forIndexPath:indexPath];
    
    // 传递模型
    cell.product = _products[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取选中item对应的模型
    ILProduct *product = _products[indexPath.item];
    NSString *urlStr = [NSString stringWithFormat:@"%@://%@",product.schemes,product.identifier];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 获取UIApplication
    UIApplication *app = [UIApplication sharedApplication];
    // 判断能否跳转应用
    if ([app canOpenURL:url]) { // 跳转应用
        [app openURL:url];
    }else{ // 去appstore下载
        [app openURL:[NSURL URLWithString:product.url]];
    }
    
    [[UIApplication sharedApplication] openURL:url];
    NSLog(@"%@",[_products[indexPath.item] title]);
    
}



@end
