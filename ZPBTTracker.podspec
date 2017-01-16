#
#  Be sure to run `pod spec lint ZPBTTracker.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "ZPBTTracker"
  s.version      = "1.0.1"
  s.summary      = "ZPBTTracker is a mobile SDK for iOS applications, providing access to the Zipabout platform."
  s.description  = "ZPBTTracker is a mobile SDK for iOS applications, providing access to the Zipabout platform. The SDK records the behaviour of users as they interact with information on your mobile application, in addition to providing a set of services to allow your own application to seamlessly deliver personalised information to your users."
  s.homepage     = "http://zipabout.com"
  s.license      = "MIT"

  s.author       = "Zipabout"
  s.platform     = :ios, "8.0"
  
  s.source       = { :git => "https://github.com/Zipabout/ZPBTTracker.git", :tag => "1.0.1" }

  s.source_files = "ZPBTTracker", "ZPBTTracker/**/*.{h,m}"
	
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '2.2' }

end
