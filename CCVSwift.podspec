
Pod::Spec.new do |s|
  s.name         = "CCVSwift"
  s.version      = "0.0.4"
  s.summary      = "Shorthand tool for checking banking credit cards."

  s.description  = "You can quick add credit card validation to your project. This included Luhn algorithm, PAN card format and card detector for the some first digits of cards."

  s.homepage     = "https://github.com/GPBDigital/ccvswift"
  s.license      = "MIT"
  s.author             = { "Nikolay Kapustin" => "greenkaktus@gmail.com" }
  s.social_media_url   = "http://gpbdigital.com"
 
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/GPBDigital/ccvswift.git", :tag => s.version.to_s }
  s.source_files  = "CCVSwift/CCVSwift/*.{h,m,swift}"
  s.requires_arc = true

end
