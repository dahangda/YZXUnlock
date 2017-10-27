//
//  UnlockViewController.m
//  unlockText
//
//  Created by 尹星 on 2017/10/26.
//  Copyright © 2017年 尹星. All rights reserved.
//

#import "UnlockViewController.h"
#import "TouchIDViewController.h"
#import "GesturesViewController.h"

@interface UnlockViewController ()

@property (weak, nonatomic) IBOutlet UIButton *gestureButton;

@end

@implementation UnlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *gestureUnlock = [[NSUserDefaults standardUserDefaults] objectForKey:@"GestureUnlock"];
    //为保存手势解锁密码，进入设置手势页面
    if (!gestureUnlock || gestureUnlock.count == 0) {
        [self.gestureButton setTitle:@"设置手势" forState:UIControlStateNormal];
    }else {//以保存手势解锁密码，点击进入手势解锁
        [self.gestureButton setTitle:@"手势解锁" forState:UIControlStateNormal];
    }
}

//跳转手势解锁
- (IBAction)gestureUnlock:(UIButton *)sender {
    //设置手势解锁
    if ([sender.titleLabel.text isEqualToString:@"设置手势"]) {
        GesturesViewController *gesturesVC = [[GesturesViewController alloc] init];
        gesturesVC.settingGesture = YES;
        [self presentViewController:gesturesVC animated:NO completion:nil];
    }else {//点击进入手势解锁
        GesturesViewController *gesturesVC = [[GesturesViewController alloc] init];
        gesturesVC.settingGesture = NO;
        [self presentViewController:gesturesVC animated:NO completion:nil];
    }
}

//跳转指纹解锁
- (IBAction)touchIDUnlock:(UIButton *)sender {
    TouchIDViewController *touchIDVC = [[TouchIDViewController alloc] init];
    [self presentViewController:touchIDVC animated:NO completion:nil];
}

@end
