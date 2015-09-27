# coding: utf-8
class Clerk::StaffsController < Clerk::Base
  def search
  end

  def index
    @staffs = Staff.all
  end

  def edit
  end

  def update
  end

end
