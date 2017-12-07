//
//  ViewFactory.m
//  GitHudStudy
//
//  Created by tzsoft on 2017/12/7.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#import "ViewFactory.h"

@implementation ViewFactory
+ (UIButton *)createSystemButtonWithFrame:(CGRect)frame Target:(id)target Action:(SEL)action Title:(NSString *)title{
    UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame ImageName:(NSString *)imageName Target:(id)target Action:(SEL)action Title:(NSString *)title
{
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //[button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end
