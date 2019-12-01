//
//  MyTableViewController.m
//  OcTestProject
//
//  Created by X C on 2019/11/24.
//  Copyright © 2019 X C. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <Mantle/MTLJSONAdapter.h>
#import "MyTableViewController.h"
#import "MyTableViewCell.h"
#import "MyModel.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController
MyModel *model;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self.tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellType1"];

    self.initData;
}

- (void)initData {
    NSLog(@"test1");
    NSString *url = @"http://gw.kaola.com//gw/aftersale/user/refunds";
    NSDictionary *dictionary = @{@"testKey1": @"testValue1", @"testKey2": @"testValue2"};
    AFHTTPSessionManager *manager = AFHTTPSessionManager.manager;
    manager.requestSerializer = AFJSONRequestSerializer.serializer;

//    manager.responseSerializer = AFHTTPResponseSerializer.serializer;
    manager.responseSerializer = AFJSONResponseSerializer.serializer;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    NSURLSessionDataTask *task = [manager GET:url
                                   parameters:dictionary
                                     progress:^(NSProgress *downloadProgress) {
                                         NSLog(@"test progress %@", downloadProgress);
                                     }
                                      success:^(NSURLSessionDataTask *task, id responseObject) {
                                          NSLog(@"test task %@", task);
//                                          NSLog(@"test responseObject %@", responseObject);
//                                          [MTLJSONAdapter modelOfClass:NSObject.class fromJSONDictionary:responseObject error:nil];
                                          model = [MyModel fromJSONDictionary:responseObject];
                                          NSLog(@"responseObject %@", model);

                                      }
                                      failure:^(NSURLSessionDataTask *task, NSError *error) {
                                          NSLog(@"test task %@", task);
                                          NSLog(@"test error %@", error);
                                      }];
    [task resume];
    NSLog(@"test2");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    } else {
        return model.body.result.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellType1" forIndexPath:indexPath];
    [cell bind:[NSString stringWithFormat:@"test %li %li", indexPath.section, indexPath.row]];
    // Configure the cell...
    if (indexPath.section == 0) {
        return cell;
    }
    NSArray<MyResult *> *array = model.body.result;
    MyResult *curModel = array[(NSUInteger) indexPath.row];
    [cell bindData:curModel];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"Nib name" bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
