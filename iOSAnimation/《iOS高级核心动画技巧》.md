#《iOS高级核心动画技巧》
[TOC]

- [书籍地址](https://www.gitbook.com/book/zsisme/ios-/details)
- [网络地址](https://zsisme.gitbooks.io/ios-/content/chapter5/3d-transform.html)

##第一张 图层树

- CALayer是UIView内部实现的细节,CAlayer有而UIView没有的功能
 - 阴影，圆角，带颜色的边框
 - 3D变化
 - 非矩形范围
 - 透明遮罩
 - 多级非线性动画

##第二章 寄宿图

###contents

- CALayer的属性contents是id,但是实际要赋值的是CGImage,否则图层将是空白的
> - 事实上,真正要赋值的类型应该是CGImageRef,它是一个指向CGImage接口的指针.
> - UIImage有一个CGImage属性,它返回一个"CGImageRef",如果直接赋值给contents将会得到一个编译错误,因为CGImageRef并不是一个真正的cocoa对象,而是一个Core Foundation类型
- 如果需要给图层的寄宿图赋值,可以使用下面的方法:
```OC
layer.contents = (__bridge id)image.CGImage;
```
>可以借此给UIView添加image

- 添加了图片之后可以使用UIView的contents属性获取和UIImageView一样的剪裁效果,而CALayer与contentModed对应的属性叫做contentsGravity,是一个NSString类型

###contentsScale

- contentsScale属性定义的了寄宿图的像素尺寸和视图大小的比例,默认情况下值为1.0的浮点数,由于contents设置了contentsGravity属性,已经被拉伸适应图层的边界,所以contentsScale没有影响
- CGImage是没有拉伸的概念,如果我们需要使用代码的方式处理寄宿图片,就需要手动设置contentsScale属性,代码如下:
```OC
layer.contentsScale = [UIScreeen mainScreen].scale;
```

###contentsRect

- contentsRect允许在图层边框里显示寄宿图的一个子域,但是和bounds,frame不同,它受用的单位坐标,单位坐标指定在0到1之间,是一个相对值(像素和点就是绝对值)
- 可以借此实现图片拼合,多张图片拼成一张,效率更高

###contentsCenter

- contentsCenter起始是一个CGRect,定义了一个固定的边框和一个在图层上可拉伸的区域,改变contentsCenter的值并不会影响到寄宿图的显示,除非改变图层的大小
- CALayer的重绘决定权是在开发者显示调用,是CALayerDelegate里面的(一般单独创建一个图层才会使用这个协议)

##第三章 图层几何学

- UIView的三个比较重要的布局属于:frame,bounds和center,CALayer对应的叫做fame,bounds和position
- frame代表的了图层的外部坐标(也就是在父图层上占据的空间),bounds是内部坐标({0,0}通常是图层的左上角),center和position都代表了相对于父图层anchorPoint所在的位置
- 对于视图或者图层来说,frame并不是一个非常清晰的属性,它其实是一个虚拟属性,是根据bounds,position和transform计算而来的,所以当其中任何一个值发生改变,frame都会变化,相反,改变frame的值同样会影响到他们当中的值
> 这就解释我们为什么设置frame的时候,在指定center的点,会是frame的x和y值发生改变的原因
- 当对图层做变化的时候frame实际上覆盖在图层旋转之后的整个轴对齐的矩形区域,也就是说frame的宽高可能和bounds的宽高不在一致
- 视图的center属性和图层的position属性都指定anchorPoint相对于父图层的位置,anchorPoint通过position来控制frame的位置,可以认为anchorPoint是用来移动图层的把柄
- 默认anchorPoint位于图层的中点,但是anchorPoint可以被移动,图层的position就会改变,从而frame也就跟着改变
- CALayer存在于一个三维空间,zPosition和anchorPointZ都是在Z轴上描述图层位置的浮点类型
- zPosition属性可以明显改变屏幕上图层的顺序,但不能改变事件传递的顺序
- CALayer并不关心响应链时间,不能直接处理触摸事件或者手势,但是有一系列的方法可以处理:-containsPoint:和-hitTest:
 - containsPoint:接受一个在本图层坐标系下的,如果这个点在图层的fame范围内就返回YES,但是需要把触摸坐标转换成每个图层坐标系下的坐标,不方便
 - hitTest:同样接受一个CGPoint类型参数,而不是BOOL类型,它返回图层本身,或者包含这个坐标点的叶子节点图层

##第四章 视觉效果

- cornerRadius,默认情况值只影响背景颜色而不影响背景图片或是子图层,不过把masksToBounds设置YES的话,图层里面的所有东西都会被截取
- 阴影:给shadowOpacity(0~1)属性一个大于默认值的值,就会有阴影显示,改动阴影可以使用CALayer的另外三个属性:shadowColor,shadowOffset和shadowRadius,可以使用shadowPath指定阴影路径(圆或者矩形),更复杂的就使用UIBezierPath类更合适
- maskToBunds和阴影冲突,所以想沿着内容裁剪,需要用到两个图层,一个只画阴影的空的外图层,和一个用maskToBounds裁剪的内图层
- CALayer的属性mast本身是一个CALayer类型,有和其他图层一样的绘制和布局属性,mask图层定义父图层的部分可见区域,不同于那些绘制在父图层中的子图层
- minificationFilter和magnficationFileter属性,

##第五章 变换

- UIView对应的变化是CGAffineTransform,而CALayer的变换是CATransform3D

##问题

- (对于蒙版mask不怎么理解???)
- 矩阵数学(https://zh.wikipedia.org/wiki/%E7%9F%A9%E9%98%B5)???去参考学习