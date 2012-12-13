module PostsHelper
	def post_link(date_name_tuple)
		"/blog/#{date_name_tuple[0]+"-"+date_name_tuple[1]}"
  end
  def format_date(date)
  	Time.at(date.to_i).strftime("%A %B %d, %Y")
  	# DateTime.strptime(date.to_s,'%s').to_s.match(/[^T]+/).to_s
	end
end
