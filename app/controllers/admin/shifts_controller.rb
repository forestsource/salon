# coding: utf-8
class Admin::ShiftsController < Admin::Base
  def index
    @shifts = Shift.where("id >= ?",1).order("day DESC")
  end

  def search
  end

  def create
    @shift = Shift.new(
      staff_id: session[:staff_id],
      day: session[:shift_day],
      going_time: session[:going],
      leave_time: session[:leave]
    )
    if @shift.save
      redirect_to :action => "index"
      flash[:notice]= "シフトを登録しました。"
      session.delete(:staff_id)
      session.delete(:staff)
      session.delete(:shift_day)
      session.delete(:going)
      session.delete(:leave)
    else
      render "new"
    end
  end

  def new
    @shift = Shift.new
    @times = Open.all
    @clerks = Member.where("clerk = ?", true)
  end

  def check
    @year = "#{params[:shift_day][:year]}"
    @month = params[:shift_day][:month].to_i
    @day = params[:shift_day][:day].to_i
    
    if @month == 1..9
      @month ="0"+"#{@month}"
    end
    if @day == 1..9
      @day ="0"+"#{@day}"
    end
    @ymd = "#{@year}" + "-" +"#{@month}" +"-"+"#{@day}"
    @going = Open.find(params[:going_select])
    @leave = Open.find(params[:leave_select])
    #@staff = Staff.find_by_member_id(params[:clerk_select])
    @member = Member.find_by_id(params[:staff_select])
    @staff = Staff.find_by_member_id(params[:staff_select])
    session[:staff_id] = @staff.id
    @staff_name = @member.name
    
    session[:shift_day] = @ymd
    session[:going] = @going.id
    session[:leave] = @leave.id
  end
  
end
