#
# Be sure to run `pod lib lint com.awareframework.ios.sensor.rotation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'com.awareframework.ios.sensor.rotation'
  s.version       = '0.2.2'
  s.summary          = 'A Rotation Sensor Module for AWARE Framework.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
com.awareframework.ios.sensor.rotation (Rotation) is a sensor module for Aware Framework. This module provides the devices' rotation rates. The data is provided by Core Motion's sensor fusion algorithms.

https://developer.apple.com/documentation/coremotion/cmmotionmanager
                       DESC

  s.homepage         = 'https://github.com/awareframework/com.awareframework.ios.sensor.rotation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache2', :file => 'LICENSE' }
  s.author           = { 'tetujin' => 'tetujin@ht.sfc.keio.ac.jp' }
  s.source           = { :git => 'https://github.com/awareframework/com.awareframework.ios.sensor.rotation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  
  s.swift_version = '4.2'

  s.source_files = 'com.awareframework.ios.sensor.rotation/Classes/**/*'
  
  # s.resource_bundles = {
  #   'com.awareframework.ios.sensor.rotation' => ['com.awareframework.ios.sensor.rotation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.frameworks = 'CoreMotion'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'com.awareframework.ios.sensor.core', '~> 0.3.1'
  
end
