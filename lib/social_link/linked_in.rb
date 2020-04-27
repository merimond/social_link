module SocialLink
  module LinkedIn

    NAME = "LinkedIn"

    def self.parse_query_based_formats(query)
      case query
      when /^id=(\d+)/
        { id: $1, format: "personal-numeric" }
      when /^id=(A[^&]+)/
        { id: $1, format: "personal-alphanumeric" }
      else
        nil
      end
    end

    def self.parse_valid(url, parts = nil)
      parts ||= URL.parse(url)
      unless parts.host =~ /linkedin.com$/
        return nil
      end
      case parts.path.strip.downcase
      when /^\/company-beta\/(\d+)\/?$/
        { id: $1, format: "company-numeric" }
      when /^\/company\/(\d+)$/
        { id: $1, format: "company-numeric" }
      when /^\/company\/(\d+)\//
        { id: $1, format: "company-numeric" }
      when /^\/company\/([^\/]+)\/?/
        { id: $1, format: "company-slug" }
      when /^\/in\/([^\/]+)\/?/
        { id: $1, format: "personal-slug" }
      when /^\/pub\/([^\/]+\/\w{1,3}\/\w{1,3}\/\w{1,3})\/?/
        { id: $1, format: "personal-old" }
      when /^\/profile\/view/
        parse_query_based_formats(parts.query)
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
        "https://linkedin.com/company/#{id}"
      when "company-slug"
        "https://linkedin.com/company/#{id}"
      when "personal-old"
        "https://linkedin.com/pub/#{id}"
      when "personal-slug"
        "https://linkedin.com/in/#{id}"
      when "personal-alphanumeric"
        "http://www.linkedin.com/profile/view?id=#{id}"
      when "personal-numeric"
        "http://www.linkedin.com/profile/view?id=#{id}"
      else
        nil
      end
    end

  end
end
