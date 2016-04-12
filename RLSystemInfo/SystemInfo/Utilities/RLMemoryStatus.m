//
//  RLMemoryStatus.m
//  RLSystemInfo
//
//  Created by rainer_liao on 15/11/2.
//  Copyright © 2015年 rainer_liao. All rights reserved.
//

#import "RLMemoryStatus.h"
#import "SSMemoryInfo.h"

@implementation RLMemoryStatus

+ (NSString *)availableMemory
{
    double freeMemory = [SSMemoryInfo freeMemory:NO];
    if (freeMemory >= 0 )
    {
        double availableMemory = freeMemory ;
        return [NSString stringWithFormat:@"%.2fMB",availableMemory];
    }
    else
    {
        return @"内存计算错误";
    }
    
    
}

@end
