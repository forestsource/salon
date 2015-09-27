class MembersController < ApplicationController
  def create
  end

  def new
    @member = Member.new
  end
end
