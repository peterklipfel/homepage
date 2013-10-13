class LandingPagesController < ApplicationController
	def index
		@no_center = true
    @identifier = 'index'
	end

  def music
    @identifier = 'music'
  end
end
