package com.tenjin.plugins.capacitor;
import android.content.Context;

import com.tenjin.android.AttributionInfoCallback;
import com.tenjin.android.TenjinSDK;

import org.json.JSONObject;

public class Tenjin {

    public TenjinSDK instance = null;

    public void initialize(Context context, String sdkKey) {
        instance = TenjinSDK.getInstance(context, sdkKey);
    }

    public void connect() {
        instance.connect();
    }

    public void optIn() {
        instance.optIn();
    }

    public void optOut() {
        instance.optOut();
    }

    public void optIn(String[] params) {
        instance.optInParams(params);
    }

    public void optOut(String[] params) {
        instance.optOutParams(params);
    }

    public void optInOutUsingCMP() {
        instance.optInOutUsingCMP();
    }

    public void optOutGoogleDMA() {
        instance.optOutGoogleDMA();
    }

    public void optInGoogleDMA() {
        instance.optInGoogleDMA();
    }

    public void transaction(String productName, String currencyCode, Integer quantity, Double unitPrice) {
        instance.transaction(productName, currencyCode, quantity, unitPrice);
    }

    public void eventWithName(String name) {
        instance.eventWithName(name);
    }

    public void eventWithNameAndValue(String name, String value) {
        instance.eventWithNameAndValue(name, value);
    }

    public void appendAppSubversion(Integer version) {
        instance.appendAppSubversion(version);
    }

    public void getAttributionInfo(final AttributionInfoCallback callback) {
        instance.getAttributionInfo(data -> {
            callback.onSuccess(data);
        });
    }

    public void eventAdImpressionAdMob(JSONObject json) {
        instance.eventAdImpressionAdMob(json);
    }

    public void eventAdImpressionAppLovin(JSONObject json) {
        instance.eventAdImpressionAppLovin(json);
    }

    public void eventAdImpressionHyperBid(JSONObject json) {
        instance.eventAdImpressionHyperBid(json);
    }

    public void eventAdImpressionIronSource(JSONObject json) {
        instance.eventAdImpressionIronSource(json);
    }

    public void eventAdImpressionTopOn(JSONObject json) {
        instance.eventAdImpressionTopOn(json);
    }

    public void eventAdImpressionTradPlus(JSONObject json) {
        instance.eventAdImpressionTradPlus(json);
    }

    public void eventAdImpressionCAS(JSONObject json) {
        instance.eventAdImpressionCAS(json);
    }

    public void setCacheEventSetting(Boolean setting) {
        instance.setCacheEventSetting(setting);
    }

    public void setEncryptRequestsSetting(Boolean setting) {
        instance.setEncryptRequestsSetting(setting);
    }

    public void setCustomerUserId(String userId) {
        instance.setCustomerUserId(userId);
    }

    public String getCustomerUserId() {
        return instance.getCustomerUserId();
    }

    public String getAnalyticsInstallationId() {
        return instance.getAnalyticsInstallationId();
    }

    public void setGoogleDMAParameters(boolean adPersonalization, boolean adUserData) {
        instance.setGoogleDMAParameters(adPersonalization, adUserData);
    }
}
