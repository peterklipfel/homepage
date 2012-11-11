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
    @content = File.read("#{Rails.root}/posts/#{params[:id]}.md")
    # @content = ERB.new(preERB).result(binding)

    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,autolink: true, 
                                                                space_after_headers: true, 
                                                                fenced_code_blocks:true)

    respond_to do |format|
      format.html # show.html.erb
    end
  end

protected

  def find_all
    entries = Dir.entries("./posts")  
    entries.delete(".")
    entries.delete("..") 
    entries 
  end

end