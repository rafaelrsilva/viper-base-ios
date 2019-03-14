Pod::Spec.new do |s|

  s.name          = "viper-base"
  s.module_name   = "VIPERBase"
  s.version       = "2.1.0"
  s.summary       = "Implementation of VIPER architecture for using in iOS platform"
  s.homepage      = "https://github.com/rafaelrsilva/viper-base-ios.git"
  s.license       = "MIT"
  s.author        = { "Rafael Ribeiro da Silva" => "eu@rafaelrsilva.com" }
  s.platform      = :ios, "11.0"
  s.swift_version = "4.2"
  s.source        = { :git => "https://github.com/rafaelrsilva/viper-base-ios.git", :tag => "2.1.0" }
  s.source_files  = "VIPERBase/**/*.{h,m,swift}"
  s.test_spec 'VIPERBaseTests' do |test_spec|
    test_spec.source_files = "VIPERBaseTests/**/*.{h,m,swift}"
  end 
end