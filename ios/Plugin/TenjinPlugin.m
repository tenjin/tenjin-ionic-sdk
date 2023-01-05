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
)
