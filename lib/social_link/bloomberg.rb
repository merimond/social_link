module SocialLink
  module Bloomberg

    NAME = "Bloomberg"

    def self.parse_valid(url, parts = nil)
      parts ||= URL.parse(url)
      unless parts.host =~ /bloomberg.com$/
        return nil
      end
      case parts.path.strip
      when /^\/profile\/company\/([a-z0-9]{2,8}:[a-z]{2})$/i
        { id: $1, format: "company-ticker" }
      when /^\/profile\/company\/([a-z0-9]{2,8}:[a-z]{2})-/i
        { id: $1, format: "company-ticker" }
      when /^\/profiles\/people\/([\d]+)$/i
        { id: $1, format: "person-numeric" }
      when /^\/profiles\/people\/([\d]+)-/i
        { id: $1, format: "person-numeric" }
      when /^\/profile\/person\/([\d]+)$/i
        { id: $1, format: "person-numeric" }
      when /^\/profile\/person\/([\d]+)-/i
        { id: $1, format: "person-numeric" }
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
      when "company-ticker"
        "https://bloomberg.com/profile/company/#{id}"
      when "person-numeric"
        "https://bloomberg.com/profile/person/#{id}"
      else
        nil
      end
    end

  end
end
