# SphereMall Gateway iOS SDK
Official iOS SDK for integrating with **SphereMall Product**.
[Official documentation](https://spheremall.atlassian.net/wiki/spaces/MIC/pages)

### Version 1.0.9
#### Supported microservices
* Gateway 1.1.1
* Products 1.1.0
* Shop 1.0.1
* Users 1.0.0
* Grapher 1.0.0

## Installation
You can install the package manually or by adding it to your `Podfile`:
```
pod 'iOS-MS-Client'

```
## Instantiating the SDK Client:

Pass in the configuration to the client:

```swift
    var client = SMClient(gatewayUrl: API_GATEWAY_URL,
                          clientId: "API_CLIENT_ID",
                          secretKey: "API_SECRET_KEY")
                          
```

