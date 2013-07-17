class Url < ActiveRecord::Base
  
before_create :shorten_url
validates :full_url, format: { with: /http[s]?:\/\/[\w\.]*/ }, 
                     presence: true

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

