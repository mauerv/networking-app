module ApplicationHelper
	def shortify(str, chars)
		if str.length > chars
			"#{str[0, chars]}..."
		else str
		end
	end

	def bootstrap_pagination(collection)
		will_paginate(collection, :renderer => WillPaginate::ActionView::Bootstrap4LinkRenderer,
								  class: 'd-flex justify-content-center justify-content-md-start justify-content-xs-center')
	end
end