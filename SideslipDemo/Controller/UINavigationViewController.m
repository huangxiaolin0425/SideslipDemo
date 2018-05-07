//
//  UINavigationViewController.m
//  SideslipDemo
//
//  Created by Cocav on 2018/5/4.
//  Copyright © 2018年 Cocav. All rights reserved.
//
#import "UINavigationViewController.h"

@interface UINavigationViewController ()<UINavigationControllerDelegate>
@property (nonatomic, getter=isPushing) BOOL pushing;
@end

@implementation UINavigationViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
     
    }else{
       
    }
    if (self.pushing == YES) {
        return;
    } else {
        self.pushing = YES;
    }
    [super pushViewController:viewController animated:animated];
    if (@available(iOS 11.0, *)){
        // 修改tabBra的frame
        CGRect frame = self.tabBarController.tabBar.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
        self.tabBarController.tabBar.frame = frame;
    }
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
 

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        [viewControllers lastObject].hidesBottomBarWhenPushed = YES;
    }
    [super setViewControllers:viewControllers animated:animated];
}


#pragma mark - UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.pushing = NO;
}
@end
