# Clouseau

An inspector of code that peeks into your source tree and determines its
language, framework, and suggested memory allocation for the application.

Example:

```ruby
# a small Sinatra application
detected = Clouseau.detect("./hello-sinatra")
  # => Clouseau::Sinatra

detected.language_name
  # => :ruby

detected.framework_name
  # => :sinatra

detected.memory_suggestion
  # => 128


# a Spring application
detected = Clouseau.detect("./hello-spring")
  # => Clouseau::Spring

detected.language_name
  # => :java

detected.framework_name
  # => :spring

detected.memory_suggestion
  # => 512
```
