//
//  NBALoading.m
//  TencentNBA
//
//  Created by Jerry on 16/3/7.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "LoadingManager.h"
#import "LoadingView.h"


#define LODINGTAG 20169999

@implementation LoadingManager


//+ (NBALoading *)sharedInstance
//{
//    // 1
//    static NBALoading *_sharedInstance = nil;
//    
//    // 2
//    static dispatch_once_t oncePredicate;
//    
//    // 3
//    dispatch_once(&oncePredicate, ^{
//        _sharedInstance = [[NBALoading alloc] init];
//    });
//    return _sharedInstance;
//}

+ (LoadingView *)showLoadingView:(UIView *)superView
{
    LoadingView *lodingView = [[LoadingView alloc] initWithView:superView];
    lodingView.tag = superView.tag + LODINGTAG;
    [superView addSubview:lodingView];
    [lodingView show];
    return lodingView;
}

+ (LoadingView *)showLoadingView:(UIView *)superView frame:(CGRect)frame
{
    LoadingView *lodingView = [[LoadingView alloc] initWithFrame:frame];
    lodingView.tag = superView.tag + LODINGTAG;
    [superView addSubview:lodingView];
    [lodingView show];
    return lodingView;
}


+ (void)removeLoadingView:(UIView *)superView
{
    LoadingView *lodingView = (LoadingView *)[superView viewWithTag:LODINGTAG + superView.tag];
    [lodingView hide];
    
}

@end
