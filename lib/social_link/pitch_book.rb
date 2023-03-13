module SocialLink
  module PitchBook

    NAME = "PitchBook"

    def self.parse_valid(url, parts = nil)
      parts ||= URL.parse(url)
      unless parts.host =~ /pitchbook\.com$/
        return nil
      end
      case parts.path.strip
      when /^\/profiles\/advisor\/([\d-]+)($|\/)/i
        { id: $1, format: "advisor-numeric" }
      when /^\/profiles\/company\/([\d-]+)($|\/)/i
        { id: $1, format: "company-numeric" }
      when /^\/profiles\/fund\/([\d-]+F)($|\/)/i
        { id: $1, format: "fund" }
      when /^\/profiles\/investor\/([\d-]+)($|\/)/i
        { id: $1, format: "investor-numeric" }
      when /^\/profiles\/limited-partner\/([\d-]+)($|\/)/i
        { id: $1, format: "limited-partner-numeric" }
      when /^\/profiles\/person\/([\d-]+P)($|\/)/i
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
      when "advisor-numeric"
        "https://pitchbook.com/profiles/advisor/#{id}"
      when "company-numeric"
        "https://pitchbook.com/profiles/company/#{id}"
      when "fund-numeric"
        "https://pitchbook.com/profiles/fund/#{id}"
      when "investor-numeric"
        "https://pitchbook.com/profiles/investor/#{id}"
      when "limited-partner-numeric"
        "https://pitchbook.com/profiles/limited-partner/#{id}"
      when "person-numeric"
        "https://pitchbook.com/profiles/person/#{id}"
      else
        nil
      end
    end

  end
end
