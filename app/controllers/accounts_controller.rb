# coding: utf-8
class AccountsController < ApplicationController
  before_filter :login_required
  def show
    @member = @current_member
  end

  def edit
    @member = @current_member
  end

  
end
