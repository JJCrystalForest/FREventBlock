//
//  ViewController.m
//  FREventBlock
//
//  Created by free on 2019/7/3.
//  Copyright © 2019 free. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+FRButtonEventBlock.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *aButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.aButton];
    
    self.aButton.fr_touchUpInside = ^{
        NSLog(@"%s",__func__);
    };;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.aButton.frame = CGRectMake(100, 100, 100, 100);
    
}

- (UIButton *)aButton {
    if (!_aButton) {
        _aButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _aButton.backgroundColor = [UIColor orangeColor];
    }
    return _aButton;
}

@end
