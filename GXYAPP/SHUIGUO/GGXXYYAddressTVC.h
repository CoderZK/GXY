//
//  GGXXYYAddressTVC.h
//  SUNWENTAOAPP
//
//  Created by kunzhang on 2018/12/12.
//  Copyright © 2018年 张坤. All rights reserved.
//

#import "BaseTableViewController.h"
#import "GGXXYYHomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GGXXYYAddressTVC : BaseTableViewController
/**  */
@property(nonatomic , copy)void(^sendAddressBlock)(GGXXYYHomeModel *model);
@end

NS_ASSUME_NONNULL_END
