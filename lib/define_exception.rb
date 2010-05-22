# Simple mixin that provides a simple way to define a custom exception that can be
# used in your classes
#
#    require 'rubygems'
#    require 'define_exception'
#
#    class A
#      define_exception 'InvalidHeader', 'The header must be an Array of Strings'
#
#      def test
#        raise InvalidHeader
#      end
#    end
#
#    a = A.new
#
#    begin
#      a.test
#    rescue InvalidHeader => e
#      puts e.message
#    end
module DefineException
  def define_exception( exception_name, default_message )
    class_eval <<-EOD
      class #{exception_name} < RuntimeError
        def initialize( message = nil )
          super( message || "#{default_message}" )
        end
      end
    EOD
  end

  class << self
    def included( other )
      other.extend( self )
    end
  end
end

class Object
  include DefineException
end
