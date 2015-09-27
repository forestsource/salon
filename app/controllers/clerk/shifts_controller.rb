# coding: utf-8
class Clerk::ShiftsController < Clerk::Base
  def index
    @shifts = Shift.where("id > ? AND staff_id = ?", 0, @current_member.staff.id ).order("day DESC")
  end

end
