//
//  TabBarController.m
//  SideslipDemo
//
//  Created by Cocav on 2018/5/4.
//  Copyright © 2018年 Cocav. All rights reserved.
//

#import "TabBarController.h"
#import "UINavigationViewController.h"
#import "ViewController.h"
#import "MeViewController.h"
@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildVc:[[ViewController alloc]init] title:@"首页" image:@"fuwu_ic_fuwu_nor" selectedImage:@"fuwu_ic_fuwu_press"];
    [self addChildVc:[[MeViewController alloc]init] title:@"我的" image:@"wode_ic_wode_nor" selectedImage:@"wode_ic_wode_press"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setBadgeValue:(long long)unReadNum{
    if (unReadNum <= 0){
        [[self.tabBar.items objectAtIndex:0] setBadgeValue:nil];
    }else{
        if (unReadNum < 99) {
            [[self.tabBar.items objectAtIndex:0] setBadgeValue:[NSString stringWithFormat:@"%lld",unReadNum]];
        }else{
            [[self.tabBar.items objectAtIndex:0] setBadgeValue:[NSString stringWithFormat:@"%@",@"99+"]];
        }
    }
}


- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationViewController *navigationVc = [[UINavigationViewController alloc] initWithRootViewController:childVc];
    [self addChildViewController:navigationVc];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"%@",item);
    
     
}

- (void)setSelectedItem:(NSInteger)selectedItem
{
   
    self.selectedIndex = selectedItem;
}


@end
