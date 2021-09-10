class UserProject < ApplicationRecord
belongs_to :user
belongs_to :project
belongs_to :ingredient
belongs_to :category
end
