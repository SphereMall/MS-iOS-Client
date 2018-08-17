# SphereMall Gateway iOS SDK
Official iOS SDK for integrating with **SphereMall Product**.
[Official documentation](https://spheremall.atlassian.net/wiki/spaces/MIC/pages)

### Version 2.0.5
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
    var client = SMClient(gatewayUrl: "API_GATEWAY_URL",
                          clientId: "API_CLIENT_ID",
                          secretKey: "API_SECRET_KEY")
                          
```

```swift

    // Get all entity items
    client.products.all { (products, error) in
        print(products)
    }
    
    // Get entity items by predicate
    let predicate = Predicate(field: "title", op: .equal, value: "Name of product")
    client.products.filter(predicate:predicate).all { (products, error) in
        print(products)
    }

```

