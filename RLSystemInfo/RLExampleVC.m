//
//  RLExampleVC.m
//  RLSystemInfo
//
//  Created by rainer_liao on 15/11/2.
//  Copyright © 2015年 rainer_liao. All rights reserved.
//

#import "RLExampleVC.h"
#import "RLSystemInfo.h"

@interface RLExampleVC ()

@end

@implementation RLExampleVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self print];
}
- (IBAction)printLog:(id)sender
{
    [self print];
}

- (void)print
{
    NSDictionary *dict = [[RLSystemInfo sharedInstance]allSystemInformation];
    NSLog(@"%@",dict);
    
    NSString *carrierType = [[RLSystemInfo sharedInstance] carrierType];
    NSLog(@"carrierType:%@",carrierType);
    
    NSString *userPhoneName = [[RLSystemInfo sharedInstance] userPhoneName];
    NSLog(@"userPhoneName:%@",userPhoneName);
}

@end
