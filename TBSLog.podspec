#
# Be sure to run `pod lib lint TBSLog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TBSLog'
  s.version          = '0.1.0'
  s.summary          = 'iOS log'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
console log in debug
                       DESC

  s.homepage         = 'git@github.com:fupenghua/consoleLog.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '390908980@qq.com' => 'penghua.fu@thebeastshop.com' }
  s.source           = { :git => 'git@github.com:fupenghua/consoleLog.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'TBSLog/*'
 

end
