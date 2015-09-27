class StaffsController < ApplicationController
  def index
    @staffs = Staff.all
  end

  def show
  end
end
