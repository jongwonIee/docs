class Question < ApplicationRecord
  # question들은 하나의 survey에 속한다.
  belongs_to :survey
  # 각각 question들은 여러개의 answer를 가지며 answer들은 question이 삭제되면 함께 삭제되도록한다.
  has_many :answers, dependent: :destroy
  # 마찬가지로 answers도 nested 속성을 부여하기 위해서 아래 코드를 적어주며 nested된 answer들의 content가 비어있으면 삭제되도록 true를 준다.
  accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes['content'].blank? }, allow_destroy: true

end
