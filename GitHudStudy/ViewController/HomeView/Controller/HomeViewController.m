//
//  HomeViewController.m
//  GitHudStudy
//
//  Created by tzsoft on 2017/12/7.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#import "HomeViewController.h"
#import "NextViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [ViewFactory createButtonWithFrame:CGRectMake(100, 100, 100, 100) ImageName:nil Target:self Action:@selector(btnClick) Title:@"按钮"];
    [self.view addSubview:btn];
}

- (void)btnClick{
    NextViewController *lvc = [NextViewController new];
    [self.navigationController pushViewController:lvc animated:YES];
}

@end
