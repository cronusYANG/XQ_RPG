//
//  XQRPGPasswordGeneratedViewController.m
//  XQ_RPG
//
//  Created by POPLAR on 2017/1/13.
//  Copyright © 2017年 user. All rights reserved.
//

#import "XQRPGPasswordGeneratedViewController.h"
#import "XQRPGCalculateManager.h"
#import "UILabel+Copy.h"
#import <Masonry.h>

#define WIDETH CGRectGetWidth([UIScreen mainScreen].bounds)
#define HEIGHT CGRectGetHeight([UIScreen mainScreen].bounds)

@interface XQRPGPasswordGeneratedViewController ()<UIGestureRecognizerDelegate,UITextFieldDelegate>
@property (strong,nonatomic) UITextField *digits;
@property (strong,nonatomic) UILabel *passWord;
@property (strong,nonatomic) UIButton *numBtn;
@property (strong,nonatomic) UIButton *englishBtn;
@property (strong,nonatomic) UILabel *label;
@end

@implementation XQRPGPasswordGeneratedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"密码生成";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    
//    NSString *str = [[XQRPGCalculateManager sharedManager]generateRandomLowercaseWithPlace:8];
//    NSLog(@"%@",str);
    
}

-(UILabel*)passWord{
    if (!_passWord) {
        _passWord = [[UILabel alloc] init];
        _passWord.text = @"NULL";
        _passWord.font = [UIFont boldSystemFontOfSize:19];
        [_passWord setTextColor:[UIColor blackColor]];
        [_passWord sizeToFit];
        [self.view addSubview:_passWord];
    }
    return _passWord;
}

-(void)setupUI{
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:imgView];
    
    imgView.userInteractionEnabled = YES;
    UITapGestureRecognizer * PrivateLetterTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImgView:)];
    PrivateLetterTap.numberOfTouchesRequired = 1; //手指数
    PrivateLetterTap.numberOfTapsRequired = 1; //tap次数
    PrivateLetterTap.delegate= self;
    imgView.contentMode = UIViewContentModeScaleToFill;
    [imgView addGestureRecognizer:PrivateLetterTap];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    view.alpha = 0.7;
    [imgView addSubview:view];
    
    UILabel *passWord = [[UILabel alloc] init];
    passWord.text = @"NULL";
    passWord.font = [UIFont boldSystemFontOfSize:19];
    [passWord setTextColor:[UIColor blackColor]];
    passWord.isCopyable = YES;
    [passWord sizeToFit];
    [imgView addSubview:passWord];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"长       按       复       制";
    label.font = [UIFont boldSystemFontOfSize:12];
    [label setTextColor:[UIColor yellowColor]];
    [label sizeToFit];
    label.hidden = YES;
    [imgView addSubview:label];
    
    UITextField *digits = [[UITextField alloc] init];
    digits.placeholder = @"密码位数";
    [digits setUserInteractionEnabled:YES];
    digits.font = [UIFont systemFontOfSize:38];
    digits.backgroundColor = [UIColor whiteColor];
    digits.keyboardType = UIKeyboardTypeNumberPad;
    digits.textAlignment = NSTextAlignmentCenter;
    digits.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    [digits sizeToFit];
    digits.delegate = self;
    [self.view addSubview:digits];
    
    UIButton *numBtn = [[UIButton alloc] init];
    [numBtn setTitle:@"生成数字" forState:UIControlStateNormal];
    numBtn.backgroundColor = [UIColor greenColor];
    [numBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    numBtn.alpha = 0.7;
    [self.view addSubview:numBtn];
    
    UIButton *englishBtn = [[UIButton alloc] init];
    [englishBtn setTitle:@"生成英文" forState:UIControlStateNormal];
    englishBtn.backgroundColor = [UIColor greenColor];
    [englishBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    englishBtn.alpha = 0.7;
    [self.view addSubview:englishBtn];
    
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
    
    [label mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(view.mas_bottom).offset(3);
        make.centerX.equalTo(view.mas_centerX);
    }];
    
    [digits mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(view.mas_bottom).offset(40);
        make.centerX.offset(0);
    }];
    
    [numBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.offset(0);
        make.top.equalTo(digits.mas_bottom).offset(40);
        make.width.offset(150);
        make.height.offset(50);
    }];
    
    [englishBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.offset(0);
        make.top.equalTo(numBtn.mas_bottom).offset(40);
        make.width.offset(150);
        make.height.offset(50);
    }];
    
    self.digits = digits;
    self.passWord = passWord;
    self.numBtn = numBtn;
    self.englishBtn = englishBtn;
    self.label = label;
    
    [numBtn addTarget:self action:@selector(generateNumber) forControlEvents:UIControlEventTouchUpInside];
    [englishBtn addTarget:self action:@selector(generateEnglish) forControlEvents:UIControlEventTouchUpInside];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return newLength <= 2;
    
}

- (void)tapImgView: (UITapGestureRecognizer *)gesture{
    
    [self.digits resignFirstResponder];
    
}

-(void)generateNumber{
    CGFloat x = self.digits.text.integerValue;
    if (x > 21) {
        
    }else{
        self.passWord.text = [[XQRPGCalculateManager sharedManager]generateRandomNumberWithPlace:x];
        self.label.hidden = NO;
    }
   
}
-(void)generateEnglish{
    CGFloat x = self.digits.text.integerValue;
    if (x > 21) {
        
    }else{
    self.passWord.text = [[XQRPGCalculateManager sharedManager]generateRandomLowercaseWithPlace:x];
        self.label.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
