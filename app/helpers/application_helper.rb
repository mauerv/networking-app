module ApplicationHelper
	def shortify(string, characters)
		"#{string[0, characters]}..."
	end

	def bootstrap_pagination(collection)
		will_paginate(collection, :renderer => WillPaginate::ActionView::Bootstrap4LinkRenderer,
								  class: 'd-flex justify-content-center justify-content-md-start justify-content-xs-center')
	end
end