
// MyModel.m

#import <NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "MyModel.h"

@implementation MyModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return nil;
}

+ (NSValueTransformer *)bodyJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:MyBody.class];
//    return [MTLJSONAdapter dictionaryTransformerWithModelClass:MyBody.class];
}

@end

@implementation MyBody
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return nil;
}

+ (NSValueTransformer *)resultJSONTransformer {
    NSLog(@"1111111111111");
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:MyResult.class];
//    return [MTLJSONAdapter arrayTransformerWithModelClass:MyResult.class];
}

@end

@implementation MyResult
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return nil;
}

+ (NSValueTransformer *)advanceFloatViewJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:MyAdvanceFloatView.class];
//    return [MTLJSONAdapter dictionaryTransformerWithModelClass:MyAdvanceFloatView.class];
}

@end

@implementation MyAdvanceFloatView
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return nil;
}

@end
