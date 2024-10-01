platform :ios, '17.2'

target 'HowDidI' do
  use_frameworks!

  pod 'Firebase/Core'
  pod 'Firebase/Firestore'
  pod 'Firebase/Auth'
  pod 'Firebase/Storage'
  pod 'Firebase/Database'

end

# 强制所有 Pods 的最低部署目标为 17.2
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 17.2
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '17.2'
      end
    end
  end
end
