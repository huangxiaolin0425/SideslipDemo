//
//  TabBarController.h
//  SideslipDemo
//
//  Created by Cocav on 2018/5/4.
//  Copyright © 2018年 Cocav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarController : UITabBarController
@property(nonatomic,strong)UILabel  *badgeValueLabel;
-(void)setSelectedItem:(NSInteger)selectedItem;
-(void)setBadgeValue:(long long)unReadNum;
@end
