Pod::Spec.new do |s|

  s.name          = "viper-base"
  s.module_name   = "VIPERBase"
  s.version       = "1.0.0"
  s.summary       = "VIPER layers base implementation to be used with iOS projects"
  s.homepage      = "https://github.com/rafaelrsilva/viper-base-ios.git"
  s.license       = "MIT"
  s.author        = { "Rafael Ribeiro da Silva" => "eu@rafaelrsilva.com" }
  s.platform      = :ios, "11.0"
  s.swift_version = "4.0"
  s.source        = { :git => "https://github.com/rafaelrsilva/viper-base-ios.git", :tag => "1.0.0" }
  s.source_files  = "VIPERBase/**/*.{h,m,swift}"
  
end