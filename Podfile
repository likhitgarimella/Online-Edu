platform :ios, '13.0'

target 'Online Edu' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Online Edu

pod 'paper-onboarding'
pod 'SwiftyJSON'
pod 'Alamofire'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
    end
  end
end