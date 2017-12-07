//
//  ViewFactory.h
//  GitHudStudy
//
//  Created by tzsoft on 2017/12/7.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewFactory : NSObject
+ (UIButton *)createButtonWithFrame:(CGRect)frame ImageName:(NSString *)imageName Target:(id)target Action:(SEL)action Title:(NSString *)title;
+ (UIButton *)createSystemButtonWithFrame:(CGRect)frame Target:(id)target Action:(SEL)action Title:(NSString *)title;

@end
