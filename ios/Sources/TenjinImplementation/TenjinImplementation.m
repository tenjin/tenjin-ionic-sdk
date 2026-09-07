//
//  TenjinImpl.m
//  Plugin
//

#import "TenjinImplementation.h"
#if __has_include(<TenjinSDK/TenjinSDK.h>)
#import <TenjinSDK/TenjinSDK.h>
@interface TenjinSDK (IonicCapacitorTenjinILRD)
+ (void)adMobImpressionFromJSON:(NSString *)jsonString;
+ (void)appLovinImpressionFromJSON:(NSString *)jsonString;
+ (void)hyperBidImpressionFromJSON:(NSString *)jsonString;
+ (void)ironSourceImpressionFromJSON:(NSString *)jsonString;
+ (void)topOnImpressionFromJSON:(NSString *)jsonString;
+ (void)tradPlusImpressionFromJSON:(NSString *)jsonString;
+ (void)casImpressionFromJSON:(NSString *)jsonString;
@end
#else
#import "TenjinSDK.h"
#endif

@implementation TenjinImplementation

// Reported to Tenjin as plugin_version. Updated by release-please; do not edit by hand.
// x-release-please-start-version
static NSString *const kTenjinIonicPluginVersion = @"2.1.0";
// x-release-please-end

- (void)initialize:(NSString *)sdkKey
{
    // set before initialize so the first connect carries it
    [TenjinSDK setPluginVersion:@"ionic" version:kTenjinIonicPluginVersion];
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

- (void)handleOpenUrl:(NSString *)url
{
    [TenjinSDK handleOpenURLString:url];
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

- (void)setEncryptRequestsSetting:(BOOL)setting
{
    [TenjinSDK setEncryptRequestsSetting:setting];
}

- (NSString *)getAnalyticsInstallationId
{
    return [TenjinSDK getAnalyticsInstallationId];
}

- (void)setGoogleDMAParametersWithAdPersonalization:(BOOL)adPersonalization adUserData:(BOOL)adUserData
{
    [[TenjinSDK sharedInstance] setGoogleDMAParametersWithAdPersonalization:adPersonalization adUserData:adUserData];
}

- (NSDictionary *)getUserProfileAsDictionary
{
    return [TenjinSDK getUserProfileAsDictionary];
}

- (void)resetUserProfile
{
    [TenjinSDK resetUserProfile];
}

@end