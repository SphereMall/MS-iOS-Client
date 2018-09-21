# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


def shared_pods
    use_frameworks!
    pod 'SwiftyJSON' , '~> 3.1.4'
    pod 'Alamofire', '~> 4.6.0'
end

target 'iOS-MS-Cient' do
    inherit! :search_paths
    shared_pods

  target 'iOS-MS-CientTests' do
    inherit! :search_paths
    shared_pods
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
        end
    end
end
