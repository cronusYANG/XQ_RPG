//
//  XQRPGPasswordGeneratedViewController.m
//  XQ_RPG
//
//  Created by POPLAR on 2017/1/13.
//  Copyright © 2017年 user. All rights reserved.
//

#import "XQRPGPasswordGeneratedViewController.h"

#import "XQRPGCalculateManager.h"

@interface XQRPGPasswordGeneratedViewController ()

@end

@implementation XQRPGPasswordGeneratedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    NSMutableArray *array = [NSMutableArray array];
//    for (int i = 0; i<10; i++) {
//        NSString *str = [[XQRPGCalculateManager sharedManager]generateRandomNumberWithPlace:6];
//        [array addObject:str];
//    }
//   
//    NSLog(@"%@",array);
    
    NSString *str = [[XQRPGCalculateManager sharedManager]generateRandomLowercaseWithPlace:8];
    NSLog(@"%@",str);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
