class PagesController < ApplicationController
  def home
  	@title = "| Home Page & Blog"
  end

  def about
  	@title = "| About"
  end

  def blogroll
  	@title = "| Blogroll"
  end

  def articles
  	@title = "| Articles"
  end

end
