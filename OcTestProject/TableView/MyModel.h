// MyModel.h

// To parse this JSON:
//
//   NSError *error;
//   MyModel *model = [MyModel fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class MyModel;
@class MyBody;
@class MyResult;
@class MyAdvanceFloatView;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface MyModel : NSObject
@property(nonatomic, strong) MyBody *body;
@property(nonatomic, assign) NSInteger code;
@property(nonatomic, copy) NSString *msg;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;

- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface MyBody : NSObject
@property(nonatomic, copy) NSArray<MyResult *> *result;
@property(nonatomic, assign) NSInteger totalPage;
@property(nonatomic, assign) NSInteger pageNo;
@end

@interface MyResult : NSObject
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

@interface MyAdvanceFloatView : NSObject
@property(nonatomic, copy) NSString *buttonDesc;
@property(nonatomic, copy) NSString *refundFloatDesc;
@property(nonatomic, copy) NSString *title;
@end


#pragma mark - Private model interfaces

@interface MyModel (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;

- (NSDictionary *)JSONDictionary;
@end

@interface MyBody (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;

- (NSDictionary *)JSONDictionary;
@end

@interface MyResult (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;

- (NSDictionary *)JSONDictionary;
@end

@interface MyAdvanceFloatView (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;

- (NSDictionary *)JSONDictionary;
@end

NS_ASSUME_NONNULL_END
