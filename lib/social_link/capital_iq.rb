module SocialLink
  module CapitalIQ

    NAME = "CapitalIQ"

    def self.parse_valid(url, parts = nil)
      parts ||= URL.parse(url)
      unless parts.host =~ /capitaliq.com$/
        return nil
      end
      case parts.query
      when /companyId=(\d+)/
        { id: $1, format: "company" }
      when /proId=(\d+)/
        { id: $1, format: "person" }
      else
        nil
      end
    end

    def self.guess_invalid(url)
      nil
    end

    def self.parse(url, parts = nil)
      parts ||= URL.parse(url)
      result = parse_valid(url, parts) || guess_invalid(url)
      result.nil? ? nil : result.merge(type: NAME)
    end

    def self.construct(id, format)
      case format
      when "company"
        "https://www.capitaliq.com/CIQDotNet/company.aspx?companyId=#{id}"
      when "person"
        "https://www.capitaliq.com/CIQDotNet/Person/PersonProfile.aspx?proId=#{id}"
      else
        nil
      end
    end

  end
end
