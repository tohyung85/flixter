class StaticPagesController < ApplicationController
  def index
    @courses = Course.all    
  end

  def privacy
    
  end

  def team
    
  end

  def careers
    
  end
end
