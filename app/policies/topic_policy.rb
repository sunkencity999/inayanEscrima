class TopicPolicy < ApplicationPolicy 

	def index?
		true
	end

	def show?
		record.present? && user.present?
	end

	def create?
		user.present? && user.admin?
	end

	def update?
		create?
	end

	def destroy?
		update?
	end

	def bronze?
		@user.role? == 'bronze' || 'admin'
	end

	def silver?
		@user.role? == 'silver' || 'admin'
	end

	def gold?
		@user.role? == 'gold' || 'admin'
	end

	def platinum?
		@user.role? == 'platinum' || 'admin'
	end

	
end