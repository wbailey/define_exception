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

This works well with *raise*

`raise( MyCustomException, 'Your custom error message here' ) unless ...`

If you raise this exception multiple times but want the same error message to be
presented to the user you have to repeat the above statement which is cumbersome.
There are some work arounds for handling the messaging but none of them are very
rubyish.

# A Better Way




