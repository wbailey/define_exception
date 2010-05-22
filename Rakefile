require 'rake/gempackagetask'

spec = Gem::Specification.new do |s| 
  s.name = 'define_exception'
  s.version = '1.0.0'
  s.author = 'Wes Bailey'
  s.email = 'wes@verticalresponse.com'
  s.homepage = 'http://github.com/wbailey/define_exception'
  s.platform = Gem::Platform::RUBY
  s.summary = %q{A simple way of defining exceptions for use in your ruby classes}
  s.files = FileList[ 'lib/**/*.rb' ]
end

Rake::GemPackageTask.new( spec ) do |pkg|
  pkg.need_tar = true
end

