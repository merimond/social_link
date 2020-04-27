require 'minitest/autorun'
require 'social_link'

describe SocialLink::Bloomberg do

  describe "ticker format" do

    it "parses default URLs" do
      result = {
        type:   "Bloomberg",
        id:     "214382Z:US",
        format: "ticker",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profile/company/214382Z:US")
    end

    it "parses URLs with names" do
      result = {
        type:   "Bloomberg",
        id:     "214382Z:US",
        format: "ticker",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profile/company/214382Z:US-MDeverywhere-Inc")
    end

  end

  describe "personal numeric format in plural" do

    it "parses default URLs" do
      result = {
        type:   "Bloomberg",
        id:     "18019402",
        format: "personal-numeric",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profiles/people/18019402")
    end

    it "parses URLs with names" do
      result = {
        type:   "Bloomberg",
        id:     "18019402",
        format: "personal-numeric",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profiles/people/18019402-ramesh-rao")
    end

  end

  describe "personal numeric format in singular" do

    it "parses default URLs" do
      result = {
        type:   "Bloomberg",
        id:     "18019402",
        format: "personal-numeric",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profile/person/18019402")
    end

    it "parses URLs with names" do
      result = {
        type:   "Bloomberg",
        id:     "18019402",
        format: "personal-numeric",
      }
      assert_equal result, SocialLink::Bloomberg.parse("https://www.bloomberg.com/profile/person/18019402-ramesh-rao")
    end

  end

end
