package com.tenjin.plugins.capacitor;

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
    }

    @PluginMethod
    public void connect(PluginCall call) {
        implementation.connect();
    }

    @PluginMethod
    public void optIn(PluginCall call) {
        implementation.optIn();
    }

    @PluginMethod
    public void optOut(PluginCall call) {
        implementation.optOut();
    }

    @PluginMethod
    public void optInParams(PluginCall call) {
        try {
            String[] params = (String[]) call.getArray("params").toList().toArray();
            implementation.optIn(params);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    @PluginMethod
    public void optOutParams(PluginCall call) {
        try {
            String[] params = (String[]) call.getArray("params").toList().toArray();
            implementation.optOut(params);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    @PluginMethod
    public void transaction(PluginCall call) {
        implementation.transaction(
                call.getString("productName"),
                call.getString("currencyCode"),
                call.getInt("quantity"),
                call.getDouble("unitPrice")
        );
    }

    @PluginMethod
    public void eventWithName(PluginCall call) {
        implementation.eventWithName(call.getString("name"));
    }

    @PluginMethod
    public void eventWithNameAndValue(PluginCall call) {
        implementation.eventWithNameAndValue(call.getString("name"), call.getString("value"));
    }

    @PluginMethod
    public void appendAppSubversion(PluginCall call) {
        implementation.appendAppSubversion(call.getInt("version"));
    }

    @PluginMethod
    public void getAttributionInfo(PluginCall call) {
        implementation.getAttributionInfo(data -> {
            try {
                JSObject attributionInfo = JSObject.fromJSONObject(new JSONObject(data));
                call.resolve(attributionInfo);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        });
    }

    @PluginMethod
    public void eventAdImpressionAdMob(PluginCall call) {
        implementation.eventAdImpressionAdMob(call.getObject("json"));
    }

    @PluginMethod
    public void eventAdImpressionAppLovin(PluginCall call) {
        implementation.eventAdImpressionAppLovin(call.getObject("json"));
    }

    @PluginMethod
    public void eventAdImpressionHyperBid(PluginCall call) {
        implementation.eventAdImpressionHyperBid(call.getObject("json"));
    }

    @PluginMethod
    public void eventAdImpressionIronSource(PluginCall call) {
        implementation.eventAdImpressionIronSource(call.getObject("json"));
    }

    @PluginMethod
    public void eventAdImpressionTopOn(PluginCall call) {
        implementation.eventAdImpressionTopOn(call.getObject("json"));
    }
}
