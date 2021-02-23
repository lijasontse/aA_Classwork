# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  text        :text             not null
#  question_id :integer          not null
#
class AnswerChoice < ApplicationRecord

    has_many :responses,
        foreign_key: :answer_choices_id,
        class_name: :Response
    
    belongs_to :question,
        foreign_key: :question_id,
        class_name: :Question
end
