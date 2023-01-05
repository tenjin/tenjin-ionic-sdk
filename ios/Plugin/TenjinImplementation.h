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
- (void)appendAppSubversion:(NSNumber *)subversion;
- (void)transactionWithProductName:(NSString *)productName
                   andCurrencyCode:(NSString *)currencyCode
                       andQuantity:(NSInteger)quantity
                      andUnitPrice:(NSDecimalNumber *)price;
- (void)sendEventWithName:(NSString *)eventName;
- (void)sendEventWithName:(NSString *)eventName
            andEventValue:(NSString *)eventValue;
- (void)getAttributionInfo:(void (^)(NSDictionary *attributionInfo, NSError *error))completionHandler;
- (void)topOnImpressionFromJSON:(NSString *)jsonString;
- (void)appLovinImpressionFromJSON:(NSString *)jsonString;
- (void)hyperBidImpressionFromJSON:(NSString *)jsonString;
- (void)adMobImpressionFromJSON:(NSString *)jsonString;
- (void)ironSourceImpressionFromJSON:(NSString *)jsonString;

@end

