class PagesController < ApplicationController
  def home
  	@title = "| Home Page & Blog"
  	@nav_current = "home"
  end

  def about
  	@title = "| About"
  	@nav_current = "about"
  end

  def blogroll
  	@title = "| Blogroll"
  	@nav_current = "blogroll"
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
