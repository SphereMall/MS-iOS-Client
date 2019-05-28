Pod::Spec.new do |s|
  s.name         = "iOS-MS-Client"
  s.version      = "2.0.81"
  s.summary      = "Official iOS SDK for integrating with SphereMall Product."
  s.description  = "Supported microservices: Gateway 1.1.1, Products 1.1.0, Shop 1.0.1, Users 1.0.0, Grapher 1.0.0"
  s.requires_arc = true
  s.homepage     = "https://spheremall.atlassian.net/wiki/spaces/MIC/pages"
  s.license      = "MIT"
  s.source 	 = { :git => 'https://github.com/SphereMall/iOS-MS-Client.git', :tag => s.version.to_s}
  s.author       = { "Nazar Gorobets" => "n.gorobets@spheremall.com" }
  s.platform     = :ios, "9.0"
  s.source_files = 'iOS-MS-Cient/**/*'
  s.xcconfig = {'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES', 'UseNewBuildSystem' => 'NO'}
  s.dependency "SwiftyJSON" , "~> 3.1.4"
  s.dependency "Alamofire", "~> 4.6.0"
end
