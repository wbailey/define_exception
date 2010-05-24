$: << File.dirname( File.join( __FILE__, '..' ) )

require 'rubygems'
require 'define_exception'
require 'spec/test/unit'

include DefineException

@@message = 'This is the default @@message'

describe "Define Exception" do
  it "should enable a class to define a custom exception using a string" do

    class TestDefineException
      define_exception 'TestException', @@message

      def test
        raise TestException
      end
    end

    lambda {
      tde = TestDefineException.new
      tde.test
    }.should raise_error( TestDefineException::TestException, @@message )
  end

  it "should enable a class to define a custom exception using a symbol" do
    class AnotherTest
      define_exception :AnotherException, @@message
    
      def test
        raise AnotherException
      end
    end

    lambda {
      at = AnotherTest.new
      at.test
    }.should raise_error( AnotherTest::AnotherException, @@message )
  end

  it "should enable a class to define a custom exception using a symbol with underscores automatically converted to camel case" do
    class YetAnotherTest
      define_exception :yet_another_exception, @@message
    
      def test
        raise YetAnotherException
      end
    end

    lambda {
      yat = YetAnotherTest.new
      yat.test
    }.should raise_error( YetAnotherTest::YetAnotherException, @@message )
  end
end
