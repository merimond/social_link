require 'minitest/autorun'
require 'social_link'

describe SocialLink::Dealroom do

  describe "company numeric format" do

    it "parses default URLs" do
      result = {
        type:   "Dealroom",
        id:     "123",
        format: "company-numeric",
      }
      assert_equal result, SocialLink::Dealroom.parse("https://app.dealroom.co/companies/123")
    end

  end

  describe "company slug format" do

    it "parses default URLs" do
      result = {
        type:   "Dealroom",
        id:     "abc-corp",
        format: "company-slug",
      }
      assert_equal result, SocialLink::Dealroom.parse("https://app.dealroom.co/companies/abc-corp")
    end

  end

  describe "personal numeric format" do

    it "parses default URLs" do
      result = {
        type:   "Dealroom",
        id:     "123",
        format: "person-numeric",
      }
      assert_equal result, SocialLink::Dealroom.parse("https://app.dealroom.co/people/123")
    end

  end

  describe "personal slug format" do

    it "parses default URLs" do
      result = {
        type:   "Dealroom",
        id:     "john-smith",
        format: "person-slug",
      }
      assert_equal result, SocialLink::Dealroom.parse("https://app.dealroom.co/people/john-smith")
    end

  end

end
