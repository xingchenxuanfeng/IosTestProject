
// MyModel.m

#import <NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "MyModel.h"

@implementation MyModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
//    return nil;
    return @{
            @"code": @"code",
            @"body": @"body",
            @"msg": @"msg"
    };
}

+ (NSValueTransformer *)bodyJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:MyBody.class];
//    return [MTLJSONAdapter dictionaryTransformerWithModelClass:MyBody.class];
}

@end

@implementation MyBody
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
//    return nil;
    return @{
            @"result": @"result",
            @"totalPage": @"totalPage",
            @"pageNo": @"pageNo"
    };
}

+ (NSValueTransformer *)resultJSONTransFormer {
    NSLog(@"resultJSONTransFormer");
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:MyResult.class];
//    return [MTLJSONAdapter arrayTransformerWithModelClass:MyResult.class];
}

@end

@implementation MyResult
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return nil;
//    return @{
//            @"goodsID": @"goodsID",
//            @"applyCount": @"applyCount",
//            @"advanceFloatView": @"advanceFloatView",
//            @"productName": @"productName",
//            @"applyID": @"applyID",
//            @"skuPropertyValue": @"skuPropertyValue",
//            @"buttonType": @"buttonType",
//            @"imageURL": @"imageURL",
//            @"goodsTypeStr": @"goodsTypeStr",
//            @"refundAmount": @"refundAmount",
//            @"unitPrice": @"unitPrice",
//            @"buyCount": @"buyCount",
//            @"orderItemID": @"orderItemID",
//            @"showAmount": @"showAmount",
//            @"applyStatusDesc": @"applyStatusDesc",
//            @"sort": @"sort",
//            @"itemPayAmount": @"itemPayAmount",
//            @"createTime": @"createTime",
//            @"redSpot": @"redSpot",
//            @"applyStatus": @"applyStatus"
//
//    };
}

+ (NSValueTransformer *)advanceFloatViewJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:MyAdvanceFloatView.class];
//    return [MTLJSONAdapter dictionaryTransformerWithModelClass:MyAdvanceFloatView.class];
}

@end

@implementation MyAdvanceFloatView
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
//    return nil;
    return @{
            @"buttonDesc": @"buttonDesc",
            @"refundFloatDesc": @"refundFloatDesc",
            @"title": @"title"
    };
}

@end
