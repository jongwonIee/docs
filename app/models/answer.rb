class Answer < ApplicationRecord
  # 각각의 answer는 하나의 question에 속한다.
  belongs_to :question
end
