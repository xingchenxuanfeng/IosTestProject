//
//  SecondTabViewController.m
//  OcTestProject
//
//  Created by X C on 2019/11/24.
//  Copyright © 2019 X C. All rights reserved.
//

#import "SecondTabViewController.h"
#import "DetailPageViewController.h"
#import "MyTableViewController.h"
#import "OcTestProject-Swift.h"

@interface SecondTabViewController ()
@property(weak, nonatomic) IBOutlet UILabel *label;
@property(weak, nonatomic) IBOutlet UIView *myContainerView;

@end

@implementation SecondTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MyTableViewController *tableViewController = [[MyTableViewController alloc] init];
    [self addChildViewController:tableViewController];
    [self.myContainerView addSubview:tableViewController.view];
    self.myContainerView.backgroundColor = UIColor.blueColor;
}

#pragma mark - Navigation

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"do segue SecondTabViewController");
}*/
- (IBAction)clickBtn:(id)sender {
    NSString *currentTimes = [SecondTabViewController getCurrentTimes];
    _label.text = currentTimes;

//    [self.navigationController pushViewController:DetailPageViewController.alloc.init animated:true];
    DetailPageViewController *listController = DetailPageViewController.alloc.init;

    listController.receiveText = @"sendText";

    [listController setCallback:@"test1111111" callback:^(NSString *arg1, NSString *arg2) {
        NSLog(@"1  %@,2  %@", arg1, arg2);
    }];

//    MySwiftClass test=[[MySwiftClass alloca]init];
    MySwiftViewController *test = [[MySwiftViewController alloc] init];
    NSString *swiftString = [test swiftTestWithArg:@"sssssssssssssss"];

    NSLog(@"swiftString hhhhhhhhhhh: %@", swiftString);
    [test gotoDetailPageWithController:self];

//    [self.navigationController pushViewController:listController animated:true];
}

+ (NSString *)getCurrentTimes {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];

    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];

    NSLog(@"currentTimeString =  %@", currentTimeString);
    return currentTimeString;
}

@end
