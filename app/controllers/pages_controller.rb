class PagesController < ApplicationController
  def index
    puts params.keys.first.class
  end

end
