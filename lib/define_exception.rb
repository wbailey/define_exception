# = Introduction
#
# Simple mixin that provides a way of defining custom exception classes
# with default messages that dries up your code.
#
# = The Problem of Laborious Exception Class Definitions
#
# Typically you would write the following in your code to define a custom exception
#
#    class MyError < RuntimeError; end #nodoc
#
# This seems simple enough until you have to raise it many times throughout your code
# and have to provide an error message:
#
#    raise( MyError, 'You shall not do what you just did' )
#
# It gets harder when you get tired of writing the same message to the <i>raise</i> command.
# You can define a hash constant to keep track of common error messages:
#
#    ERRORS = { :myerror => 'You shall not do what you just did', ... }
#
# and then reference it
#
#    raise( MyError, ERRORS[:myerror] )
#
# but this just doesn't seem very rubyish.  You can also define the message when you write
# the custom exception class:
#
#    class MyError < RuntimeError
#      def message
#        'You shall not do what you just did' )
#      end
#    end
#
# The problem is that this always uses this message even when overridden in <i>raise</i>
#
#    raise( MyError, 'Use this instead' ) # <= 'You shall not do what you just did'
#
# The real solution for you class is to override the constructor:
#
#    class MyError < RuntimeError
#      def intialize( message = nil )
#        super( message || 'Default Error Message' )
#      end
#    end
#
#    raise MyError                      # <= 'Default Error Message'
#    raise MyError, 'Not the Default'   # <= 'Not the Default'
#
# = A Better Way
#
# Though this accomplishes the goal it is laborious to write all this code especially
# as the number of custom exception definitions grow.  A better solution would be to make
# a class method available that simply handles creating the exception for use automatically
# thus drying up our code:
#
#    class TestMe
#      define_exception 'MyError', 'The Default Message'
#      define_exception 'AnotherError', 'Another Default Message'
#      define_exception 'WorstError', 'Worst Default Message'
#      ...
#      def tester( args )
#        raise MyError unless ...
#        raise AnotherError unless ...
#      end
#
#      def worst( args )
#        raise( WorstError, 'You really messed up' ) unless ...
#      end
#    end
#
# = Usage
#
# The standard ruby practice of requiring the gem and then use <i>include DefineException</i> to
# make the class method available.
#
# = Example
#
#    require 'rubygems'
#    require 'define_exception'
#
#    include DefineException
#
#    class Test
#      define_exception 'TestMe', 'this is the default message'
#
#      def test
#        raise TestMe
#      end
#
#      def test2
#        raise( TestMe, 'You shall not do that again' )
#      end
#    end
#
#    t = Test.new
#
#    begin
#      t.test
#    rescue Test::TestMe => e
#      puts e.message
#    end
#
#    t.test2
#
# running the above example would correctly produce
#
#    wes:~/Define-Exception> ruby test.rb
#    this is the default message
#    test.rb:14:in `test2': You shall not do that again (Test::TestMe)
#        from test.rb:26
#
# = Information
#
# Author:: Wes Bailey, wes@verticalresponse.com
# License:: Ruby License

module DefineException
  module ClassMethods
    def define_exception( exception_name, default_message = 'Application Error Occurred' )
      exception_name = exception_name.to_s.split( '_' ).inject( '' ) { |s,v| s << v.capitalize } if /\_/.match( exception_name.to_s )

      class_eval <<-EOD
        class #{exception_name} < RuntimeError
          def initialize( message = nil )
            super( message || "#{default_message}" )
          end
        end
      EOD
    end
  end

  class << self
    def included( base )
      base.extend( ClassMethods )
    end
  end
end
