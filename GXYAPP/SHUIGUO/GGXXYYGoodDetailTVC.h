//
//  GGXXYYGoodDetailTVC.h
//  SUNWENTAOAPP
//
//  Created by GGXXYY on 2018/12/13.
//  Copyright © 2018年 张坤. All rights reserved.
//

#import "BaseTableViewController.h"
#import "GGXXYYHomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GGXXYYGoodDetailTVC : BaseTableViewController
@property(nonatomic,strong)GGXXYYHomeModel *model;
/**  */
@property(nonatomic , assign)NSInteger  index;
@end

NS_ASSUME_NONNULL_END
