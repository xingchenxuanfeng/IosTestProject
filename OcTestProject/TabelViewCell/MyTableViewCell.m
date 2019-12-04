//
//  MyTableViewCell.m
//  OcTestProject
//
//  Created by X C on 2019/11/24.
//  Copyright © 2019 X C. All rights reserved.
//

#import "MyTableViewCell.h"
#import "MyModel.h"

@interface MyTableViewCell ()
@property(weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)bind:(id)data {
    _label.text = data;
}

- (void)bindData:(MyResult *)result {
    _label.text = [NSString stringWithFormat:
//            @"%li ,%@ ,%li ,%@", result.goodsID, result.productName, result.createTime, result.advanceFloatView.title]
            @",%@ ,%li ,%@", [result productName], result.createTime, result.advanceFloatView.title];
}
@end
