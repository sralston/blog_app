module PostsHelper

	def date_flag(curr)
		raw("<div class='date_flag'>#{ curr.strftime("%m-%d<br />%Y") }</div>")
	end

end
