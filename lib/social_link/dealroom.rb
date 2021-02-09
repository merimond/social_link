module SocialLink
  module Dealroom

    NAME = "Dealroom"

    def self.parse_valid(url, parts = nil)
      parts ||= URL.parse(url)
      unless parts.host =~ /dealroom\.co$/
        return nil
      end
      case parts.path.strip.downcase
      when /^\/companies\/(\d+)$/
        { id: $1, format: "company-numeric" }
      when /^\/companies\/(\d+)\/(.+)/
        { id: $1, format: "company-numeric" }
      when /^\/companies\/(.+)/
        { id: $1, format: "company-slug" }
      when /^\/people\/(\d+)/
        { id: $1, format: "person-numeric" }
      when /^\/people\/(.+)/
        { id: $1, format: "person-slug" }
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
      when "company-numeric"
        "https://app.dealroom.co/companies/#{id}"
      when "company-slug"
        "https://app.dealroom.co/companies/#{id}"
      when "person-numeric"
        "https://app.dealroom.co/people/#{id}"
      when "person-slug"
        "https://app.dealroom.co/people/#{id}"
      else
        nil
      end
    end

  end
end
