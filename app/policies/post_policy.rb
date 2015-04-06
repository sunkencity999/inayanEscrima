class PostPolicy < ApplicationPolicy

	def show?
		user.present?
	end

end