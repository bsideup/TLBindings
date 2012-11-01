Pod::Spec.new do |s|
  s.name     = 'TLBindings'
  s.version  = '0.1'
  s.platform = :ios, '5.0'
  s.license  = {:type => 'Custom', :text => 'Copyright (C) 2012 Sergey Egorov' }
  s.summary  = 'Bindings framework for iOS.'
  s.homepage = 'https://github.com/bsideup/TLBindings'
  s.author   = { 'Sergey Egorov' => 'bsideup@gmail.com' }
  s.source   = { :git => 'https://github.com/bsideup/TLBindings.git',
		 :commit => 'HEAD' }

  s.source_files = 'TLBindings/*.{h,m}'
  s.requires_arc = true
end
