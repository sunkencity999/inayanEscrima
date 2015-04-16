class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	belongs_to :user
	

	


	scope :visible_to_bronze, -> {where(:bronze => true)}
	scope :visible_to_silver, -> {where(:silver => true)}
	scope :visible_to_gold, -> {where(:gold => true)}
	scope :visible_to_platinum, -> {where(:platinum => true)}
	scope :visible_to_admin, -> {where(:admin => true)}

	


end
