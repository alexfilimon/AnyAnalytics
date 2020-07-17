Pod::Spec.new do |spec|

  spec.name         = "AnyAnalytics"
  spec.version      = "0.1.2"
  spec.summary      = "Reusable library for analytics written with swift"

  spec.homepage     = "https://github.com/alexfilimon/swift-analytics"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Alexander Filimonov" => "as_filimon@mail.ru" }
  
  spec.ios.deployment_target = "10.0"
  spec.swift_version = "4.2"
  
  spec.source       = { :git => "https://github.com/alexfilimon/swift-analytics.git", :tag => "#{spec.version}" }
  spec.source_files  = "Analytics", "Analytics/**/*.{h,m,swift}"

end
