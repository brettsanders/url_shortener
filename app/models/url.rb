class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_create :shorten_url
  
  def shorten_url
    
  end
end
