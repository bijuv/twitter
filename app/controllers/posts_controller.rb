class PostsController < ApplicationController
  #skip_before_filter :authorize
def index  
    @user= current_user
    @posts = Post.all(:order => "created_at DESC")  
    respond_to do |format|  
      format.html  
    end  
  end   
  
  def create  
    @post = Post.create(:message => params[:message],:by => current_user)  
    respond_to do |format|  
      if @post.save  
        redirect_to :back # solve the issue
      else  
        redirect_to :back #solve the issue
      end  
    end  
  end  
end

