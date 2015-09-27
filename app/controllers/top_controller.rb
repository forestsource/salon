class TopController < ApplicationController
  def index
  end

  def show
    @staff = Staff.find(1)
  end
end
