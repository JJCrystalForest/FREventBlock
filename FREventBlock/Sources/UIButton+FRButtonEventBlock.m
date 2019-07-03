//
//  UIButton+FRButtonEventBlock.m
//  FREventBlock
//
//  Created by free on 2019/7/3.
//  Copyright © 2019 free. All rights reserved.
//

#import "UIButton+FRButtonEventBlock.h"
#import <objc/runtime.h>

@interface UIButton()

@property (nonatomic, copy) void(^touchUpInsideBlock)(void);
@property (nonatomic, copy) void(^touchDownBlock)(void);
@property (nonatomic, copy) void(^touchUpOutsideBlock)(void);
@property (nonatomic, copy) void(^touchCancelBlock)(void);

@end

@implementation UIButton (FRButtonEventBlock)

#pragma mark - touchUpInside

@dynamic fr_touchUpInside;

static void *fr_buttonTouchUpInsideBlockKey = &fr_buttonTouchUpInsideBlockKey;

- (void (^)(void))touchUpInsideBlock {
    return objc_getAssociatedObject(self, &fr_buttonTouchUpInsideBlockKey);
}

- (void)setTouchUpInsideBlock:(void (^)(void))block {
    objc_setAssociatedObject(self, &fr_buttonTouchUpInsideBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setFr_touchUpInside:(void (^)(void))fr_touchUpInside {
    self.touchUpInsideBlock = fr_touchUpInside;
    [self addTarget:self action:@selector(touchUpInsideEvent) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchUpInsideEvent {
    !self.touchUpInsideBlock ?: self.touchUpInsideBlock();
}

#pragma mark - touchDown

@dynamic fr_touchDown;

static void *fr_buttonTouchDownBlockKey = &fr_buttonTouchDownBlockKey;

- (void (^)(void))touchDownBlock {
    return objc_getAssociatedObject(self, &fr_buttonTouchDownBlockKey);
}

- (void)setTouchDownBlock:(void (^)(void))touchDownBlock {
    objc_setAssociatedObject(self, &fr_buttonTouchDownBlockKey, touchDownBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setFr_touchDown:(void (^)(void))fr_touchDown {
    self.touchDownBlock = fr_touchDown;
    [self addTarget:self action:@selector(touchDownEvent) forControlEvents:UIControlEventTouchDown];
}

- (void)touchDownEvent {
    !self.touchDownBlock ?: self.touchDownBlock();
}

#pragma mark - touchUpOutside

@dynamic fr_touchUpOutside;

static void *fr_touchUpOutsideBlockKey = &fr_touchUpOutsideBlockKey;

- (void (^)(void))touchUpOutsideBlock {
    return objc_getAssociatedObject(self, &fr_buttonTouchDownBlockKey);
}

- (void)setTouchUpOutsideBlock:(void (^)(void))touchUpOutsideBlock {
    objc_setAssociatedObject(self, &fr_touchUpOutsideBlockKey, touchUpOutsideBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setFr_touchUpOutside:(void (^)(void))fr_touchUpOutside {
    self.touchUpOutsideBlock = fr_touchUpOutside;
    [self addTarget:self action:@selector(touchUpOutsideBlock) forControlEvents:UIControlEventTouchUpOutside];
}

- (void)touchUpOutsideEvent {
    self.touchUpOutsideBlock ?: self.touchUpOutsideBlock();
}

#pragma mark - touchUpOutside

@dynamic fr_touchCancel;

static void *fr_touchCancelBlockKey = &fr_touchCancelBlockKey;

- (void (^)(void))touchCancelBlock {
    return objc_getAssociatedObject(self, &fr_touchCancelBlockKey);
}

- (void)setTouchCancelBlock:(void (^)(void))touchCancelBlock {
    objc_setAssociatedObject(self, &fr_touchCancelBlockKey, touchCancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setFr_touchCancel:(void (^)(void))fr_touchCancel {
    self.touchCancelBlock = fr_touchCancel;
    [self addTarget:self action:@selector(touchCancelEnent) forControlEvents:UIControlEventTouchCancel];
}

- (void)touchCancelEnent {
    self.touchCancelBlock ?: self.touchCancelBlock();
}

@end
