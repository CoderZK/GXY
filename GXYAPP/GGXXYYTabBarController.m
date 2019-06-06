//
//  GGXXYYTabBarController.m
//  GXYAPP
//
//  Created by zk on 2019/6/6.
//  Copyright © 2019 张坤. All rights reserved.
//

#import "GGXXYYTabBarController.h"
#import "BaseViewController.h"
#import "GGXXYYHomeJiaTVC.h"
#import "GGXXYYMineVC.h"
#import "GGXXYYNewsVC.h"
#import "GGXXYYGouWuChe.h"


@interface GGXXYYTabBarController ()
{
    BaseNavigationController * _mineNavi;
}
@end

@implementation GGXXYYTabBarController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *imgArr=@[@"home",@"gouwuche",@"mine"];
    NSArray *selectedImgArr=@[@"home1",@"gouwuche1",@"mine1"];
    NSArray *barTitleArr=@[@"首页",@"购物车",@"我的"];
    NSArray *className=@[@"GGXXYYHomeJiaTVC",@"GGXXYYNewsVC",@"GGXXYYMineVC"];
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    for (int i=0; i<className.count; i++)
    {
        NSString *str=[className objectAtIndex:i];
        BaseViewController *vc = nil;
        
        //此处创建控制器要根据自己的情况确定是否带tableView
        
        //        if (i== 0)
        //        {
        //           vc=[[NSClassFromString(str) alloc] initWithTableViewStyle:UITableViewStylePlain];
        //        }
        //        else
        //        {
        vc=[[NSClassFromString(str) alloc] init];
        //        }
        
        
        NSString *str1=[imgArr objectAtIndex:i];
        
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        attrs[NSForegroundColorAttributeName] = RGB(127, 127, 127);
        NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
        selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
        selectedAttrs[NSForegroundColorAttributeName] = RGB(211, 27, 8);
        UITabBarItem *item = [UITabBarItem appearance];
        [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
        [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
        vc.tabBarItem.image=[[UIImage imageNamed:str1] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        NSString *str2=[selectedImgArr objectAtIndex:i];
        vc.tabBarItem.selectedImage=[[UIImage imageNamed:str2] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        NSString *str3=[barTitleArr objectAtIndex:i];
        vc.tabBarItem.title=str3;
        self.tabBar.tintColor=[UIColor blackColor];
        BaseNavigationController *nav=[[BaseNavigationController alloc] initWithRootViewController:vc];
        [arr addObject:nav];
    }
    
    
    self.viewControllers=arr;
    _mineNavi = arr.lastObject;
    self.tabBar.barTintColor = [UIColor whiteColor];
}

@end
