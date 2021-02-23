# == Schema Information
#
# Table name: polls
#
#  id        :integer          not null, primary key
#  author_id :integer          not null
#  title     :string           not null
#
class Poll < ApplicationRecord

    has_many :questions,
        foreign_key: :poll_id,
        class_name: :Question
    
    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User
end
