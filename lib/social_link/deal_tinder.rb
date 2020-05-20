module SocialLink
  module DealTinder

    NAME = "DealTinder"

    def self.parse_valid(url, parts = nil)
      parts ||= URL.parse(url)
      unless parts.host =~ /dealtinder.com$/
        return nil
      end
      case parts.path.strip.downcase
      when /^\/companies\/(\w{8}-\w{4}-\w{4}-\w{4}-\w{12})/
        { id: $1, format: "company-uuid" }
      when /^\/companies\/([^\/]+)/
        { id: $1, format: "company-slug" }
      when /^\/people\/(\w{8}-\w{4}-\w{4}-\w{4}-\w{12})/
        { id: $1, format: "person-uuid" }
      when /^\/people\/([^\/]+)/
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
      when "company-uuid"
        "https://dealtinder.com/companies/#{id}"
      when "company-slug"
        "https://dealtinder.com/companies/#{id}"
      when "person-uuid"
        "https://dealtinder.com/people/#{id}"
      when "person-slug"
        "https://dealtinder.com/people/#{id}"
      else
        nil
      end
    end

  end
end
