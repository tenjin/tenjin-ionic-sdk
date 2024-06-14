//
//  TenjinImpl.h
//  Plugin
//

#import <Foundation/Foundation.h>

@interface TenjinImplementation : NSObject

- (void)initialize:(NSString *)sdkKey;
- (void)connect;
- (void)optIn;
- (void)optOut;
- (void)optInParams:(NSArray *)params;
- (void)optOutParams:(NSArray *)params;
- (void)optInOutUsingCMP;
- (void)optOutGoogleDMA;
- (void)optInGoogleDMA;
- (void)transactionWithProductName:(NSString *)productName
                   andCurrencyCode:(NSString *)currencyCode
                       andQuantity:(NSInteger)quantity
                      andUnitPrice:(NSDecimalNumber *)price;
- (void)sendEventWithName:(NSString *)eventName;
- (void)sendEventWithName:(NSString *)eventName
            andEventValue:(NSString *)eventValue;
- (void)appendAppSubversion:(NSNumber *)subversion;
- (void)getAttributionInfo:(void (^)(NSDictionary *attributionInfo, NSError *error))completionHandler;
- (void)adMobImpressionFromJSON:(NSString *)jsonString;
- (void)appLovinImpressionFromJSON:(NSString *)jsonString;
- (void)hyperBidImpressionFromJSON:(NSString *)jsonString;
- (void)ironSourceImpressionFromJSON:(NSString *)jsonString;
- (void)topOnImpressionFromJSON:(NSString *)jsonString;
- (void)tradPlusImpressionFromJSON:(NSString *)jsonString;
- (void)casImpressionFromJSON:(NSString *)jsonString;
- (void)updatePostbackConversionValue:(int)conversionValue;
- (void)updatePostbackConversionValue:(int)conversionValue
                          coarseValue:(NSString *)coarseValue;
- (void)updatePostbackConversionValue:(int)conversionValue
                          coarseValue:(NSString *)coarseValue
                           lockWindow:(BOOL)lockWindow;
- (void)setCustomerUserId:(NSString *)userId;
- (NSString *)getCustomerUserId;
- (void)setCacheEventSetting:(BOOL)setting;
- (NSString *)getAnalyticsInstallationId;
- (void)setGoogleDMAParametersWithAdPersonalization:(BOOL)adPersonalization adUserData:(BOOL)adUserData;

@end
