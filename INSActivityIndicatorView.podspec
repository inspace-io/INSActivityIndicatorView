Pod::Spec.new do |s|
  s.name           = 'INSActivityIndicatorView'
  s.version        = '1.0.0'
  s.license        = { type: 'MIT', file: 'LICENSE' }
  s.summary        = 'Customizable and lightweight implementation of activity indicator view for iOS.'
  s.description    = 'INSActivityIndicatorView is a customizable and lightweight implementation of activity indicator view for iOS.'
  s.homepage       = 'https://github.com/inspace-io/INSActivityIndicatorView'
  s.author         = { "Dawid Płatek" => "dawid@inspace.io" }
  s.source         = { git: 'https://github.com/inspace-io/INSActivityIndicatorView.git', tag: s.version.to_s }

  s.source_files   = 'INSActivityIndicatorView/Classes/**/*'

  s.platform       = :ios, '8.0'
  s.frameworks     = 'UIKit', 'Foundation'
  s.swift_version  = '5.0'
end
