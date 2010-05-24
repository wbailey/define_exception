require 'rubygems'
require 'rake/gempackagetask'
require 'spec'
require 'spec/rake/spectask'

@@version='0.0.2'

spec = Gem::Specification.new do |s| 
  s.name = 'define_exception'
  s.version = @@version
  s.author = 'Wes Bailey'
  s.email = 'wes@verticalresponse.com'
  s.homepage = 'http://github.com/wbailey/define_exception'
  s.platform = Gem::Platform::RUBY
  s.summary = %q{A simple way of defining exceptions for use in your ruby classes}
  s.has_rdoc = true
  s.rdoc_options << '--title' << 'Define Exception Mixin' << '--main' << 'lib/define_exception.rb' << '--line-numbers' << '--inline-source'
  s.files = FileList[ 'lib/**/*.rb' ]
  s.test_file = 'test/define_exception_spec.rb'
end

Rake::GemPackageTask.new( spec ) do |pkg|
  pkg.need_tar = true
end

task :uninstall do
  system( 'sudo gem uninstall define_exception' )
end

task :install do
  system( "sudo gem install pkg/define_exception-#{@@version}.gem" )
end

task :rdoc do
  system( 'rdoc --force --inline-source lib/define_exception.rb' )
end

Spec::Rake::SpecTask.new do |task|
  task.spec_opts = %w( -f n -c )
  task.spec_files = FileList[ 'test/**/*_spec.rb' ]
end
