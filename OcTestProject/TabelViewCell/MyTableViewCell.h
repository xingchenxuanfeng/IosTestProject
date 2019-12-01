//
//  MyTableViewCell.h
//  OcTestProject
//
//  Created by X C on 2019/11/24.
//  Copyright © 2019 X C. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyResult;

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell
- (void)bind:(id)data;

- (void)bindData:(MyResult *)result;
@end

NS_ASSUME_NONNULL_END
