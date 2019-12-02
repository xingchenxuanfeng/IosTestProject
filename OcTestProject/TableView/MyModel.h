// MyModel.h

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@class MyModel;
@class MyBody;
@class MyResult;
@class MyAdvanceFloatView;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface MyModel : MTLModel <MTLJSONSerializing>
@property(nonatomic, strong) MyBody *body;
@property(nonatomic, assign) NSInteger code;
@property(nonatomic, copy) NSString *msg;
@end

@interface MyBody : MTLModel <MTLJSONSerializing>
@property(nonatomic, strong) NSArray<MyResult *> *result;
@property(nonatomic, assign) NSInteger totalPage;
@property(nonatomic, assign) NSInteger pageNo;
@end

@interface MyResult : MTLModel <MTLJSONSerializing>
@property(nonatomic, assign) NSInteger goodsID;
@property(nonatomic, assign) NSInteger applyCount;
@property(nonatomic, nullable, strong) MyAdvanceFloatView *advanceFloatView;
@property(nonatomic, copy) NSString *productName;
@property(nonatomic, copy) NSString *applyID;
@property(nonatomic, copy) NSArray *skuPropertyValue;
@property(nonatomic, assign) NSInteger buttonType;
@property(nonatomic, copy) NSString *imageURL;
@property(nonatomic, copy) NSString *goodsTypeStr;
@property(nonatomic, assign) double refundAmount;
@property(nonatomic, assign) double unitPrice;
@property(nonatomic, assign) NSInteger buyCount;
@property(nonatomic, copy) NSString *orderItemID;
@property(nonatomic, assign) NSInteger showAmount;
@property(nonatomic, copy) NSString *applyStatusDesc;
@property(nonatomic, assign) NSInteger sort;
@property(nonatomic, assign) double itemPayAmount;
@property(nonatomic, assign) NSInteger createTime;
@property(nonatomic, assign) NSInteger redSpot;
@property(nonatomic, assign) NSInteger applyStatus;
@end

@interface MyAdvanceFloatView : MTLModel <MTLJSONSerializing>
@property(nonatomic, copy) NSString *buttonDesc;
@property(nonatomic, copy) NSString *refundFloatDesc;
@property(nonatomic, copy) NSString *title;
@end

NS_ASSUME_NONNULL_END
