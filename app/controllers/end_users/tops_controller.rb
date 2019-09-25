class EndUsers::TopsController < ApplicationController

  def top
     @all_ranks = Movie.create_all_ranks
  end

end
