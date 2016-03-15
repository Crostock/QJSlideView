//
//  ViewController.m
//  QJSlideView
//
//  Created by Justin on 16/3/10.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import "ViewController.h"
#import "QJSlideButtonView.h"
#import "QJBigScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"QJSlideView";

    [self confingSlideButtonView];
}

- (void)confingSlideButtonView
{
    NSArray *titleArr = @[@"英语",@"数学",@"语文",@"历史",@"地理",@"思想政治",@"化学",@"物理",@"体育",@"生物",@"音乐",@"美术"];

    QJSlideButtonView *s = [[QJSlideButtonView alloc] initWithcontroller:self TitleArr:titleArr];
    QJBigScrollView *b = [[QJBigScrollView alloc] initWithcontroller:self TitleArr:titleArr];

    __weak typeof(s) Sweak = s;
    __weak typeof(b) Bweak = b;
    b.Bgbolck = ^(NSInteger index){
        [Sweak setSBScrollViewContentOffset:index];
    };
    s.sbBlock = ^(NSInteger index){
        [Bweak setBgScrollViewContentOffset:index];
    };
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
