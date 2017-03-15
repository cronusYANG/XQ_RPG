//
//  XQRPGPasswordGeneratedViewController.m
//  XQ_RPG
//
//  Created by POPLAR on 2017/1/13.
//  Copyright © 2017年 user. All rights reserved.
//

#import "XQRPGPasswordGeneratedViewController.h"
#import "XQRPGCalculateManager.h"
#import <Masonry.h>

#define WIDETH CGRectGetWidth([UIScreen mainScreen].bounds)
#define HEIGHT CGRectGetHeight([UIScreen mainScreen].bounds)

@interface XQRPGPasswordGeneratedViewController ()

@end

@implementation XQRPGPasswordGeneratedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    
//    NSString *str = [[XQRPGCalculateManager sharedManager]generateRandomLowercaseWithPlace:8];
//    NSLog(@"%@",str);
    
}

-(void)setupUI{
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:imgView];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    view.alpha = 0.7;
    [imgView addSubview:view];
    
    UILabel *passWord = [[UILabel alloc] init];
    passWord.text = @"NULL";
    passWord.font = [UIFont boldSystemFontOfSize:19];
    [passWord setTextColor:[UIColor blackColor]];
    [passWord sizeToFit];
    [imgView addSubview:passWord];
    
    
    
    [imgView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.right.left.bottom.offset(0);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.offset(120);
        make.centerX.offset(0);
        make.width.offset(WIDETH-50);
        make.height.offset(55);
    }];
    
    [passWord mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(view.mas_centerX);
        make.centerY.equalTo(view.mas_centerY);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
