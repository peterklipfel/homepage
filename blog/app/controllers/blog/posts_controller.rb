require_dependency "blog/application_controller"

module Blog
  class PostsController < ApplicationController
    # GET /posts
    # GET /posts.json
    def index
      @posts = find_all
      @posts.collect! do |post|
        post.match(/\A[^\.]+/).to_s
      end
  
      respond_to do |format|
        format.html # index.html.erb
      end
    end
  
    # GET /posts/1
    # GET /posts/1.json
    def show
      @post = params[:id]
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @post }
      end
    end

protected

    def find_all
      entries = Dir.entries("./posts")  
      entries.delete(".")
      entries.delete("..") 
      entries 
    end

    def find(name)
      Dir.entries("./posts")
    end

  end
end
