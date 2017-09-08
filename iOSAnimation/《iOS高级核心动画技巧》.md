#《iOS高级核心动画技巧》
[TOC]

- [书籍地址](https://www.gitbook.com/book/zsisme/ios-/details)

##图层树

- CALayer是UIView内部实现的细节,CAlayer有而UIView没有的功能
 - 阴影，圆角，带颜色的边框
 - 3D变化
 - 非矩形范围
 - 透明遮罩
 - 多级非线性动画

##寄宿图

- CALayer的属性contents是id,但是实际要赋值的是CGImage,否则图层将是空白的
> - 事实上,真正要赋值的类型应该是CGImageRef,它是一个指向CGImage接口的指针.
> - UIImage有一个CGImage属性,它返回一个"CGImageRef",如果直接赋值给contents将会得到一个编译错误,因为CGImageRef并不是一个真正的cocoa对象,而是一个Core Foundation类型
- 如果需要给图层的寄宿图赋值,可以使用下面的方法:
```OC
layer.contents = (__bridge id)image.CGImage;
```
>可以借此给UIView添加image