//
//  XQRPGCalculateManager.h
//  XQ_RPG
//
//  Created by POPLAR on 2017/1/13.
//  Copyright © 2017年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQRPGCalculateManager : NSObject
+ (instancetype)sharedManager;
- (NSString *)generateRandomNumberWithPlace:(NSInteger)place;
- (NSString *)generateRandomLowercaseWithPlace:(NSInteger)place;
@end
