//
//  DetailPageViewController.h
//  OcTestProject
//
//  Created by X C on 2019/11/24.
//  Copyright © 2019 X C. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailPageViewController : UIViewController
@property NSString *receiveText;

- (void)setCallback:(NSString *)arg1 callback:(void (^)(NSString *arg1, NSString *arg2))callback;

@end

NS_ASSUME_NONNULL_END
