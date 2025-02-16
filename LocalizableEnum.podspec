#
# Be sure to run `pod lib lint LocalizableEnum.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LocalizableEnum'
  s.version          = '0.1.0'
  s.summary          = 'Fast localization for enum based localization strings.'

  s.description      = <<-DESC
  This Swift library offers a powerful and streamlined way to localize enum-based values using an approach inspired by Encoding and Decoding CodingKeys. It simplifies the process of mapping enums to localized strings, reducing boilerplate code and enhancing readability in your projects. By leveraging the power of enums and their type-safe structure, the library eliminates the need for fragile hardcoded keys or verbose localization logic. It provides a seamless API to link your enum cases directly to localized values, ensuring consistency and reducing the risk of mismatched or missing keys.
                       DESC

  s.homepage         = 'https://github.com/Vita98/LocalizableEnum'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vitandrea Sorino' => 'vitandrea98@icloud.it' }
  s.source           = { :git => 'https://github.com/Vita98/LocalizableEnum.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12'
  s.macos.deployment_target = "10.13"
  s.watchos.deployment_target = "8.0"

  s.source_files = 'Classes/*'
  s.swift_versions = '5'
end
