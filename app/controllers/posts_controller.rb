class PostsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
      @post = Post.new
    end

    def create
        @post = Post.new(user_params)
        if @user.save
            redirect_to @user
        else
          render :new
        end
    end


    private

    def post_params
        params.require(:post).permit(:title,:content)
    end
end
