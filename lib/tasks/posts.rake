namespace :posts do
  desc "Usage -> rake posts:new[the_title_of_your_post]"
  task :new, :filename do |t, args|
  	time_stamp = Time.now.to_i
    sh "touch #{Rails.root}/posts/#{time_stamp.to_s + "_" + args["filename"].to_s}.md"
    sh "echo '# #{args["filename"].split("_").each{|word| word.capitalize!}.join(" ")}' >> #{Rails.root}/posts/#{time_stamp.to_s + "_" + args["filename"].to_s}.md"
  end
end