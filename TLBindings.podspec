Pod::Spec.new do |s|
  s.name     = 'TLBindings'
  s.version  = '0.1'
  s.platform = :ios, '5.0'
  s.license  = 'MIT'
  s.summary  = 'Bindings framework for iOS'
  s.homepage = 'https://github.com/bsideup/TLBindings'
  s.author   = { 'Sergey Egorov' => 'bsideup@gmail.com' }
  s.source   = { :git => 'https://github.com/bsideup/TLBindings.git' }

  s.source_files = 'TLBindings/*.{h,m}'
  s.requires_arc = true
end
