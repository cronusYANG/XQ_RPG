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
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static XQRPGCalculateManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[XQRPGCalculateManager alloc] init];
    });
    return instance;
}

//随机生成数字字符串
- (NSString *)generateRandomNumberWithPlace:(NSInteger)place {
    
    NSString *str;
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < place; i++) {
        _rNumber = (arc4random() % 10);
        str = [NSString stringWithFormat:@"%ld",_rNumber];
        [mArray addObject:str];
    }
    
    NSInteger count = [mArray count];
    NSMutableString *mStr = [[NSMutableString alloc] init];
    for (int i = 0; i < count; i++) {
        [mStr appendString:[mArray objectAtIndex:i]];
    }
    return mStr;
}

//生成随机小写字母
- (NSString *)generateRandomLowercaseWithPlace:(NSInteger)place {
    char data[place];
    for (int x = 0; x < place; data[x++] = (char)('a' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:place encoding:NSUTF8StringEncoding];
}

//生成随机大写字母
- (NSString *)generateRandomUppercaseWithPlace:(NSInteger)place {
    char data[place];
    for (int x = 0; x < place; data[x++] = (char)('A' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:place encoding:NSUTF8StringEncoding];
}

@end
