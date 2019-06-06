//
//  GGXXYYMineVC.m
//  GXYAPP
//
//  Created by zk on 2019/6/6.
//  Copyright © 2019 张坤. All rights reserved.
//

#import "GGXXYYMineVC.h"
#import "GGXXYYMineCell.h"
#import "GGXXYYLoginVC.h"
#import "GGXXYYRenZhengVC.h"
#import "GGXXYYWenTiVC.h"
#import "GGXXYYhelpVC.h"
#import "GGXXYYAddressTVC.h"
#import "GGXXYYOutVC.h"
#import "GGXXYYMineGouWuListTVC.h"
#import "NewsVC.h"
@interface GGXXYYMineVC()
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UIView *headV,*footV;
@property(nonatomic,strong)UIButton *bt;
@property(nonatomic,strong)UILabel *lb;
@end


@implementation GGXXYYMineVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([GGXXYYSignleTool shareTool].isLogin) {
        _lb.text = [NSString stringWithFormat:@"用户名:%@",[GGXXYYSignleTool shareTool].session_uid];;
        self.headV.mj_h = 60;
        self.tableView.tableHeaderView = self.headV;
        self.tableView.tableFooterView = nil;
        //        FMDatabase * db = [FMDBSingle shareFMDB].fd;
        //        BOOL isOpen = [db open];
        //        if (isOpen) {
        //            NSString * sql = [NSString stringWithFormat:@"select *from 'kk_users' where name = %@ ",[GGXXYYSignleTool shareTool].session_uid];
        //            FMResultSet * result = [db executeQuery:sql];
        //
        //            while ([result next]) {
        //                NSInteger status = [result intForColumn:@"status"];
        //                if (status == 0) {
        //                    //未人证
        //                    [self.bt setTitle:@"去认证" forState:UIControlStateNormal];
        //                }else if (status == 1) {
        //                    [self.bt setTitle:@"认证中..." forState:UIControlStateNormal];
        //                }else {
        //                    [self.bt setTitle:@"已认证" forState:UIControlStateNormal];
        //
        //                }
        //                break;
        //
        //            }
        //
        //
        //
        //        }
        //        [db close];
        
    }else {
        
        self.headV.mj_h = 0;
        [self.bt setTitle:@"登录/注册" forState:UIControlStateNormal];
        self.tableView.tableFooterView = self.footV;
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"GGXXYYMineCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.navigationItem.title = @"我的";
    self.dataArray = @[@"购物记录",@"我的地址",@"问题反馈",@"帮助中心",@"消息"];
    [self setNavRightBtnWithImg:@"sss" title:nil withBlock:^(UIButton *rightBtn) {
        
        
        
        
    } handleBtn:^{
        
        GGXXYYOutVC * vc =[[GGXXYYOutVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    [self initHeadV];
    [self initFoot];
    
    
}


- (void)initHeadV {
    
    self.headV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 60)];
    self.headV.clipsToBounds = YES;
    self.headV.backgroundColor = WhiteColor;
    UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, ScreenW-30, 20)];
    lb.textAlignment = NSTextAlignmentCenter;
    [self.headV addSubview:lb];
    self.lb = lb;
    lb.text = [NSString stringWithFormat:@"用户名:%@",[GGXXYYSignleTool shareTool].session_uid];;
    self.tableView.tableHeaderView = self.headV;
    
}

- (void)initFoot {
    
    UIView * footV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 120)];
    footV.backgroundColor = WhiteColor;
    
    self.bt = [[UIButton alloc] initWithFrame:CGRectMake(30, 50, ScreenW - 60, 44)];
    self.bt.layer.cornerRadius = 22;
    [self.bt setTitle:@"登录/注册" forState:UIControlStateNormal];
    self.bt.clipsToBounds = YES;
    [self.bt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    _bt.backgroundColor = RGB(210, 35, 39);
    [footV addSubview:self.bt];
    UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(15, 115, ScreenW-30, 20)];
    lb.textAlignment = NSTextAlignmentCenter;
    [footV addSubview:lb];
    //    lb.text = [NSString stringWithFormat:@"客服电话:400-52348667"];;
    self.tableView.tableFooterView = footV;
    self.footV = footV;
    
}

- (void)clickAction:(UIButton *)button {
    
    GGXXYYLoginVC * vc = [[GGXXYYLoginVC alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GGXXYYMineCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.leftLB.text = self.dataArray[indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (![GGXXYYSignleTool shareTool].isLogin) {
        [self gotoLoginVC];
        return;
    }
    if (indexPath.row == 0) {
        
        GGXXYYMineGouWuListTVC * vc =[[GGXXYYMineGouWuListTVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1) {
        GGXXYYAddressTVC  * vc = [[GGXXYYAddressTVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else  if (indexPath.row == 2) {
        GGXXYYWenTiVC  * vc = [[GGXXYYWenTiVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3) {
        GGXXYYhelpVC  * vc = [[GGXXYYhelpVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        NewsVC  * vc = [[NewsVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    
}

@end
