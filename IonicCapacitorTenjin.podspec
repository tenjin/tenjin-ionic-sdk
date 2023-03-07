require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name = 'IonicCapacitorTenjin'
  s.version = package['version']
  s.summary = package['description']
  s.license = package['license']
  s.homepage = package['repository']['url']
  s.author = package['author']
  s.source = { :git => package['repository']['url'], :tag => s.version.to_s }
  s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
  s.static_framework = true
  s.ios.deployment_target  = '13.0'
  s.dependency 'Capacitor'
  s.dependency 'TenjinSDK', '1.12.23'
  s.swift_version = '5.1'
end
