//
//  RLNetworkType.h
//  RLSystemInfo
//
//  Created by rainer_liao on 15/11/2.
//  Copyright © 2015年 rainer_liao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface RLNetworkType : NSObject

+ (NSString *)networkType;


+ (NSString *)carrierType;

@end
