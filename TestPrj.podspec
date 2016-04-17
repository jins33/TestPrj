Pod::Spec.new do |s|
  s.name         = 'TestPrj'
  s.summary      = 'Just a test project.'
  s.version      = '1.0.0'
  s.license      = 'Apache License, Version 2.0'
  s.authors      = { 'jinshengh33' => 'jinshengh33@gmail.com' }
  s.homepage     = 'https://github.com/jins33/TestPrj'
  s.platform     = :ios, '7.0'
  s.source       = { :git => 'https://github.com/jins33/TestPrj.git', :tag => s.version.to_s }
  s.social_media_url = 'https://github.com/jins33'
  
  s.requires_arc = true
  
  s.source_files = 'TestPrj/TestPrj/Public/CHCSVParser/*.{h,m}'
  s.resources = 'TestPrj/TestPrj/TestPrj/Public/CHCSVParser/*.{h,m}'

end
