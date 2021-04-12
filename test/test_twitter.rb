require 'minitest/autorun'
require 'social_link'

describe SocialLink::Twitter do

  it "parses default format" do
    result = {
      type:   "Twitter",
      id:     "abcd",
      format: "default",
    }
    assert_equal result, SocialLink::Twitter.parse("https://twitter.com/ABCD")
  end

  it "guesses common error with @" do
    result = {
      type:   "Twitter",
      id:     "abcd",
      format: "default",
    }
    assert_equal result, SocialLink::Twitter.parse("https://twitter.com/@ABCD")
  end

  it "guesses common error with URL as handle" do
    result = {
      type:   "Twitter",
      id:     "abc",
      format: "default",
    }
    assert_equal result, SocialLink::Twitter.parse("https://www.twitter.com/http://twitter.com/abc?lang=en")
  end

end
