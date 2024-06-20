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

- (void)optInOutUsingCMP
{
    [TenjinSDK optInOutUsingCMP];
}

- (void)optOutGoogleDMA
{
    [TenjinSDK optOutGoogleDMA];
}

- (void)optInGoogleDMA
{
    [TenjinSDK optInGoogleDMA];
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

- (void)tradPlusImpressionFromJSON:(NSString *)jsonString
{
    [TenjinSDK tradPlusImpressionFromJSON:jsonString];
}

- (void)casImpressionFromJSON:(NSString *)jsonString
{
    [TenjinSDK casImpressionFromJSON:jsonString];
}

- (void)updatePostbackConversionValue:(int)conversionValue
{
    [TenjinSDK updatePostbackConversionValue:conversionValue];
}

- (void)updatePostbackConversionValue:(int)conversionValue coarseValue:(NSString *)coarseValue
{
    [TenjinSDK updatePostbackConversionValue:conversionValue coarseValue:coarseValue];
}

- (void)updatePostbackConversionValue:(int)conversionValue coarseValue:(NSString *)coarseValue lockWindow:(BOOL)lockWindow
{
    [TenjinSDK updatePostbackConversionValue:conversionValue coarseValue:coarseValue lockWindow:lockWindow];
}

- (void)setCustomerUserId:(NSString *)userId
{
    [TenjinSDK setCustomerUserId:userId];
}

- (NSString *)getCustomerUserId
{
    return [TenjinSDK getCustomerUserId];
}

- (void)setCacheEventSetting:(BOOL)setting
{
    [TenjinSDK setCacheEventSetting:setting];
}

- (NSString *)getAnalyticsInstallationId
{
    return [TenjinSDK getAnalyticsInstallationId];
}

- (void)setGoogleDMAParametersWithAdPersonalization:(BOOL)adPersonalization adUserData:(BOOL)adUserData
{
    [[TenjinSDK sharedInstance] setGoogleDMAParametersWithAdPersonalization:adPersonalization adUserData:adUserData];
}

@end