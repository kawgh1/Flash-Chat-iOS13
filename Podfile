platform :ios, '13.0'

target 'Flash Chat iOS13' do
  use_frameworks!

  # Pods for Flash Chat iOS13
    pod 'CLTypingLabel', '~> 0.4.0'
    pod 'FirebaseAuth'
    pod 'FirebaseFirestore'
    
    
end

# disable the warning flag CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER setting for all pods in your project
post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
          config.build_settings['CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER'] = 'NO'
      end
    end
  end
end
