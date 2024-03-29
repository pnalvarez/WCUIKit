#
# Be sure to run `pod lib lint WCUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WCUIKit'
  s.version          = '0.1.0'
  s.summary          = 'UI identity to WeCam app'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  This framework is meant to have all the UI components that shall fit WeCam app
                       DESC

  s.homepage         = 'https://github.com/pnalvarez/WCUIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pnalvarez' => 'pedronalvarez@hotmail.com' }
  s.source           = { :git => 'https://github.com/pnalvarez/WCUIKit.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  s.resources = 'WCUIKit/Assets/*.xcassets'

  s.source_files = 'WCUIKit/Classes/**/*'
  s.resource_bundles = {
      'WCUIKit' => ['WCUIKit/Assets/*.{xcassets}']
  }
  
  s.dependency 'SDWebImage', '~> 5.0.2'
  s.dependency 'SnapKit'
  
  # s.resource_bundles = {
  #   'WCUIKit' => ['WCUIKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
