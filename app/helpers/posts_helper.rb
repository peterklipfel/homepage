module PostsHelper
	def post_link(date_name_tuple)
		"/blog/#{date_name_tuple[0]+"-"+date_name_tuple[1]}"
  end
end
