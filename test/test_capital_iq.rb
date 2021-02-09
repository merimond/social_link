require 'minitest/autorun'
require 'social_link'

describe SocialLink::CapitalIQ do

  describe "company numeric format" do

    it "parses default URLs" do
      result = {
        type:   "CapitalIQ",
        id:     "59203199",
        format: "company",
      }
      assert_equal result, SocialLink::CapitalIQ.parse("https://www.capitaliq.com/CIQDotNet/company.aspx?companyId=59203199")
    end

  end

  describe "personal numeric format" do

    it "parses default URLs" do
      result = {
        type:   "CapitalIQ",
        id:     "60807154",
        format: "person",
      }
      assert_equal result, SocialLink::CapitalIQ.parse("https://www.capitaliq.com/CIQDotNet/Person/PersonProfile.aspx?personId=60807154")
    end

  end

end
