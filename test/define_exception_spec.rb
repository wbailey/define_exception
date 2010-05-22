$: << File.dirname( File.join( __FILE__, '..' ) )

require 'rubygems'
require 'define_exception'
require 'spec/test/unit'

include DefineException

describe "Define Exception" do
  it "should enable a class to define a custom exception" do
    MESSAGE = 'This is the default message'

    class TestDefineException
      define_exception 'TestException', MESSAGE

      def test
        raise TestException
      end
    end

    lambda {
      tde = TestDefineException.new
      tde.test
    }.should raise_error( TestDefineException::TestException, MESSAGE )
  end
end
