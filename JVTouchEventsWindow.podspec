#
# Be sure to run `pod lib lint JVTouchEventsWindow.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JVTouchEventsWindow"
  s.version          = "0.1.0"
  s.summary          = "A short description of JVTouchEventsWindow."
  s.description      = "JVTouchEventsWindow is a simple helper framework to display touches events within your projects demos. It really comes handy when you want to show off your app and create a preview video/gif of your app."
  s.homepage         = "https://github.com/JV17/JVTouchEventsWindow"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jorge Valbuena" => "jorgevalbuena2@gmail.com" }
  s.source           = { :git => "https://github.com/JV17/JVTouchEventsWindow.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/JustV17'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'JVTouchEventsWindow' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
