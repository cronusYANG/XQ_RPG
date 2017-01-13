//
//  XQRPGCalculateManager.m
//  XQ_RPG
//
//  Created by POPLAR on 2017/1/13.
//  Copyright © 2017年 user. All rights reserved.
//

#import "XQRPGCalculateManager.h"

@interface XQRPGCalculateManager ()
@property (assign,nonatomic) long rNumber;
@property (strong,nonatomic) NSString *rLetter;
@end

@implementation XQRPGCalculateManager

- (NSString *)generateRandomNumber{
    _rNumber = (arc4random() % 9);
    NSString *str = [NSString stringWithFormat:@"%ld",_rNumber];
    return str;
}

@end
