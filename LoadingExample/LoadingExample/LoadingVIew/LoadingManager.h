//
//  NBALoading.h
//  TencentNBA
//
//  Created by Jerry on 16/3/7.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadingView.h"

@interface LoadingManager : NSObject

//+ (NBALoading *)sharedInstance;

+ (LoadingView *)showLoadingView:(UIView *)superView;

+ (LoadingView *)showLoadingView:(UIView *)superView frame:(CGRect)frame;

+ (void)removeLoadingView:(UIView *)superView;

@end
