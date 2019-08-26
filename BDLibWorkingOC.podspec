#
# Be sure to run `pod lib lint BDLibWorkingOC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BDLibWorkingOC'
  s.version          = '1.0.5'
  s.summary          = 'hust addep'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/liyongfei12138/BDLibWorkingOC'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liyongfei12138' => 'miap972712779@qq.com' }
  s.source           = { :git => 'https://github.com/liyongfei12138/BDLibWorkingOC.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'

  s.source_files = 'BDLibWorkingOC/Classes/**/*'
  


end
