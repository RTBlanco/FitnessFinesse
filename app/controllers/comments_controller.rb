class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        #how do i check if its nested?
        if param[:post_id] &&   #then it's nested
            @comments = @post.comments
        else
        @comments = Comment.all
        end
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
          redirect_toredirect_to comments_path
        else
          render :new
        end
      end


    def show
        @comment = Comment.find_by(id: params[:id])
    end

    def edit
        @comment = Comment.find_by(id: params[:id])
    before_save {self.email = email.downcase}
    
    def update
        @comment = Comment.find_by(id: params[:id])
        