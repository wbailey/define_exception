# define_exception - Custom exceptions with default messages

This gem provides a dry way of defining custom exceptions in your application with default
messages.  This helps dry your code so that you don't have to constantly define a message
when using *raise*.

# Installing

`gem install define_exception`

---

# Typical Exception Definition

It is common in ruby applications to write a custom exception to indicate a special
error has occurred in your application

`class MyCustomException < RuntimeError; end #nodoc`

This can then be invoked by *raise* with a message

`raise( MyCustomException, 'Your custom error message here' ) unless ...`

If you raise this exception multiple times but want the same error message to be
presented to the user you have to repeat the above statement which is cumbersome.
You could define a hash for common error messages but this divorces the exception
from the message it is to deliver.

# A Better Way

A better way of approaching the problem is to define the exception class with a
default message while preserving the ability to override it using *raise*.  This may
sound trivial but it is not so straightforward when you subclass off of the ruby
standard exception classes.  This can be done easily with this gem using any of
the following constructs:

`define_exception 'MyTestException', 'This is my default message'
 define_exception :AnotherTestException, 'This is the default message for another exception'
 define_exception :yet_another_exception, 'There is always more than one way'
`


