//
//  MenuViewController.m
//  SideslipDemo
//
//  Created by Cocav on 2018/5/4.
//  Copyright © 2018年 Cocav. All rights reserved.
//

#import "MenuViewController.h"
#import "SubViewController.h"
#import "AppDelegate.h"

@interface MenuViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) UITableView *tabelView;
@property (nonatomic, strong) UIView *heardView;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.titleArray = @[@"1", @"2", @"3", @"4", @"5"];
    [self.view addSubview:self.heardView];
    [self.view addSubview:self.tabelView];
}
- (UIView *)heardView{
    if(!_heardView){
        _heardView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
        _heardView.backgroundColor=[UIColor whiteColor];
        UILabel *label=[[UILabel alloc]initWithFrame:_heardView.frame];
        label.text=@"   这是头部";
        label.font=[UIFont systemFontOfSize:25];
        [_heardView addSubview:label];
    }
    return _heardView;
}
- (UITableView *)tabelView{
    if(!_tabelView){
        _tabelView=[[UITableView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-100) style:UITableViewStylePlain];
        _tabelView.delegate=self;
        _tabelView.dataSource=self;
    }
    return _tabelView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellId"];
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *nav = nil;
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if ([delegate.sideMenuContainer.centerViewController isKindOfClass:[UITabBarController class]]) {
        
        id tmp = delegate.sideMenuContainer.centerViewController.childViewControllers[0];
        if ([tmp isKindOfClass:[UINavigationController class]]) {
            nav = (UINavigationController *)tmp;
        }
        
    } else if ([delegate.sideMenuContainer.centerViewController isKindOfClass:[UINavigationController class]]) {
        nav = (UINavigationController *)delegate.sideMenuContainer.centerViewController;
    }
    
    if (nav) {
        SubViewController *sub=[[SubViewController alloc] init];
        sub.typestr=self.titleArray[indexPath.row];
        [nav pushViewController:sub animated:YES];
    }
    
    [delegate.sideMenuContainer setSideMenuStateWithState:FWSideMenuStateClosed completeBlock:nil];
}

@end
