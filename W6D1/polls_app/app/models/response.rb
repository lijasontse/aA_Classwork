# == Schema Information
#
# Table name: responses
#
#  id                :integer          not null, primary key
#  answer_choices_id :integer          not null
#  respondent_id     :integer          not null
#
class Response < ApplicationRecord

    belongs_to :respondent,
        foreign_key: :respondent_id,
        class_name: :User

    belongs_to :answer_choice,
        foreign_key: :answer_choices_id,
        class_name: :AnswerChoice
end
