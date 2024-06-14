import Foundation
import Capacitor

@objc(TenjinPlugin)
public class TenjinPlugin: CAPPlugin {
    private let implementation = TenjinImplementation()
    
    @objc func initialize(_ call: CAPPluginCall) {
        guard let sdkKey = call.getString("sdkKey") else {
            call.reject("Failed to get apiKey from call")
            return
        }
        implementation.initialize(sdkKey)
        call.resolve()
    }
    
    @objc func connect(_ call: CAPPluginCall) {
        implementation.connect()
        call.resolve()
    }
    
    @objc func optIn(_ call: CAPPluginCall) {
        implementation.optIn()
        call.resolve()
    }

    @objc func optOut(_ call: CAPPluginCall) {
        implementation.optOut()
        call.resolve()
    }

    @objc func optInParams(_ call: CAPPluginCall) {
        guard let data = call.getAny("params"), let params = data as? [Any] else {
            call.reject("Failed to get params from call")
            return
        }
        implementation.opt(inParams: params)
        call.resolve()
    }

    @objc func optOutParams(_ call: CAPPluginCall) {
        guard let data = call.getAny("params"), let params = data as? [Any] else {
            call.reject("Failed to get params from call")
            return
        }
        implementation.optOutParams(params)
        call.resolve()
    }

    @objc func optInOutUsingCMP(_ call: CAPPluginCall) {
        implementation.optInOutUsingCMP()
        call.resolve()
    }

    @objc func optOutGoogleDMA(_ call: CAPPluginCall) {
        implementation.optOutGoogleDMA()
        call.resolve()
    }

    @objc func optInGoogleDMA(_ call: CAPPluginCall) {
        implementation.optInGoogleDMA()
        call.resolve()
    }

    @objc func transaction(_ call: CAPPluginCall) {
        guard let productName = call.getString("productName"),
              let currencyCode = call.getString("currencyCode"),
              let quantity = call.getInt("quantity"),
              let unitPrice = call.getDouble("unitPrice") as? NSDecimalNumber else {
            call.reject("Failed to get transaction from call")
            return
        }
        implementation.transaction(withProductName: productName, andCurrencyCode: currencyCode, andQuantity: quantity, andUnitPrice: unitPrice)
        call.resolve()
    }

    @objc func eventWithName(_ call: CAPPluginCall) {
        guard let name = call.getString("name") else {
            call.reject("Failed to get name from call")
            return
        }
        implementation.sendEvent(withName: name)
        call.resolve()
    }

    @objc func eventWithNameAndValue(_ call: CAPPluginCall) {
        guard let name = call.getString("name"), let value = call.getString("value") else {
            call.reject("Failed to get name or value from call")
            return
        }
        implementation.sendEvent(withName: name, andEventValue: value)
        call.resolve()
    }

    @objc func appendAppSubversion(_ call: CAPPluginCall) {
        guard let version = call.getInt("version") else {
            call.reject("Failed to get version from call")
            return
        }
        implementation.appendAppSubversion(version as NSNumber)
        call.resolve()
    }

    @objc func getAttributionInfo(_ call: CAPPluginCall) {
        implementation.getAttributionInfo { data, error in
            if let data = data as? [String: Any] {
                call.resolve(data)
            } else {
                call.reject(error?.localizedDescription ?? "Error getting attribution info")
            }
        }
    }

    @objc func eventAdImpressionAdMob(_ call: CAPPluginCall) {
        guard let json = call.getAny("json") else {
            call.reject("Failed to get json from call")
            return
        }
        do {
            let data =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            let convertedString = String(data: data, encoding: .utf8)
            implementation.adMobImpression(fromJSON: convertedString)
            call.resolve()
        } catch let error {
            print(error.localizedDescription)
            call.reject("Failed to get json from call")
        }
    }

    @objc func eventAdImpressionAppLovin(_ call: CAPPluginCall) {
        guard let json = call.getAny("json") else {
            call.reject("Failed to get json from call")
            return
        }
        do {
            let data =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            let convertedString = String(data: data, encoding: .utf8)
            implementation.appLovinImpression(fromJSON: convertedString)
            call.resolve()
        } catch let error {
            print(error.localizedDescription)
            call.reject("Failed to get json from call")
        }
    }

    @objc func eventAdImpressionHyperBid(_ call: CAPPluginCall) {
        guard let json = call.getAny("json") else {
            call.reject("Failed to get json from call")
            return
        }
        do {
            let data =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            let convertedString = String(data: data, encoding: .utf8)
            implementation.hyperBidImpression(fromJSON: convertedString)
            call.resolve()
        } catch let error {
            print(error.localizedDescription)
            call.reject("Failed to get json from call")
        }
    }

