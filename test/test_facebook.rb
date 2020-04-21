require 'minitest/autorun'
require 'social_link'

describe SocialLink::Facebook do

  describe "slug format" do

    it "parses slugs with dots" do
      result = {
        type:   "Facebook",
        id:     "john.karavas.509",
        format: "slug",
      }
      assert_equal result, SocialLink::Facebook.parse("http://www.facebook.com/john.karavas.509")
    end

    it "parses slugs with numbers" do
      result = {
        type:   "Facebook",
        id:     "23andme",
        format: "slug",
      }
      assert_equal result, SocialLink::Facebook.parse("http://www.facebook.com/23andMe")
    end

    it "parses slugs with hyphens" do
      result = {
        type:   "Facebook",
        id:     "local-ruckus",
        format: "slug",
      }
      assert_equal result, SocialLink::Facebook.parse("https://www.facebook.com/pg/Local-Ruckus")
    end

    it "parses slugs with sub-pages added" do
      result = {
        type:   "Facebook",
        id:     "bestone.dk",
        format: "slug",
      }
      assert_equal result, SocialLink::Facebook.parse("https://www.facebook.com/pg/bestone.dk/about/?ref=page_internal")
    end

    it "strips trailing spaces" do
      result = {
        type:   "Facebook",
        id:     "john.karavas.509",
        format: "slug",
      }
      assert_equal result, SocialLink::Facebook.parse("http://www.facebook.com/john.karavas.509%20%20")
    end

  end

  describe "numeric format" do

    it "parses ID after a hypen" do
      result = {
        type:   "Facebook",
        id:     "113165372165653",
        format: "numeric",
      }
      assert_equal result, SocialLink::Facebook.parse("https://www.facebook.com/kingsweb-media-113165372165653")
    end

    it "parses IDs after a slash" do
      result = {
        type:   "Facebook",
        id:     "8277214270",
        format: "numeric",
      }
      assert_equal result, SocialLink::Facebook.parse("https://www.facebook.com/pages/Crystal-Dynamics/8277214270")
    end

    it "parses ID with a trailing slash after a hypen" do
      result = {
        type:   "Facebook",
        id:     "497489790455444",
        format: "numeric",
      }
      assert_equal result, SocialLink::Facebook.parse("https://www.facebook.com/pages/category/Internet-Marketing-Service/BooqSmartcom-497489790455444/")
    end

    it "parses IDs within params" do
      result = {
        type:   "Facebook",
        id:     "100004928357980",
        format: "numeric",
      }
      assert_equal result, SocialLink::Facebook.parse("https://www.facebook.com/profile.php?id=100004928357980")
    end

    it "parses IDs after accented characters" do
      result = {
        type:   "Facebook",
        id:     "172368929491629",
        format: "numeric",
      }
      assert_equal result, SocialLink::Facebook.parse("https://www.facebook.com/Demoniak-Création-de-marque-172368929491629/")
    end

    it "parses IDs after non-latin characters" do
      result = {
        type:   "Facebook",
        id:     "2094769230744323",
        format: "numeric",
      }
      assert_equal result, SocialLink::Facebook.parse("https://www.facebook.com/17Kgイチナナキログラム-2094769230744323/")
    end

    it "parses IDs after names consisting of digits only" do
      result = {
        type:   "Facebook",
        id:     "108736729256023",
        format: "numeric",
      }
      assert_equal result, SocialLink::Facebook.parse("https://www.facebook.com/pg/776-108736729256023") 
    end

    it "parses IDs afters names with hypens and underscores" do
      result = {
        type:   "Facebook",
        id:     "455476741644836",
        format: "numeric",
      }
      assert_equal result, SocialLink::Facebook.parse("https://web.facebook.com/pg/Commercial-Auto-Insurance_NJ-455476741644836/about/")
    end

    it "finds correct ID when two are present" do
      result = {
        type:   "Facebook",
        id:     "701993433272856",
        format: "numeric",
      }
      assert_equal result, SocialLink::Facebook.parse("https://www.facebook.com/CHIRIOco-701993433272856/app/197250700319058/")

      result = {
        type:   "Facebook",
        id:     "167983643737385",
        format: "numeric",
      }
      assert_equal result, SocialLink::Facebook.parse("https://www.facebook.com/167983643737385/photos/192608414608241/") 

      result = {
        type:   "Facebook",
        id:     "1718345145056862",
        format: "numeric",
      }
      assert_equal result, SocialLink::Facebook.parse("https://m.facebook.com/pg/Inecosys-GmbH-1718345145056862/jobs/237004110398375/")
    end

  end

  describe "invalid cases" do

    it "fails when URL refers to login.php" do
      assert_nil SocialLink::Facebook.parse("https://www.facebook.com/login.php?next=https://www.facebook.com/app_scoped_user_id/10205777822421274/")
    end

    it "fails when other domain is specified" do
      assert_nil SocialLink::Facebook.parse("https://www.example.org/path-that-matches-facebook-0557863654")
    end

  end

end
