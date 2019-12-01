
// MyModel.m

#import "MyModel.h"

// Shorthand for simple blocks
#define λ(decl, expr) (^(decl) { return (expr); })

// nil → NSNull conversion for JSON dictionaries
static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

static id map(id collection, id (^f)(id value)) {
    id result = nil;
    if ([collection isKindOfClass:NSArray.class]) {
        result = [NSMutableArray arrayWithCapacity:[collection count]];
        for (id x in collection) [result addObject:f(x)];
    } else if ([collection isKindOfClass:NSDictionary.class]) {
        result = [NSMutableDictionary dictionaryWithCapacity:[collection count]];
        for (id key in collection) [result setObject:f([collection objectForKey:key]) forKey:key];
    }
    return result;
}

#pragma mark - JSON serialization

MyModel *_Nullable MyModelFromData(NSData *data, NSError **error) {
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [MyModel fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{@"exception": exception}];
        return nil;
    }
}

MyModel *_Nullable MyModelFromJSON(NSString *json, NSStringEncoding encoding, NSError **error) {
    return MyModelFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable MyModelToData(MyModel *model, NSError **error) {
    @try {
        id json = [model JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{@"exception": exception}];
        return nil;
    }
}

NSString *_Nullable MyModelToJSON(MyModel *model, NSStringEncoding encoding, NSError **error) {
    NSData *data = MyModelToData(model, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation MyModel
+ (NSDictionary<NSString *, NSString *> *)properties {
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
            @"body": @"body",
            @"code": @"code",
            @"msg": @"msg",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error {
    return MyModelFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error {
    return MyModelFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict {
    return dict ? [[MyModel alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _body = [MyBody fromJSONDictionary:(id) _body];
    }
    return self;
}

- (NSDictionary *)JSONDictionary {
    id dict = [[self dictionaryWithValuesForKeys:MyModel.properties.allValues] mutableCopy];

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
            @"body": [_body JSONDictionary],
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error {
    return MyModelToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error {
    return MyModelToJSON(self, encoding, error);
}
@end

@implementation MyBody
+ (NSDictionary<NSString *, NSString *> *)properties {
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
            @"result": @"result",
            @"totalPage": @"totalPage",
            @"pageNo": @"pageNo",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict {
    return dict ? [[MyBody alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _result = map(_result, λ(id x, [MyResult fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary {
    id dict = [[self dictionaryWithValuesForKeys:MyBody.properties.allValues] mutableCopy];

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
            @"result": map(_result, λ(id x, [x JSONDictionary])),
    }];

    return dict;
}
@end

@implementation MyResult
+ (NSDictionary<NSString *, NSString *> *)properties {
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
            @"goodsId": @"goodsID",
            @"applyCount": @"applyCount",
            @"advanceFloatView": @"advanceFloatView",
            @"productName": @"productName",
            @"applyId": @"applyID",
            @"skuPropertyValue": @"skuPropertyValue",
            @"buttonType": @"buttonType",
            @"imageUrl": @"imageURL",
            @"goodsTypeStr": @"goodsTypeStr",
            @"refundAmount": @"refundAmount",
            @"unitPrice": @"unitPrice",
            @"buyCount": @"buyCount",
            @"orderItemId": @"orderItemID",
            @"showAmount": @"showAmount",
            @"applyStatusDesc": @"applyStatusDesc",
            @"sort": @"sort",
            @"itemPayAmount": @"itemPayAmount",
            @"createTime": @"createTime",
            @"redSpot": @"redSpot",
            @"applyStatus": @"applyStatus",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict {
    return dict ? [[MyResult alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _advanceFloatView = [MyAdvanceFloatView fromJSONDictionary:(id) _advanceFloatView];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key {
    id resolved = MyResult.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary {
    id dict = [[self dictionaryWithValuesForKeys:MyResult.properties.allValues] mutableCopy];

    // Rewrite property names that differ in JSON
    for (id jsonName in MyResult.properties) {
        id propertyName = MyResult.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    // Map values that need translation
    [dict addEntriesFromDictionary:@{
            @"advanceFloatView": NSNullify([_advanceFloatView JSONDictionary]),
    }];

    return dict;
}
@end

@implementation MyAdvanceFloatView
+ (NSDictionary<NSString *, NSString *> *)properties {
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
            @"buttonDesc": @"buttonDesc",
            @"refundFloatDesc": @"refundFloatDesc",
            @"title": @"title",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict {
    return dict ? [[MyAdvanceFloatView alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary {
    return [self dictionaryWithValuesForKeys:MyAdvanceFloatView.properties.allValues];
}
@end

NS_ASSUME_NONNULL_END
