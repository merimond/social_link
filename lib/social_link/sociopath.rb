module SocialLink
  module Sociopath

    NAME = "Sociopath"

    def self.parse_valid(url, parts = nil)
      parts ||= URL.parse(url)
      unless parts.host =~ /sociopath\.io$/
        return nil
      end
      case parts.path.strip.downcase
      when /^\/companies\/(\w{8}-\w{4}-\w{4}-\w{4}-\w{12})$/
        { id: $1, format: "company" }
      when /^\/people\/(\w{8}-\w{4}-\w{4}-\w{4}-\w{12})$/
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
        "https://sociopath.io/companies/#{id}"
      when "person"
        "https://sociopath.io/people/#{id}"
      else
        nil
      end
    end

  end
end
