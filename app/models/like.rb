class Like < ApplicationRecord
    belongs_to :user, :foreign_key => "user_id", :class_name => "User"
    belongs_to :likee, :foreign_key => "likee_id", :class_name => "User"
end
