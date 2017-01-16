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
  s.summary      = "A three-ring control like the Activity status bars"
  s.description  = "The three-ring is a completely customizable widget that can be used in any iOS app. It also plays a little victory fanfare."
  s.homepage     = "http://google.com"

  s.license      = "MIT"

  s.author       = "Zipabout"
  s.platform     = :ios, "8.0"
  
  s.source       = { :git => "https://github.com/Zipabout/ZPBTTracker.git", :tag => "1.0.1" }

  s.source_files = "ZPBTTracker", "ZPBTTracker/**/*.{h,m}"
	



end
