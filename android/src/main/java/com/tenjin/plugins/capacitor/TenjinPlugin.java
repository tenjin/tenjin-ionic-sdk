package com.tenjin.plugins.capacitor;

import android.util.Log;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

import org.json.JSONException;
import org.json.JSONObject;

@CapacitorPlugin(name = "Tenjin")
public class TenjinPlugin extends Plugin {

    private Tenjin implementation = new Tenjin();

    @PluginMethod
    public void initialize(PluginCall call) {
        implementation.initialize(getContext(), call.getString("sdkKey"));
        call.resolve();
    }

    @PluginMethod
    public void connect(PluginCall call) {
        implementation.connect();
        call.resolve();
    }

    @PluginMethod
    public void optIn(PluginCall call) {
        implementation.optIn();
        call.resolve();
    }

    @PluginMethod
    public void optOut(PluginCall call) {
        implementation.optOut();
        call.resolve();
    }

    @PluginMethod
    public void optInParams(PluginCall call) {
        try {
            String[] params = (String[]) call.getArray("params").toList().toArray();
            implementation.optIn(params);
            call.resolve();
        } catch (JSONException e) {
            e.printStackTrace();
            call.reject(e.getLocalizedMessage());
        }
    }

    @PluginMethod
    public void optOutParams(PluginCall call) {
        try {
            String[] params = (String[]) call.getArray("params").toList().toArray();
            implementation.optOut(params);
            call.resolve();
        } catch (JSONException e) {
            e.printStackTrace();
            call.reject(e.getLocalizedMessage());
        }
    }

    @PluginMethod
    public void optInOutUsingCMP(PluginCall call) {
        implementation.optInOutUsingCMP();
        call.resolve();
    }

    @PluginMethod
    public void optOutGoogleDMA(PluginCall call) {
        implementation.optOutGoogleDMA();
        call.resolve();
    }

    @PluginMethod
    public void optInGoogleDMA(PluginCall call) {
        implementation.optInGoogleDMA();
        call.resolve();
    }

    @PluginMethod
    public void transaction(PluginCall call) {
        implementation.transaction(
                call.getString("productName"),
                call.getString("currencyCode"),
                call.getInt("quantity"),
                call.getDouble("unitPrice")
        );
        call.resolve();
    }

    @PluginMethod
    public void eventWithName(PluginCall call) {
        implementation.eventWithName(call.getString("name"));
        call.resolve();
    }

    @PluginMethod
    public void eventWithNameAndValue(PluginCall call) {
        implementation.eventWithNameAndValue(call.getString("name"), call.getString("value"));
        call.resolve();
    }

    @PluginMethod
    public void appendAppSubversion(PluginCall call) {
        implementation.appendAppSubversion(call.getInt("version"));
        call.resolve();
    }

    @PluginMethod
    public void getAttributionInfo(PluginCall call) {
        implementation.getAttributionInfo(data -> {
            try {
                JSObject attributionInfo = JSObject.fromJSONObject(new JSONObject(data));
                call.resolve(attributionInfo);
            } catch (JSONException e) {
                e.printStackTrace();
                call.reject(e.getLocalizedMessage());
            }
        });
    }

    @PluginMethod
    public void eventAdImpressionAdMob(PluginCall call) {
        implementation.eventAdImpressionAdMob(call.getObject("json"));
        call.resolve();
    }

    @PluginMethod
    public void eventAdImpressionAppLovin(PluginCall call) {
        implementation.eventAdImpressionAppLovin(call.getObject("json"));
        call.resolve();
    }

    @PluginMethod
    public void eventAdImpressionHyperBid(PluginCall call) {
        implementation.eventAdImpressionHyperBid(call.getObject("json"));
        call.resolve();
    }

    @PluginMethod
    public void eventAdImpressionIronSource(PluginCall call) {
        implementation.eventAdImpressionIronSource(call.getObject("json"));
        call.resolve();
    }

    @PluginMethod
    public void eventAdImpressionTopOn(PluginCall call) {
        implementation.eventAdImpressionTopOn(call.getObject("json"));
        call.resolve();
    }

    @PluginMethod
    public void eventAdImpressionTradPlus(PluginCall call) {
        implementation.eventAdImpressionTradPlus(call.getObject("json"));
        call.resolve();
    }

    @PluginMethod
    public void eventAdImpressionCAS(PluginCall call) {
        implementation.eventAdImpressionCAS(call.getObject("json"));
        call.resolve();
    }

    @PluginMethod
    public void setCacheEventSetting(PluginCall call) {
        implementation.setCacheEventSetting(call.getBoolean("setting"));
        call.resolve();
    }

    @PluginMethod
    public void setEncryptRequestsSetting(PluginCall call) {
        implementation.setEncryptRequestsSetting(call.getBoolean("setting"));
        call.resolve();
    }

    @PluginMethod
    public void setCustomerUserId(PluginCall call) {
        implementation.setCustomerUserId(call.getString("userId"));
        call.resolve();
    }

    @PluginMethod
    public void getCustomerUserId(PluginCall call) {
        JSObject data = new JSObject();
        data.put("userId", implementation.getCustomerUserId());
        call.resolve(data);
    }

    @PluginMethod
    public void getAnalyticsInstallationId(PluginCall call) {
        JSObject data = new JSObject();
        data.put("installationId", implementation.getAnalyticsInstallationId());
        call.resolve(data);
    }

    @PluginMethod
    public void setGoogleDMAParameters(PluginCall call) {
        boolean adPersonalization = call.getBoolean("adPersonalization", true);
        boolean adUserData = call.getBoolean("adUserData", true);
        implementation.setGoogleDMAParameters(adPersonalization, adUserData);
        call.resolve();
    }

    @PluginMethod
    public void updatePostbackConversionValue(PluginCall call) {
        Log.d("TENJIN", "Method not available on Android");
        call.resolve();
    }

    @PluginMethod
    public void updatePostbackConversionValueCoarseValue(PluginCall call) {
        Log.d("TENJIN", "Method not available on Android");
        call.resolve();
    }

    @PluginMethod
    public void updatePostbackConversionValueCoarseValueLockWindow(PluginCall call) {
        Log.d("TENJIN", "Method not available on Android");
        call.resolve();
    }
}
