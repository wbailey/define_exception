require 'rubygems'
require 'define_exception'

include DefineException

class Test
  define_exception :test_me, 'this is the default message'

  def test
    raise TestMe
  end

  def test2
    raise( TestMe, 'You shall not do that again' )
  end
end

t = Test.new

begin
  t.test
rescue Test::TestMe => e
  puts e.message
end

t.test2
