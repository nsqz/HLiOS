//
//  WatchViewController.m
//  Watch
//
//  Created by lanou on 16/1/20.
//  Copyright (c) 2016年 MR. All rights reserved.
//

#import "WatchViewController.h"

@interface WatchViewController ()

@property (nonatomic, retain)UIImageView *imageView;

@end

@implementation WatchViewController

-(void)dealloc {
    [_imageView release];
    [_watch release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _watch.title;
    _imageView = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    _imageView.image = [UIImage imageNamed:_watch.image_name];
    [self.view addSubview:_imageView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
