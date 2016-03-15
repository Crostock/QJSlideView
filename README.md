QJSlideView
===================================
仿网易/今日头条滑动视图


重点:View重用  /  滑动位置计算.
-----------------------------------
滑动过程中对scrollView上的视图进行重用,并且保持当前选中的类型永远在中间显示,通过block回调进行两个视图之间的消息传递.


### 支持滑动大scrollView和点击小的分类scrollView刷新当前页面信息

### About
**QJSlideView** 在滑动过程中会对大scrollView上的视图进行重用,并且在没有滑动到边界时,滑块始终保持在屏幕中间位置.通过Block回调对当前正在显示的分类进行数据刷新.


### Installation Instructions:

1. Copy the 'QJSlideView' folder into your Xcode project. The following files will be added:
2. #import "QJSlideButtonView.h"
3. #import "QJBigScrollView.h"


### details

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



