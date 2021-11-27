platform :ios, '13'

workspace 'iOSAcademy'
inhibit_all_warnings!
use_frameworks!

def core_pods
  pod 'SwiftGen'
  pod 'SwiftLint'
end

target 'PassengersFramework' do
  project 'PassengersFramework/PassengersFramework.xcodeproj'
  core_pods
end

target 'SampleApp' do
  project 'SampleApp/SampleApp.xcodeproj'
  core_pods
end
