Pod::Spec.new do |spec|
  spec.name             = 'UIBot'
  spec.version          = '0.1.0'
  spec.summary          = 'A Bot way to create UI Test in Swift.'
  spec.homepage         = 'https://github.com/TucoBZ/UIBot'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'TucoBZ' => 'tucobz@gmail.com' }
  spec.source           = { :git => 'https://github.com/TucoBZ/UIBot.git', :tag => spec.version.to_s }
  spec.ios.deployment_target = '9.0'
  spec.requires_arc = true

  

  spec.subspec 'Core' do |core_spec|
    core_spec.source_files = 'Source/UIBot/*.swift'
  end

  spec.subspec 'XCTest' do |xctest_spec|
    xctest_spec.dependency 'UIBot/Core'
    xctest_spec.source_files = 'Source/UIBot/XCTest.swift'
    xctest_spec.frameworks = 'XCTest'
    xctest_spec.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
  end

end
