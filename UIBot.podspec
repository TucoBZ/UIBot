Pod::Spec.new do |spec|
  spec.name             = 'UIBot'
  spec.version          = '0.3.0'
  spec.summary          = 'A Bot way to create UI Test in Swift.'
  spec.homepage         = 'https://github.com/TucoBZ/UIBot'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'TucoBZ' => 'tucobz@gmail.com' }
  spec.source           = { :git => 'https://github.com/TucoBZ/UIBot.git', :tag => spec.version.to_s }
  spec.swift_version    = '5.0'
  spec.ios.deployment_target = '9.0'

  spec.frameworks = 'XCTest'

  spec.default_subspecs = 'Core'

  spec.subspec 'Core' do |ss|
    ss.source_files = 'UIBot/Core/**/*.swift'
  end
end
