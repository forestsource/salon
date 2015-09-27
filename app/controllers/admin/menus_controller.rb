#coding: utf-8
class Admin::MenusController < Admin::Base
  def index
    @menus = Menu.all
    @categories = Category.all
  end

  def create
    @menu = session[:menu]
    if @menu.save
      redirect_to :action => "index"
      flash[:notice]= "メニューを登録しました。"
      session.delete(:menu)
    else
      @categories = Category.all
      render "new"
    end
  end

  def new
    @menu = Menu.new
    @C_all = Category.all
    @categories = Array.new
    @C_all.each do |c|
      @categories.push([c.category_name , c.id])
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash[:notice]= "メニューを削除しました。"
    redirect_to :action => "index"
  end

  def check
    @menu = Menu.new(params[:menu])
    @category_name = Category.find(@menu.category_id).category_name
    session[:menu] =@menu
  end
  
  def edit
    @menu = Menu.find_by_id(params[:id])
    @C_all = Category.all
    @categories = Array.new
    @C_all.each do |c|
      @categories.push([c.category_name , c.id])
    end
  end
  
  def update
    @menu = Menu.find(params[:id])
    @menu.assign_attributes(params[:menu])
    @menu.save
    flash[:notice]= "メニューを更新しました。"
    redirect_to :action => "index"
  end
end
