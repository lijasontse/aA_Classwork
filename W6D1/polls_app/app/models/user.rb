# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

    has_many :responses,
        foreign_key: :respondent_id,
        class_name: :Response
    
    has_many :authored_polls,
        foreign_key: :author_id,
        class_name: :Poll
end
