//
//  UIButton+FRButtonEventBlock.h
//  FREventBlock
//
//  Created by free on 2019/7/3.
//  Copyright © 2019 free. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (FRButtonEventBlock)

/**
 touchUpInside Event Block
 */
@property (nonatomic, copy) void(^fr_touchUpInside)(void);

/**
 touchDown Event Block
 */
@property (nonatomic, copy) void(^fr_touchDown)(void);

/**
 touchUpOutside Event Block
 */
@property (nonatomic, copy) void(^fr_touchUpOutside)(void);

/**
 touchCancel Events Block
 */
@property (nonatomic, copy) void(^fr_touchCancel)(void);

@end

NS_ASSUME_NONNULL_END
