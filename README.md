# FREventBlock

为 UIButton 的各个事件添加 block。

使用方法：

```objc
#import "UIButton+FRButtonEventBlock.h"

self.aButton.fr_touchUpInside = ^{
    NSLog(@"touchUpInside");
};
    
self.aButton.fr_touchUpOutside = ^{
    NSLog(@"touchUpOutside");
};
    
self.aButton.fr_touchDown = ^{
    NSLog(@"touchDown");
};
    
self.aButton.fr_touchCancel = ^{
    NSLog(@"touchCancel");
};
```

[iOS概念攻坚之路（七）：block](https://juejin.im/post/5d0d7ea8e51d4510803ce3d0)
