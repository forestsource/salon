# coding: utf-8
class Admin::StaffsController < Admin::Base
  def index
    @staffs = Staff.all
  end

  def new
    @staff= Staff.new
    @C_all = Category.all
    @categories = Array.new
    @C_all.each do |c|
      @categories.push([c.category_name , c.id])
    end
    session[:new] = true
  end

  def create
    #オブジェクト再構成 (symnolを抜く)
    @staff = Staff.new(
      member_id: session[:staff][:member_id],
      category_id: session[:staff][:category_id],
      intro_myself: session[:staff][:intro_myself],
      interest: session[:staff][:interest],
      staff_image: session[:staff][:staff_image]
    )
    @member = session[:member] #memberの店員フラグをtrueに変更
    #@staff.member = @member #関係
    @member.clerk = true
    if @staff.save && @member.save
      flash[:notice] = "スタッフを登録しました。"
      redirect_to :action => "index"
      session.delete(:member)
      session.delete(:staff)
      session.delete(:new)
    else
      render "new"
    end
  end
  
  def update
    if params[:staff].present?
      @staff_new  = params[:staff]
      if params[:staff][:staff_image].present?
    #画像を保存する。
        file = @staff_new[:staff_image]
        name = file.original_filename
        if !['.jpg', '.gif', '.png'].include?(File.extname(name).downcase)
          msg = 'アップロードできるのは画像だけ'
        elsif file.size > 10.megabyte
          msg = 'アップロードは10メガバイトまで'
        else
          require 'kconv'
          name = name.kconv(Kconv::SJIS, Kconv::UTF8)
          File.open("app/assets/images/staff_image/#{name}", 'wb') { |f| f.write(file.read) }
           "#{name.toutf8}のアップロードに成功しました"
        end
        @staff_new[:staff_image] = name.to_s
      end
    #ここまで
    end
    #オブジェクト再構成 (symnolを抜く)
    @staff = session[:staff]
    @staff.category_id = @staff_new[:category_id]
    @staff.intro_myself = @staff_new[:intro_myself]
    @staff.interest = @staff_new[:interest]
    if @staff_new[:staff_image].present?
      @staff.staff_image = @staff_new[:staff_image]
    end
  
    if @staff.save
      flash[:notice] = "スタッフ情報を変更しました。"
      redirect_to :action => "index"
      session.delete(:member)
      session.delete(:staff)
      session.delete(:new)
    else
      render "edit"
    end
  end

  def destroy
    @staff = Staff.find_by_id(params[:id])
    @member = Member.find_by_id(@staff.member_id)
    @member.clerk = false #memberの店員フラグをfalseに変更
    if @member.save
      @staff.destroy
      flash[:notice] = "スタッフを削除しました。"
      redirect_to :action => "index"
    end
  end
  
  def edit
    @staff = Staff.find_by_id(params[:id])
    session[:staff] = @staff
    @C_all = Category.all
    @categories = Array.new
    @C_all.each do |c|
      @categories.push([c.category_name , c.id])
    end
    session[:new] = false
  end
  
  def check
    if params[:staff].present?
      @staff  = params[:staff]
      if params[:staff][:staff_image].present?
    #画像を保存する。
        file = @staff[:staff_image]
        name = file.original_filename
        if !['.jpg', '.gif', '.png'].include?(File.extname(name).downcase)
          msg = 'アップロードできるのは画像だけ'
        elsif file.size > 10.megabyte
          msg = 'アップロードは10メガバイトまで'
        else
          require 'kconv'
          name = name.kconv(Kconv::SJIS, Kconv::UTF8)
          File.open("app/assets/images/staff_image/#{name}", 'wb') { |f| f.write(file.read) }
           "#{name.toutf8}のアップロードに成功しました"
        end
        @staff[:staff_image] = name.to_s
      end
    #ここまで
    
      @member = Member.find(@staff[:member_id])
      @member_name = @member.name
      session[:member] = @member
      session[:staff]  = @staff
      @category = Category.find(@staff[:category_id])
      @new = false
      if session[:new]
        session.delete(:new)
        @new = true
      end
    end
  end
    
end
