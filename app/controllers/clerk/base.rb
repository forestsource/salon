# coding: utf-8

class Clerk::Base < ApplicationController
  before_filter :clerk_login_required

  private
  def clerk_login_required
    raise Forbidden unless @current_member.try(:clerk?)
  end
end
