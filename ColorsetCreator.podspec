#
# Be sure to run `pod lib lint ColorsetCreator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ColorsetCreator'
  s.version          = '0.1.0'
  s.summary          = 'Little utility for creating assets catalogs (.xcasset) from a code generated NSColor.'
  s.description      = <<-DESC
Create your custom xcasset color asset from Colours generated in code
                       DESC

  s.homepage         = 'https://github.com/federicocappelli/ColorsetCreator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Federico Cappelli' => 'info@federicocappelli.net' }
  s.source           = { :git => 'https://github.com/federicocappelli/ColorsetCreator.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/@federicokappe'

  s.platform = :osx
  s.osx.deployment_target = "10.12"

  s.source_files = 'ColorsetCreator/Classes/**/*'

  # s.resource_bundles = {
  #   'ColorsetCreator' => ['ColorsetCreator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'Cocoa'
  # s.dependency 'AFNetworking', '~> 2.3'
end
