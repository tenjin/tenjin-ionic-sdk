type JSONValue =
    | string
    | number
    | boolean
    | JSONObject
    | JSONArray;

interface JSONObject {
    [x: string]: JSONValue;
}

interface JSONArray extends Array<JSONValue> { }

export interface TenjinPlugin {
  initialize(options: { sdkKey: string }): Promise<void>;
  connect(): Promise<void>;
  optIn(): Promise<void>;
  optOut(): Promise<void>;
  optInParams(options: { params: string[] }): Promise<void>;
  optOutParams(options: { params: string[] }): Promise<void>;
  transaction(options: { productName: string, currencyCode: string, quantity: number, unitPrice: number }): Promise<void>;
  eventWithName(options: { name: string }): Promise<void>;
  eventWithNameAndValue(options: { name: string, value: string }): Promise<void>;
  appendAppSubversion(options: { version: number }): Promise<void>;
  getAttributionInfo(): Promise<JSONObject>;
  eventAdImpressionAdMob(options: { json: JSONObject }): Promise<void>;
  eventAdImpressionAppLovin(options: { json: JSONObject }): Promise<void>;
  eventAdImpressionHyperBid(options: { json: JSONObject }): Promise<void>;
  eventAdImpressionIronSource(options: { json: JSONObject }): Promise<void>;
  eventAdImpressionTopOn(options: { json: JSONObject }): Promise<void>;
  updatePostbackConversionValue(options: { conversionValue: number }): Promise<void>;
  updatePostbackConversionValueCoarseValue(options: { conversionValue: number, coarseValue: string }): Promise<void>;
  updatePostbackConversionValueCoarseValueLockWindow(options: { conversionValue: number, coarseValue: string, lockWindow: boolean }): Promise<void>;
  setCustomerUserId(options: { userId: string }): Promise<void>;
  getCustomerUserId(): Promise<void>;
}
