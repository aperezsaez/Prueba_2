class Checklist < ApplicationRecord
  belongs_to :user
  belongs_to :todo

end
