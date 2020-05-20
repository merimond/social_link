module SocialLink
  module PEI

    NAME = "PEI"

    def self.parse_valid(url, parts = nil)
      parts ||= URL.parse(url)
      unless parts.host =~ /privateequityinternational\.com$/
        return nil
      end
      case parts.fragment.downcase
      when /^\/profile\?id=(\d+)/
        { id: $1, format: "company" }
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
        "https://www.privateequityinternational.com/database/#/profile?id=#{id}"
      else
        nil
      end
    end

  end
end
