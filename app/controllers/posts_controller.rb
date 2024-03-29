class PostsController < ApplicationController
  #skip_before_filter :authorize
def index  
    @user= current_user
    #@posts = Post.all(:order => "created_at DESC")  
    respond_to do |format|  
      format.html  
    end  
  end   
  
  def create  
    @post = Post.create(:message => params[:message],:by => current_user.id)  
    respond_to do |format|  
      if @post.save  
        format.js  { render :json => @post, :status => :created }
        format.html{ redirect_to("/",:notice => 'Posted')}
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else 
        format.js  { render :json => @post.errors, :status => :unprocessable_entity } 
        redirect_to :back #solve the issue
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end  
    end  
  end  

  def destroy
    @post=Post.find_by_id(params[:id])
    @post.destroy
      respond_to do |format|
        format.html{ redirect_to("/",:notice => 'Deleted')}
      end
  end
end

