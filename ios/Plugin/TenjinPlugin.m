#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(TenjinPlugin, "Tenjin",
           CAP_PLUGIN_METHOD(initialize, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(connect, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(optIn, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(optOut, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(optInParams, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(optOutParams, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(optInOutUsingCMP, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(optOutGoogleDMA, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(optInGoogleDMA, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(transaction, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(eventWithName, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(eventWithNameAndValue, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(appendAppSubversion, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getAttributionInfo, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(eventAdImpressionAdMob, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(eventAdImpressionAppLovin, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(eventAdImpressionHyperBid, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(eventAdImpressionIronSource, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(eventAdImpressionTopOn, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(eventAdImpressionTradPlus, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(eventAdImpressionCAS, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(updatePostbackConversionValue, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(updatePostbackConversionValueCoarseValue, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(updatePostbackConversionValueCoarseValueLockWindow, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setCustomerUserId, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getCustomerUserId, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setCacheEventSetting, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setEncryptRequestsSetting, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getAnalyticsInstallationId, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setGoogleDMAParameters, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getUserProfileDictionary, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(resetUserProfile, CAPPluginReturnPromise);
)
