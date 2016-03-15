//
//  QJsampleView.m
//  QJSlideView
//
//  Created by Justin on 16/3/12.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import "QJsampleView.h"
#define Screen_Width    ([UIScreen mainScreen].bounds.size.width)
#define Screen_Height   ([UIScreen mainScreen].bounds.size.height)

@interface QJsampleView ()<UITableViewDataSource,UITableViewDelegate>

/**
 *  mytableView 可以根据自己需求替换成自己的视图.
 */
@property(nonatomic, strong)UITableView *mytableView;

@end

@implementation QJsampleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        self.title = title;
        [self confingSubViews];
    }
    return self;
}

- (void)confingSubViews
{
    [self addSubview:self.mytableView];
}


-(UITableView *)mytableView
{
    if (_mytableView != nil) {
        return _mytableView;
    }
    _mytableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height - 44) style:UITableViewStylePlain];
    _mytableView.delegate = self;
    _mytableView.dataSource = self;
    _mytableView.showsHorizontalScrollIndicator = NO;
    _mytableView.showsVerticalScrollIndicator = NO;
    _mytableView.layer.cornerRadius = 10;
    _mytableView.backgroundColor = [UIColor whiteColor];
    return _mytableView;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"statusCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        //        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    if (indexPath.row%2 == 0) {
        cell.backgroundColor = [UIColor lightGrayColor];
    }
    cell.textLabel.text = self.title;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    
    return cell;
    
}

/**
 *  刷新数据
 */
- (void)reloadData
{
    [self.mytableView reloadData];
}

@end
