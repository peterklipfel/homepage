class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @files = find_all.sort.reverse
    @date_post_name = []
    @files.each do |file_name|
      post_name = file_name.gsub(/.*?(?=-)/im, "").gsub("-", "")
      date = file_name.match(/[^-]+/).to_s
      @date_post_name << [date, post_name]
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
  end

  def capstone
    @files = find_all.sort.reverse
    @date_post_name = []
    @files.each do |file_name|
      post_name = file_name.gsub(/.*?(?=-)/im, "").gsub("-", "")
      if post_name.include? "capstone"
        date = file_name.match(/[^-]+/).to_s
        @date_post_name << [date, post_name]
      end
    end

    respond_to do |format|
      format.html # index.html.erb
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