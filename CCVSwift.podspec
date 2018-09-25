
Pod::Spec.new do |s|
  s.name         = "CCVSwift"
  s.swift_version = "4.2"
  s.version      = "0.0.4"
  s.summary      = "Shorthand tool for checking banking credit cards."

  s.description  = "You can quick add credit card validation to your project. This included Luhn algorithm, PAN card format and card detector for the some first digits of cards."

  s.homepage     = "https://github.com/digital-horizon/ccvswift.git"
  s.license      = "MIT"
  s.author             = { "Nikolay Kapustin" => "greenkaktus@gmail.com" }
  s.social_media_url   = "http://digitalhorizon.ru"
 
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/digital-horizon/ccvswift.git", :tag => s.version.to_s }
  s.source_files  = "CCVSwift/CCVSwift/*"
  s.exclude_files = "CCVSwift/CCVSwift/*.plist"
  s.requires_arc = true

end
