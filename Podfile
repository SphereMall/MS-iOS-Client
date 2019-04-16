# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


def shared_pods
    use_frameworks!
    pod 'SwiftyJSON' , '~> 4.0.0'
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
        
        # The following is needed to ensure the "archive" step works in XCode.
        # It removes React & Yoga from the Pods project, as it is already included in the main project.
        # Without this, you'd see errors when you archive like:
        # "Multiple commands produce ... libReact.a"
        # "Multiple commands produce ... libyoga.a"
        
        targets_to_ignore = %w(React yoga)
        
        if targets_to_ignore.include? target.name
            target.remove_from_project
        end
        
    end
end
