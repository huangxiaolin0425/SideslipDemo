//
//  ViewController.m
//  SideslipDemo
//
//  Created by Cocav on 2018/5/4.
//  Copyright © 2018年 Cocav. All rights reserved.
//

#import "ViewController.h"
#import "SideslipDemo-Swift.h"
//#import <FWSideMenu/FWSideMenu-Swift.h>
#import "AppDelegate.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController
- (UITableView *)tableView{
    if(!_tableView){
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cells=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cells];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cells];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 打开侧滑菜单
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.sideMenuContainer.sideMenuPanMode = FWSideMenuPanModeDefaults;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 关闭侧滑菜单
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.sideMenuContainer.sideMenuPanMode = FWSideMenuPanModeNone;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"主页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header"] style:UIBarButtonItemStylePlain target:self action:@selector(leftNavBtnAction)];
}

- (void)leftNavBtnAction
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.sideMenuContainer toggleLeftSideMenuWithCompleteBolck:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
