//
//  TenjinImpl.m
//  Plugin
//

#import "TenjinImplementation.h"
#import "TenjinSDK.h"

@implementation TenjinImplementation

- (void)initialize:(NSString *)sdkKey
{
    [TenjinSDK initialize:sdkKey];
}

- (void)connect
{
    [TenjinSDK connect];
}

- (void)optIn
{
    [TenjinSDK optIn];
}

- (void)optOut
{
    [TenjinSDK optOut];
}

- (void)optInParams:(NSArray *)params
{
    [TenjinSDK optInParams:params];
}

- (void)optOutParams:(NSArray *)params
{
    [TenjinSDK optOutParams:params];
}

- (void)transactionWithProductName:(NSString *)productName andCurrencyCode:(NSString *)currencyCode andQuantity:(NSInteger)quantity andUnitPrice:(NSDecimalNumber *)price
{
    [TenjinSDK transactionWithProductName:productName andCurrencyCode:currencyCode andQuantity:quantity andUnitPrice:price];
}

- (void)sendEventWithName:(NSString *)eventName
{
    [TenjinSDK sendEventWithName:eventName];
}

- (void)sendEventWithName:(NSString *)eventName andEventValue:(NSString *)eventValue
{
    [TenjinSDK sendEventWithName:eventName andEventValue:eventValue];
}

- (void)appendAppSubversion:(NSNumber *)subversion
{
    [TenjinSDK appendAppSubversion:subversion];
}

- (void)getAttributionInfo:(void (^)(NSDictionary *, NSError *))completionHandler
{
    [[TenjinSDK sharedInstance] getAttributionInfo:completionHandler];
}

- (void)adMobImpressionFromJSON:(NSString *)jsonString
{
    [TenjinSDK adMobImpressionFromJSON:jsonString];
}

- (void)appLovinImpressionFromJSON:(NSString *)jsonString
{
    [TenjinSDK appLovinImpressionFromJSON:jsonString];
}

- (void)hyperBidImpressionFromJSON:(NSString *)jsonString
{
    [TenjinSDK hyperBidImpressionFromJSON:jsonString];
}

- (void)ironSourceImpressionFromJSON:(NSString *)jsonString
{
    [TenjinSDK ironSourceImpressionFromJSON:jsonString];
}

- (void)topOnImpressionFromJSON:(NSString *)jsonString
{
    [TenjinSDK topOnImpressionFromJSON:jsonString];
}

@end

