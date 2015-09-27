#coding: utf-8
class ReservesController < ApplicationController
  before_filter :login_required
  def new
    @menu = Menu.find(params[:menus_select])
    @staff = Staff.find_by_member_id(params[:members_select])
    @year = "#{params[:period_to][:year]}"
    @month = params[:period_to][:month].to_i
    @day = params[:period_to][:day].to_i
    if @month == 1..9
      @month ="0"+"#{@month}"
    end
    if @day == 1..9
      @day ="0"+"#{@day}"
    end
    @ymd = "#{@year}" + "-" +"#{@month}" +"-"+"#{@day}"

    @shift = Shift.find_by_day_and_staff_id(@ymd,@staff.id)

    @reserves = Reserve.where(day:@ymd,staff_id:@staff.id).order("open_id")
    @my_reserves = Reserve.where(day:"#{@ymd}",member_id:@current_member.id)
    p "***************************************************************************"
    p @my_reserves
    p "***************************************************************************"


    @aki = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @available = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    if @shift.present?
      @going_time = @shift.going_time
      @leave_time = @shift.leave_time
      ((@going_time).to_i-1).times do |g|
        @aki[g] = 1
      end
      ((21-@leave_time)+1).times do |h|
        @aki[(20-h)] = 1
      end
    end

    @reserves.each do |reserve|
      mtime = reserve.menu.menu_time/30
      rtime = reserve.open_id
      mtime.times do |i|
        @aki[rtime - 1] = 1
        rtime +=1
      end
    end
    
    if @my_reserves.present?
        @my_reserves.each do |reserved|
        mtimes = reserved.menu.menu_time/30
        rtimes = reserved.open_id
        mtimes.times do |i|
          @aki[rtimes - 1] = 1
          rtimes += 1
        end
      end
    end
    
   
    if @shift.present?
      (20-(@menu.menu_time/30)+1).times do |j|
        cnt = 0
        (@menu.menu_time/30).times do |k|
          if @aki[j+k] >= 1
            cnt +=1
          end
        end
        if cnt == 0
          @available[j] = j+1
        end
      end
    end
    @opens = Open.where(id: [@available[0],@available[1],@available[2],@available[3],@available[4],@available[5],@available[6],@available[7],@available[8],@available[9],@available[10],@available[11],@available[12],@available[13],@available[14],@available[15],@available[16],@available[17],@available[18],@available[19]])
  session[:menu_id] = @menu.id
  session[:staff_id] = @staff.id
  session[:day] = @ymd
  end

  def create
    @reserve = Reserve.new(
      menu_id: session[:menu_id],
      staff_id: session[:staff_id],
      day: session[:day],
      open_id: session[:open_id],
      member_id: @current_member.id
    )
    if @reserve.save
      redirect_to root_path, notice: "予約を登録しました。"
      session.delete(:menu_id)
      session.delete(:staff_id)
      session.delete(:day)
      session.delete(:open_id)
    else
      render "new"
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    @reserve = Reserve.find(params[:id])
    @reserve.destroy
    redirect_to root_path, notice: "予約を削除しました。"
  end
  
  def index
    @reserved = Reserve.where(member_id: @current_member.id,now)
    @menus = Menu.all
    @members = Member.where("administrator = ? Or clerk = ?",true,true)
#clerk:true OR administrator:true)
  end

  def search
  end
  def check
    @menu = Menu.find(session[:menu_id])
    @staff = Staff.find(session[:staff_id])
    @ymd = session[:day]
    @open = Open.find(params[:time_select])
    session[:open_id] = @open.id
  end
end
