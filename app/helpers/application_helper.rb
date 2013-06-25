module ApplicationHelper
	def all_categories
		Category.all
	end

	def all_colors
		Color.all
	end
end

