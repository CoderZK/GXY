//
//  FYHomeVC.h
//  GXYAPP
//
//  Created by FY on 2019/2/27.
//  Copyright © 2019年 张坤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FYHomeVC : UIViewController
- (void)getMessage:(NSString *)str;
@property (nonatomic,strong) UIWebView * webView;
@end

NS_ASSUME_NONNULL_END
