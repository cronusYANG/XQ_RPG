//
//  XQRPGTabBarViewController.m
//  XQ_RPG
//
//  Created by POPLAR on 2017/1/13.
//  Copyright © 2017年 user. All rights reserved.
//

#import "XQRPGTabBarViewController.h"

@interface XQRPGTabBarViewController ()

@end

@implementation XQRPGTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray* array = [NSMutableArray array];
    
    [array addObject:[self loadChileViewControllerWithClassName:@"XQRPGPasswordGeneratedViewController" andTitile:@"生成" andImageName:nil]];
    [array addObject:[self loadChileViewControllerWithClassName:@"XQRPGMineViewController" andTitile:@"我的" andImageName:nil]];
    [array addObject:[self loadChileViewControllerWithClassName:@"XQRPGSettingViewController" andTitile:@"设置" andImageName:nil]];
    
    self.viewControllers = array.copy;
    
    
}

- (UIViewController*)loadChileViewControllerWithClassName:(NSString*)className andTitile:(NSString*)title andImageName:(NSString*)imageName
{
    
    // 创建子控制器
    Class Clz = NSClassFromString(className);
    UIViewController* vc = [[Clz alloc] init];
    
    // 设置标题
    vc.tabBarItem.title = title;
    vc.navigationItem.title = title;
    
    // 设置图片
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 嵌套导航控制器
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    return nav;
}

@end
