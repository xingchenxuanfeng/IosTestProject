//
//  DetailPageViewController.m
//  OcTestProject
//
//  Created by X C on 2019/11/24.
//  Copyright © 2019 X C. All rights reserved.
//

#import "DetailPageViewController.h"

@interface DetailPageViewController ()
@property(weak, nonatomic) IBOutlet UILabel *label;
@property(nonatomic, copy) void (^callback)(NSString *, NSString *);

@end

@implementation DetailPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"detail";
    NSLog(@"sendText%@", self.receiveText);
}

- (IBAction)btnClick:(id)sender {
//    [self.navigationController pushViewController:DetailPageViewController.alloc.init animated:true];
    [self.navigationController popViewControllerAnimated:true];
    self.callback(@"aaaa1", @"a2222");
}

- (void)setCallback:(NSString *)arg1 callback:(void (^)(NSString *arg1, NSString *arg2))callback {
    NSLog(arg1);
    self.callback = callback;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"do segue");

}*/

@end
