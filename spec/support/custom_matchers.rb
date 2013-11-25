require 'rspec/expectations'

RSpec::Matchers.define :be_of_content_type do |expected|
  match do |actual|
    actual.content_type.to_sym == expected
  end
end