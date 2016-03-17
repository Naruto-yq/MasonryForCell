//
//  MainTabBarController.m
//  MansoryForCell
//
//  Created by 余钦 on 16/3/16.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"


#define  TextAttribute(textAttrs, color) do{\
            textAttrs[NSForegroundColorAttributeName] = color;\
}while(0)


@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupSubviews];
}


- (void)SetupSubviews
{
    NSArray *titlesString = @[@"主页", @"关卡", @"消息", @"购物车", @"设置"];
    NSArray *imageArray = @[@"home", @"earth", @"Message", @"cart", @"user"];
    NSArray *seletedImageArray = @[@"homeH", @"earthH", @"MessageH", @"cartH", @"userH"];
    HomeViewController *homeVc = [[HomeViewController alloc]init];
    
    UIViewController *globalVc = [[UIViewController alloc]init];
    
    UIViewController *messageVc = [[UIViewController alloc]init];
    
    UIViewController *carVc = [[UIViewController alloc]init];
    
    UIViewController *meVc = [[UIViewController alloc]init];
    
    NSArray *vcArray = @[homeVc, globalVc, messageVc, carVc, meVc];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    for (int nIndex = 0; nIndex < vcArray.count; nIndex++) {
        UIViewController *vc = vcArray[nIndex];
        vc.title = titlesString[nIndex];
        vc.tabBarItem.image = [UIImage imageNamed:imageArray[nIndex]];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:seletedImageArray[nIndex]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        TextAttribute(textAttrs, [UIColor redColor]);
        [vc.tabBarItem setTitleTextAttributes: textAttrs forState:UIControlStateHighlighted];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [self addChildViewController:nav];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
