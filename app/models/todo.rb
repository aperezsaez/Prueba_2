class Todo < ApplicationRecord
	has_many :checklists
	has_many :users, through: :checklists

	def done?(user)
    checklists.where(user: user).any? ? true : false
  end
end
