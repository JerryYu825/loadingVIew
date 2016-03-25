//
//  NBALoadingView.m
//  TencentNBA
//
//  Created by Jerry on 16/3/7.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "LoadingView.h"
#import "UIView+Additions.h"

#define ICONCIRCLE @"loading_icon_circle"
#define ICONBALL @"loading_icon_ball"


@interface LoadingView()
{
    float angle;
    BOOL isStop;
}
@property (strong, nonatomic)UIImageView *imgViewCircle;
@property (strong, nonatomic)UIImageView *imgViewBall;
@property (strong, nonatomic)NSTimer *timerAnimation;
@end

@implementation LoadingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)dealloc{
    //NSLog(@"%s",__func__);
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Set default values for properties
        self.backgroundColor = [UIColor clearColor];
        self.contentMode = UIViewContentModeCenter;
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin
								| UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        [self createSubView];
    }
    return self;
}

- (id)initWithView:(UIView *)view {
    NSAssert(view, @"View must not be nil.");
    [view layoutIfNeeded];
//    CGRect rect = CGRectZero;
//    rect.size = view.frame.size;
    return [self initWithFrame:view.bounds];
}


//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    
//    self.imgViewCircle.center = self.center;//CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5);
//    
//    self.imgViewBall.center = self.center;// CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5);
//}

/**
 *  创建loading子view
 */
- (void)createSubView
{
    UIImage *image = [UIImage imageNamed:ICONCIRCLE];
    // logo
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    imageView.center = CGPointMake(self.width / 2, self.height / 2);//CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    self.imgViewCircle = imageView;
    

    image = [UIImage imageNamed:ICONBALL];
    // logo
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    imageView.center = CGPointMake(self.width / 2, self.height / 2);// CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    self.imgViewBall = imageView;
}

#pragma mark - Show & hide

- (void)show
{
    [self startAnimation];
}

- (void)hide
{
    [self stopAnimation];
    [self removeFromSuperview];
}

/**
 *  开始动画
 */
- (void)startAnimation {
    
    [self setNeedsDisplay];

    //[self createSubView];
    
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:-M_PI * 2.0f];
    rotationAnimation.duration = 1.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 500;
    [self.imgViewBall.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    
    //CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0f];
    rotationAnimation.duration = 1.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 500;
    
    [self.imgViewCircle.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

/**
 *  停止动画
 */
- (void)stopAnimation {
    
    [self.imgViewBall.layer removeAnimationForKey:@"rotationAnimation"];
    [self.imgViewCircle.layer removeAnimationForKey:@"rotationAnimation"];
}


@end
