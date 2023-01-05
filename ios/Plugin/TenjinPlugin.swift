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
    }
    
    @objc func connect(_ call: CAPPluginCall) {
        implementation.connect()
    }
    
    @objc func optIn(_ call: CAPPluginCall) {
        implementation.optIn()
    }

    @objc func optOut(_ call: CAPPluginCall) {
        implementation.optOut()
    }

    @objc func optInParams(_ call: CAPPluginCall) {
        guard let data = call.getAny("params"), let params = data as? [Any] else {
            call.reject("Failed to get params from call")
            return
        }
        implementation.opt(inParams: params)
    }

    @objc func optOutParams(_ call: CAPPluginCall) {
        guard let data = call.getAny("params"), let params = data as? [Any] else {
            call.reject("Failed to get params from call")
            return
        }
        implementation.optOutParams(params)
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
    }

    @objc func eventWithName(_ call: CAPPluginCall) {
        guard let name = call.getString("name") else {
            call.reject("Failed to get name from call")
            return
        }
        implementation.sendEvent(withName: name)
    }

    @objc func eventWithNameAndValue(_ call: CAPPluginCall) {
        guard let name = call.getString("name"), let value = call.getString("value") else {
            call.reject("Failed to get name or value from call")
            return
        }
        implementation.sendEvent(withName: name, andEventValue: value)
    }

    @objc func appendAppSubversion(_ call: CAPPluginCall) {
        guard let version = call.getInt("version") else {
            call.reject("Failed to get version from call")
            return
        }
        implementation.appendAppSubversion(version as NSNumber)
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
        } catch let error {
            print(error.localizedDescription)
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
        } catch let error {
            print(error.localizedDescription)
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
        } catch let error {
            print(error.localizedDescription)
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
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
