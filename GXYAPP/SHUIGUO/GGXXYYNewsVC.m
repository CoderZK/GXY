//
//  GGXXYYNewsVC.m
//  GXYAPP
//
//  Created by zk on 2019/6/6.
//  Copyright © 2019 张坤. All rights reserved.
//

#import "GGXXYYNewsVC.h"
#import "GGXXYYLoginVC.h"
#import "GGXXYYNewsCell.h"
#import "GGXXYYHomeModel.h"

@interface GGXXYYNewsVC()
@property(nonatomic,strong)NSMutableArray<GGXXYYHomeModel *> *dataArray;

@end


@implementation GGXXYYNewsVC

- (NSMutableArray<GGXXYYHomeModel *> *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"GGXXYYNewsCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.navigationItem.title = @"我的消息";
    [self getData];
    
}

- (void)getData {
    
    NSString * sql = [NSString stringWithFormat:@"select *from kk_news where name = '%@'",[GGXXYYSignleTool shareTool].session_uid];
    FMDatabase * db = [FMDBSingle shareFMDB].fd;
    BOOL isOpen = [db open];
    if (isOpen) {
        FMResultSet * result = [db executeQuery:sql];
        while ([result next]) {
            GGXXYYHomeModel * model = [[GGXXYYHomeModel alloc] init];
            model.title = [result stringForColumn:@"name"];
            model.content = [result stringForColumn:@"content"];
            [self.dataArray addObject:model];
        }
        [self.tableView reloadData];
        
    }else {
        [SVProgressHUD showErrorWithStatus:@"数据异常请稍后再试"];
    }
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GGXXYYNewsCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLB.text = self.dataArray[indexPath.row].title;
    cell.contentLB.text = self.dataArray[indexPath.row].content;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end

