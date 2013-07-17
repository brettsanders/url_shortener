class Url < ActiveRecord::Base
  # Remember to create a migration!
 before_create :shorten_url

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
