# == Schema Information
#
# Table name: questions
#
#  id      :integer          not null, primary key
#  text    :string           not null
#  poll_id :integer          not null
#
class Question < ApplicationRecord

    belongs_to :poll,
        foreign_key: :poll_id,
        class_name: :Poll
    
    has_many :answer_choices,
        foreign_key: :question_id,
        class_name: :AnswerChoice
end
