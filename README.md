# Ionic Capacitor Tenjin Plugin

# Summary

Tenjin's SDK allows users to track events and installs in their iOS apps. To learn more about Tenjin and our product offering, please visit https://www.tenjin.com.

### Notes:

On iOS:
For AppTrackingTransparency, be sure to update your project `.plist` file and add `NSUserTrackingUsageDescription` along with the text message you want to display to users. This library is only available in iOS 14.0+. For further information on this, you can check our [iOS documentation](https://github.com/tenjin/tenjin-ios-sdk#-skadnetwork-and-ios-15-advertiser-postbacks)

# Plugin Integration

## Install

```bash
npm install ionic-capacitor-tenjin
npx cap sync
```

### Import
```javascript
import Tenjin from 'ionic-capacitor-tenjin';
```

## Available methods

### Initialize
You need to initialize the plugin before doing calling any of the other methods available, for this, you would need the api key provided on Tenjin's dashboard:
```javascript
Tenjin.initialize(sdkKey: string)
```

### Connect
```typescript
Tenjin.connect()
```

### OptIn
```typescript
Tenjin.optIn()
```

### OptOut
```typescript
Tenjin.optOut()
```

### OptIn with parameters
```typescript
Tenjin.optIn(params: string[])
```

### OptOut with parameters
```typescript
Tenjin.optOut(params: string[])
```

### OptIn and OptOut using CMP
```typescript
Tenjin.optInOutUsingCMP()
```

### Opt out of Google DMA parameters
```typescript
Tenjin.optOutGoogleDMA()
```

### Opt in of Google DMA parameters
```typescript
Tenjin.optInGoogleDMA()
```

### Register transaction
```typescript
transaction(productName: string, currencyCode: string, quantity: number, unitPrice: number)
```

### Send event with name
```typescript
Tenjin.eventWithName(name: string)
```

### Send event with name and value
```typescript
Tenjin.eventWithNameAndValue(name: string, value: string)
```

### Get attribution info
```typescript
Tenjin.getAttributionInfo()
```
Returns: `JSON`

### Append app subversion
```typescript
Tenjin.appendAppSubversion(subversion: number)
```

### Send AdMob impression (ILRD)
```javascript
Tenjin.eventAdImpressionAdMob(json)
```
Parameters:
- `json`: JSON

### Send AppLovin impression (ILRD)
```javascript
Tenjin.eventAdImpressionAppLovin(json)
```
Parameters:
- `json`: JSON

### Send HyperBid impression (ILRD)
```javascript
Tenjin.eventAdImpressionHyperBid(json)
```
Parameters:
- `json`: JSON

### Send IronSource impression (ILRD)
```javascript
Tenjin.eventAdImpressionIronSource(json)
```
Parameters:
- `json`: JSON

### Send TopOn impression (ILRD)
```javascript
Tenjin.eventAdImpressionTopOn(json)
```
Parameters:
- `json`: JSON

### Send TradPlus impression (ILRD)
```javascript
Tenjin.eventAdImpressionTradPlus(json)
```
Parameters:
- `json`: JSON

### Send CAS impression (ILRD)
```javascript
Tenjin.eventAdImpressionCAS(json)
```
Parameters:
- `json`: JSON

### Customer User ID
```javascript
Tenjin.setCustomerUserId(userId)
```
Parameters:
- `userId`: string

```javascript
Tenjin.getCustomerUserId()
```
Returns: `string`

### Analytics Installation ID

```javascript
Tenjin.getAnalyticsInstallationId()
```
Returns: `string`

### Send Google DMA Parameters
```javascript
Tenjin.setGoogleDMAParametersWithAdPersonalization(adPersonalization, adUserData)
```
Parameters:
- `adPersonalization`: Boolean
- `adUserData`: Boolean

### Update SKAN Postback Conversion Value (iOS only)
```javascript
Tenjin.updatePostbackConversionValue(conversionValue)
```
Parameters:
- `conversionValue`: number

```javascript
Tenjin.updatePostbackConversionValueCoarseValue(conversionValue, coarseValue)
```
Parameters:
- `conversionValue`: number
- `coarseValue`: string

```javascript
Tenjin.updatePostbackConversionValueCoarseValueLockWindow(conversionValue, coarseValue, lockWindow)
```
Parameters:
- `conversionValue`: number
- `coarseValue`: string
- `lockWindow`: boolean

## Support
If you have any issues with the plugin integration or usage, please contact us to support@tenjin.com
