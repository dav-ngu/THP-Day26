class PageController < ApplicationController
  def show
    puts @gossips = Gossip.all
  end
end