    @objc func eventAdImpressionIronSource(_ call: CAPPluginCall) {
        guard let json = call.getAny("json") else {
            call.reject("Failed to get json from call")
            return
        }
        do {
            let data =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            let convertedString = String(data: data, encoding: .utf8)
            implementation.ironSourceImpression(fromJSON: convertedString)
            call.resolve()
        } catch let error {
            print(error.localizedDescription)
        }
    }

    @objc func eventAdImpressionTopOn(_ call: CAPPluginCall) {
        guard let json = call.getAny("json") else {
            call.reject("Failed to get json from call")
            return
        }
        do {
            let data =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            let convertedString = String(data: data, encoding: .utf8)
            implementation.topOnImpression(fromJSON: convertedString)
            call.resolve()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func eventAdImpressionTradPlus(_ call: CAPPluginCall) {
        guard let json = call.getAny("json") else {
            call.reject("Failed to get json from call")
            return
        }
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            let convertedString = String(data: data, encoding: .utf8)
            implementation.tradPlusImpression(fromJSON: convertedString)
            call.resolve()
        } catch let error {
            print(error.localizedDescription)
            call.reject("Failed to get json from call")
        }
    }
    
    @objc func eventAdImpressionCAS(_ call: CAPPluginCall) {
        guard let json = call.getAny("json") else {
            call.reject("Failed to get json from call")
            return
        }
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            let convertedString = String(data: data, encoding: .utf8)
            implementation.casImpression(fromJSON: convertedString)
            call.resolve()
        } catch let error {
            print(error.localizedDescription)
            call.reject("Failed to get json from call")
        }
    }
    
    @objc func updatePostbackConversionValue(_ call: CAPPluginCall) {
        guard let conversionValue = call.getInt("conversionValue") else {
            call.reject("Failed to get conversionValue from call")
            return
        }
        implementation.updatePostbackConversionValue(Int32(conversionValue))
        call.resolve()
    }
    
    @objc func updatePostbackConversionValueCoarseValue(_ call: CAPPluginCall) {
        guard let conversionValue = call.getInt("conversionValue"), let coarseValue = call.getString("coarseValue") else {
            call.reject("Failed to get conversionValue or coarseValue from call")
            return
        }
        implementation.updatePostbackConversionValue(Int32(conversionValue), coarseValue: coarseValue)
        call.resolve()
    }
    
    @objc func updatePostbackConversionValueCoarseValueLockWindow(_ call: CAPPluginCall) {
        guard let conversionValue = call.getInt("conversionValue"), let coarseValue = call.getString("coarseValue"), let lockWindow = call.getBool("lockWindow") else {
            call.reject("Failed to get conversionValue, coarseValue or lockWindow from call")
            return
        }
        implementation.updatePostbackConversionValue(Int32(conversionValue), coarseValue: coarseValue, lockWindow: lockWindow)
        call.resolve()
    }
    
    @objc func setCustomerUserId(_ call: CAPPluginCall) {
        guard let userId = call.getString("userId") else {
            call.reject("Failed to get userId from call")
            return
        }
        implementation.setCustomerUserId(userId)
        call.resolve()
    }
    
    @objc func getCustomerUserId(_ call: CAPPluginCall) {
        if let userId = implementation.getCustomerUserId() {
            let data: [String: Any] = ["userId": userId]
            call.resolve(data)
        }
    }
    
    @objc func setCacheEventSetting(_ call: CAPPluginCall) {
        guard let setting = call.getBool("setting") else {
            call.reject("Failed to get setting from call")
            return
        }
        implementation.setCacheEventSetting(setting)
        call.resolve()
    }

    @objc func getAnalyticsInstallationId(_ call: CAPPluginCall) {
        if let installationId = implementation.getAnalyticsInstallationId() {
            let data: [String: Any] = ["installationId": installationId]
            call.resolve(data)
        }
    }
    
    @objc func setGoogleDMAParameters(_ call: CAPPluginCall) {
        guard let adPersonalization = call.getBool("adPersonalization"), let adUserData = call.getBool("adUserData") else {
            call.reject("Failed to get adPersonalization or adUserData from call")
            return
        }
        implementation.setGoogleDMAParametersWithAdPersonalization(adPersonalization, adUserData: adUserData)
        call.resolve()
    }
}
