class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        #how do i check if its nested?
        if params[:post_id] 
            @post = Post.find_by_id(params[:post_id])
            if @post #then it's nested
               @comments = @post.comments
            else
                flash[:message] = "That post doesn't exist"
                @comments = Comment.all
            end
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
        