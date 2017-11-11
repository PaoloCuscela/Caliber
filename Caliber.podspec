Pod::Spec.new do |s|
  s.name             = 'Caliber'
  s.version          = '1.0'
  s.summary          = 'Implementing autolayout constrains programmatically made dead simple.'
  s.homepage         = 'https://github.com/PaoloCuscela/Caliber'
  s.screenshots      = '', ''
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Paolo Cuscela' => 'cuscio.2@gmail.com'}
  s.source           = { :git => 'https://github.com/PaoloCuscela/Caliber.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'Caliber/*'
  s.frameworks = 'UIKit'
end
