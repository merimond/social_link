require 'minitest/autorun'
require 'social_link'

describe SocialLink::PEI do

  describe "company numeric format" do

    it "parses default URLs" do
      result = {
        type:   "PEI",
        id:     "17588",
        format: "company",
      }
      assert_equal result, SocialLink::PEI.parse("https://www.privateequityinternational.com/database/#/profile?id=17588")
    end

  end

end
