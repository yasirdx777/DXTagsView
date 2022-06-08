#
# Be sure to run `pod lib lint DXTagsView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DXTagsView'
  s.version          = '1.0.1'
  s.summary          = 'A multi choose tag view that you can add as child VC and get the selected tags index easily.'


  s.description      = <<-DESC
  'A multi choose tag view that you can add as child VC and get the selected tags index easily.'
                       DESC

  s.homepage         = 'https://github.com/yasirdx777/DXTagsView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yasirdx777' => 'yasir.romaya@gmail.com' }
  s.source           = { :git => 'https://github.com/yasirdx777/DXTagsView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.instagram.com/yasirdx777'

  s.ios.deployment_target = '11.0'

  s.source_files = 'Classes/**/*.*'
  
  s.swift_version = '5.0'
  
  s.platforms = {"ios": "11.0"}
  
end
