//
//  GoodListViewController.m
//  Watch
//
//  Created by lanou on 16/1/20.
//  Copyright (c) 2016年 MR. All rights reserved.
//

#import "GoodListViewController.h"
//#import "Watch.h"
#import "Lunbo.h"
#import "WatchViewController.h"
#import "MyTableViewCell.h"
#define kWidth self.view.frame.size.width
#define kHight self.view.frame.size.height

@interface GoodListViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (nonatomic, retain)UITableView *tableView;
//@property (nonatomic, retain)NSMutableArray *dataArray;
@property (nonatomic, retain)NSMutableDictionary *allDataDict;
//@property (nonatomic, retain)NSString *datastr;
@property (nonatomic, retain)Lunbo *lunbo;

-(void)handleData;

@end

@implementation GoodListViewController

-(void)dealloc {
    [_allDataDict release];
    [_tableView release];
    [_lunbo release];
    [super dealloc];
}

-(void)handleData {
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"GoodsList.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    self.allDataDict = [NSMutableDictionary dictionary];
    
    for (NSDictionary *dict in array) {
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (NSDictionary *item in dict[@"kind"]) {
            Watch *watch = [Watch new];
            [watch setValuesForKeysWithDictionary:item];
            [mutableArray addObject:watch];
            [watch release];
        }
        [_allDataDict setObject:mutableArray forKey:dict[@"name"]];
    }
    
}
//图片对应点数
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint offset = self.lunbo.show.contentOffset;
    NSInteger page = offset.x/kWidth;
    self.lunbo.page.currentPage = page;
    
}
//点数改变图片
-(void)click:(UIPageControl *)page {
    _lunbo.show.contentOffset = CGPointMake(kWidth *page.currentPage, 0);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _lunbo = [[Lunbo alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHight/3)];
    [self.view addSubview:_lunbo];
    [_lunbo.page addTarget:self action:@selector(click:) forControlEvents:UIControlEventValueChanged];
    _lunbo.show.delegate = self;
    self.navigationController.navigationBar.translucent = NO;
    
    [self handleData];
    self.navigationItem.title = @"智能手表";
    
    _tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0, kHight/ 3, kWidth, kHight) style:UITableViewStylePlain] autorelease];
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    // Do any additional setup after loading the view.
}
//设置分组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _allDataDict.count;
}
//设置每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = _allDataDict.allKeys[section];
    return [_allDataDict[key] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseldentifer = @"reuse";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseldentifer];
    if (!cell ) {
        cell = [[[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseldentifer]autorelease] ;
    }
    Watch *watch = _allDataDict[_allDataDict.allKeys[indexPath.section]][indexPath.row];
    cell.watch = watch;
//    cell.textLabel.text = watch.price;
//    cell.detailTextLabel.text = watch.title;
//    cell.imageView.image = [UIImage imageNamed:watch.image_name];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[tableView cellForRowAtIndexPath:indexPath].selected = NO;
    WatchViewController *watchVC  =[WatchViewController new];
    
    watchVC.watch = _allDataDict[_allDataDict.allKeys[indexPath.section]][indexPath.row];

    [self.navigationController pushViewController:watchVC animated:YES];
    [watchVC release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
