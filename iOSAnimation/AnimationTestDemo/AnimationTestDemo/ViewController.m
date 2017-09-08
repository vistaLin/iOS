//
//  ViewController.m
//  AnimationTestDemo
//
//  Created by Lennon on 2017/9/8.
//  Copyright © 2017年 Lennon. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (nonatomic, strong) UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     self.view.backgroundColor = [UIColor grayColor];
    [self setupLayerViewTransform];
}

#pragma mark - Private

- (void)setupLayerViewTransform {
    [self addSubviewLayerView];
    [self layerViewAndImage];
    //CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
   // CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    //create a new transform
    CGAffineTransform transform = CGAffineTransformIdentity;
    //scale by 50%
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    //rotate by 30 degrees
    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0);
    //translate by 200 points
    transform = CGAffineTransformTranslate(transform, 200, 0);
    //apply transform to layer
    self.layerView.layer.affineTransform = transform;
}

/**
 给uiview添加图片
 */
- (void)layerViewAndImage {
    UIImage *image = [UIImage imageNamed:@"mineBG"];
    self.layerView.layer.contents = (__bridge id)image.CGImage;
}

- (void)addSubviewLayerView {
    [self.view addSubview:self.layerView];
}

#pragma mark - CustomerAccessor

- (UIView *)layerView {
    if (!_layerView) {
        _layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _layerView.center = self.view.center;
    }
    return _layerView;
}

//
//- (void)addSublayerImage {
//    self.view.backgroundColor = [UIColor grayColor];
//    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    whiteView.backgroundColor = [UIColor whiteColor];
//    whiteView.center = self.view.center;
//    whiteView.layer.shadowOpacity = 0.5;
//    [self.view addSubview:whiteView];
//    // 添加图片图层
//    UIImage *image = [UIImage imageNamed:@"mineBG"];
//    whiteView.layer.contents = (__bridge id)image.CGImage;
//    // 类似于imageView的图层剪切
////    whiteView.contentMode = UIViewContentModeScaleAspectFill;
////    whiteView.clipsToBounds = YES;
//    // CALayer对应conttentModel的属性contentsGravity
//    whiteView.layer.contentsGravity = kCAGravityCenter;
//    whiteView.layer.contentsScale = [UIScreen mainScreen].scale;
//    whiteView.layer.masksToBounds = YES;
//    
//    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
//    whiteView.layer.transform = transform;
//
//}
//
//- (void)addSubLayerColor {
//    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    [self.view addSubview:imageView];
//    
//    CALayer *layerView = [CALayer layer];
//    layerView.frame = imageView.frame;
//    [imageView.layer addSublayer:layerView];
//    
//    CALayer *maskLayer = [CALayer layer];
//    maskLayer.frame = layerView.bounds;
//    UIImage *maskImage = [UIImage imageNamed:@"mineBG"];
//    maskLayer.contents = (__bridge id)maskImage.CGImage;
//    imageView.layer.mask = maskLayer;
//    // imageView.image = maskImage;
//    //    self.view.backgroundColor = [UIColor grayColor];
//    //    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    //    whiteView.backgroundColor = [UIColor whiteColor];
//    //    whiteView.center = self.view.center;
//    //    whiteView.layer.shadowOpacity = 0.5;
//    //    [self.view addSubview:whiteView];
//    //    // 添加图片图层
//    //    UIImage *image = [UIImage imageNamed:@"mineBG"];
//    //    whiteView.layer.contents = (__bridge id)image.CGImage;
//    //    // 类似于imageView的图层剪切
//    ////    whiteView.contentMode = UIViewContentModeScaleAspectFill;
//    ////    whiteView.clipsToBounds = YES;
//    //    // CALayer对应conttentModel的属性contentsGravity
//    //    whiteView.layer.contentsGravity = kCAGravityCenter;
//    //    whiteView.layer.contentsScale = [UIScreen mainScreen].scale;
//    //   whiteView.layer.masksToBounds = YES;
//    // 添加蓝色图层
//    //    CALayer *blueLayer = [CALayer layer];
//    //    blueLayer.frame = CGRectMake(50, 50, 100, 100);
//    //    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//    //    [whiteView.layer addSublayer:blueLayer];
//}
//
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}


@end
