module Validate
  class ValidateUrlService
    attr_accessor :url

    def initialize url
      @url = url
    end

    def process!
      domain = extract_domain
      v = DomainNameValidator.new
      if v.validate(domain)
        Url.create(address: domain)
        return true
      else
        return false
      end
    end

    def extract_domain
      @url = @url.gsub("https://", '').gsub("http://", '').gsub('www.','')
      @url = @url.split('/')[0]
    end

  end
end
