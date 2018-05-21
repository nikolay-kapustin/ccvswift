
Pod::Spec.new do |s|

  s.name         = "CCVSwift"
  s.version      = "0.0.1"
  s.summary      = "Shorthand tool for checking banking credit cards.
  This included Luhn algorithm, PAN card format and card detector for the some first digits of cards."

  s.description  = "A payment card number, primary account number (PAN), or simply a card number, is the card identifier found on payment cards, such as credit cards and debit cards, as well as stored-value cards, gift cards and other similar cards."

  s.homepage     = "https://github.com/GPBDigital/ccvswift"
  s.license      = "MIT"
  s.author             = { "Nikolay Kapustin" => "greenkaktus@gmail.com" }
  s.social_media_url   = "http://gpbdigital.com"
 
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.7"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/GPBDigital/ccvswift", :tag => s.version.to_s }
  s.source_files  = "CCVSwift/CCVSwift/*.{h,m,swift,plist}"
  s.public_header_files = "CCVSwift/CCVSwift/CCVSwift.h"
  s.requires_arc = true

end
