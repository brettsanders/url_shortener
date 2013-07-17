class Url < ActiveRecord::Base
  # Remember to create a migration!
 before_create :shorten_url
 validates :full_url, format: { with: } 

private

  def random_short_url
    short_url = ""
    6.times { short_url += rand(100).to_s }
    short_url
  end

  def shorten_url
    self.short_url = random_short_url
  end
end

# Any non-empty string
# Any non-empty string that starts with "http://" or "https://"
# Any string that the Ruby URI module says is valid
# Any URL-looking thing which responds to a HTTP request, 
# i.e., we actually check to see if the URL is accessible via HTTP
