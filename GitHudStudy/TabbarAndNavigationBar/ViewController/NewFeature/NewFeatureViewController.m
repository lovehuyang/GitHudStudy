//
//  NewFeatureViewController.m
//  GitHudStudy
//
//  Created by tzsoft on 2017/12/7.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "SetupTools.h"

@interface NewFeatureViewController ()<UIScrollViewDelegate>
@property(nonatomic, weak)UIPageControl *pageControl;
@end

@implementation NewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createScrollView];
    [self createPageControl];
}

-(void)createScrollView{
    
    //1、添加UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate =self;
    
    [self.view addSubview:scrollView];
    
    //2、添加图片
    for (int i = 0; i <4; i ++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d",i]];
        imageView.frame = CGRectMake(i *self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
        [scrollView addSubview:imageView];
    }
    //3、设置scrollView滚动的内容尺寸
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width *4, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    //分页
    scrollView.pagingEnabled = YES;
    //弹簧效果
    //scrollView.bounces = NO;
    
    //4、添加开始使用按钮
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake((self.view.frame.size.width -100)*0.5f+self.view.frame.size.width *3, self.view.frame.size.height - 100.0f, 100, 40);
    [nextBtn setTitle:@"开始使用" forState:UIControlStateNormal];
    nextBtn.backgroundColor = MAIN_COLOR;
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:nextBtn];
}
-(void)createPageControl{
    //6、添加PageControl
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.frame = CGRectMake(0, 0, 100, 20);
    pageControl.numberOfPages = 4;
    [pageControl setCenter:CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height-40)];
    pageControl.currentPageIndicatorTintColor = MAIN_COLOR;
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
}
-(void)nextBtnClick{
    [UIApplication sharedApplication].statusBarHidden = NO;
    //切换窗口控制器
    self.view.window.rootViewController = [[SetupTools sharedInstance]chooseRootViewController];
}
#pragma mark scrollView的代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger index=scrollView.contentOffset.x/scrollView.bounds.size.width;
    [self.pageControl setCurrentPage:index];
}

@end
