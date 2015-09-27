# coding: utf-8
class Clerk::MembersController < Clerk::Base
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to admin_root_path, notice: "会員を登録しました。"
      else
      render "new"
    end
  end

  def new
    @member = Member.new
  end

  def edit
    @member=Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(params[:member])
    if @member.save
      redirect_to admin_root_path, notice: "会員情報を更新しました。"
      else
      render "edit"
    end
  end

  def search
    @members = Member.search(params[:q])
    render "index"
  end
end
