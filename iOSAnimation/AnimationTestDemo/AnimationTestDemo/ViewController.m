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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:imageView];
    
    CALayer *layerView = [CALayer layer];
    layerView.frame = imageView.frame;
    [imageView.layer addSublayer:layerView];
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = layerView.bounds;
    UIImage *maskImage = [UIImage imageNamed:@"mineBG"];
    maskLayer.contents = (__bridge id)maskImage.CGImage;
    imageView.layer.mask = maskLayer;
   // imageView.image = maskImage;
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
 //   whiteView.layer.masksToBounds = YES;
     // 添加蓝色图层
//    CALayer *blueLayer = [CALayer layer];
//    blueLayer.frame = CGRectMake(50, 50, 100, 100);
//    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//    [whiteView.layer addSublayer:blueLayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
