class PostsController < ApplicationController
  #skip_before_filter :authorize
def index  
    @users= User.all
    @posts = Post.all(:order => "created_at DESC")  
    respond_to do |format|  
      format.html  
    end  
  end  
  
  def create  
    @post = Post.create(:message => params[:message])  
    respond_to do |format|  
      if @post.save  
        flash[:notice] = "Message posted"  
        #============DO CHANGES HERE redirect_to '/posts'
      else  
        flash[:notice] = "Message failed to save."  
        #============ DO CHANGES HERE redirect_to '/posts'
      end  
    end  
  end  
end
