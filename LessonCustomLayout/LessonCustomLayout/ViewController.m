//
//  ViewController.m
//  LessonCustomLayout
//
//  Created by lanou on 16/1/26.
//  Copyright (c) 2016年 MR. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "ImageCell.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()

@property (nonatomic, retain)NSMutableArray *dataArray;

@end

@implementation ViewController
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(WaterFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    Model *model = _dataArray[indexPath.row];
    return CGSizeMake(model.width, model.heght);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(WaterFlowLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {

    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(WaterFlowLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {

    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(WaterFlowLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //从bundle文件中读取原始数据  json格式
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"Data.json" ofType:nil];
    NSData * sourceData = [NSData dataWithContentsOfFile:filePath];
    
    //解析
    NSArray * sourceArray = [NSJSONSerialization JSONObjectWithData:sourceData options:NSJSONReadingMutableContainers error:nil];
    
    self.dataArray = [NSMutableArray arrayWithCapacity:40];
    
    //处理数据
    for (NSDictionary * dic in sourceArray) {
        
        Model * m = [[Model alloc] init];
        [m setValuesForKeysWithDictionary:dic];
        [_dataArray addObject:m];
        [m release];
    }

    //创建布局对象
    WaterFlowLayout *flowLauout = [[WaterFlowLayout alloc]init];
    
    flowLauout.delegate = self;
    flowLauout.numberOfColumn = 3;
    
    //创建集合视图
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLauout];
    collectionView.backgroundColor = [UIColor whiteColor];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    //给collectionView 注册一个cell类
    [collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"aaa"];
    
    [self.view addSubview:collectionView];
    
    [collectionView release];
    [flowLauout release];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_dataArray count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"aaa" forIndexPath:indexPath];
    
    //获取模型
    Model *model = self.dataArray[indexPath.row];
    
    NSURL *url = [NSURL URLWithString:model.thumbURL];
    [cell.imageView sd_setImageWithURL:url placeholderImage:nil];
    
    return cell;
}

@end
