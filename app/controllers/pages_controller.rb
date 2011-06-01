class PagesController < ApplicationController
before_filter :store_location

  def about
  	@title = "| About"
  	@nav_current = "about"
  end

  def contact
  	@title = "| Contact"
  	@nav_current = "contact"
  end
  
  def donate
  	@title = "| Donate"
  	@nav_current = "donate"
  end

end
