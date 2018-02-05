Pod::Spec.new do |s|
  s.name         = "iOS-MS-Client"
  s.version      = "0.0.1"
  s.summary      = "Official PHP SDK for integrating with SphereMall Product."
  s.description  = "Supported microservices: Gateway 1.1.1, Products 1.1.0, Shop 1.0.1, Users 1.0.0, Grapher 1.0.0"

  s.homepage     = "https://spheremall.atlassian.net/wiki/spaces/MIC/pages"
  s.license      = "MIT"
  s.source = {
    :git => 'https://github.com/SphereMall/iOS-MS-Client.git',
    :tag => '1.0.3'
  }
  s.author       = { "Nazar Gorobets" => "n.gorobets@spheremall.com" }
  s.platform     = :ios, "10.0"
  s.source_files = "iOS-MS-Client/iOS-MS-Cient/*.{swift}"
  s.xcconfig = {'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'}
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4'}
  s.dependency "SwiftyJSON" , "~> 3.1.4"
  s.dependency "Alamofire", "~> 4.6.0"
  s.dependency "Reflection", "~> 0.15"
end