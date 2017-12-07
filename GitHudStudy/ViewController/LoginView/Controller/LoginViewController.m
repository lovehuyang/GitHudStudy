//
//  LoginViewController.m
//  GitHudStudy
//
//  Created by tzsoft on 2017/12/7.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#import "LoginViewController.h"
#import "SetupTools.h"
#import "systemTabbar.h"

@interface LoginViewController ()
{
    UITextField * _userPhone;
    UITextField * _passWord;
    UIButton *_forgetPwdBtn;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    // 输入框左部图片数组及占位文本数组
    NSArray *placeHolder_Array = @[@"请输入手机号",@"请输入密码"];
    // 输入框的位置及宽高
    CGFloat tfHeight = 30;
    for(int i=0; i<2; i++)
    {
        UITextField *tf = [UITextField new];
        tf.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        [self.view addSubview:tf];
        tf.sd_layout
        .rightSpaceToView(self.view , 30)
        .topSpaceToView(self.view , 80 + i * 40 )
        .leftSpaceToView(self.view , 30)
        .heightIs(tfHeight);
        tf.backgroundColor = [UIColor redColor];
        
        tf.placeholder = [placeHolder_Array objectAtIndex:i];
        [tf setValue:[UIFont boldSystemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
        
        if(i==0)
        {
            _userPhone = tf;
            _userPhone.leftViewMode = UITextFieldViewModeAlways;
            _userPhone.text =[SetupTools sharedInstance].user_Phone ;
            _userPhone.keyboardType = UIKeyboardTypeNumberPad;
            
        }
        else
        {
            _passWord = tf;
            _passWord.secureTextEntry = YES;
            _passWord.leftViewMode = UITextFieldViewModeAlways;
            _passWord.text = [SetupTools sharedInstance].user_Pwd ;
            
        }
    }
    
    // 创建"系统登录"按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:loginBtn];
    loginBtn.sd_layout
    .leftSpaceToView(self.view, 40)
    .topSpaceToView(self.view, 170)
    .rightSpaceToView(self.view, 40)
    .heightIs(30);
    [loginBtn setTitle:@"系统登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:HXYGetColor(@"#3385FF")];
    loginBtn.layer.cornerRadius = 5;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.adjustsImageWhenHighlighted = NO;
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)loginBtnClick{
    // 结束编辑
    [self.view endEditing:YES];
    //本地化用户信息
    [[SetupTools sharedInstance] setUser_Pwd:_passWord.text];
    [[SetupTools sharedInstance] setUser_Phone:_userPhone.text] ;
    //跳转至页面
    self.view.window.rootViewController = [[systemTabbar alloc]init];
}

#pragma mark - 生命周期函数
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
@end
