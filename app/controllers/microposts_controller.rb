class MicropostsController < ApplicationController
    before_action :logged_in_user, only:[:index, :create, :destroy]
    before_action :correct_user, only: :destroy
    before_action :admin_user, only: [:index, :destroy ]  
    
    def index
        @microposts = Micropost.all
    end
    
    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
           flash[:success]  = "Post created!"
           redirect_to root_url
        else
            @feed_items = []
            render 'static_pages/home'   
        end
    end
    
    def destroy
        @micropost.destroy
        flash[:success] = "Micropost deleted"
        redirect_to request.referrer || root_url
    end
    
    private 
        
        def micropost_params
           params.require(:micropost).permit(:content, :video)
        end
        
        def correct_user
            @micropost = current_user.microposts.find_by(id: params[:id])
            redirect_to root_url if @micropost.nil?
        end
        
        def admin_user
            redirect_to(root_url)  unless current_user.admin?
        end
        
end
