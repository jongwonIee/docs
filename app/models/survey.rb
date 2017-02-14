class Survey < ApplicationRecord
  # Survey는 여러개의 questions을 가지고 각 questions는 survey가 삭제될시 함께 삭제된다.
  has_many :questions, dependent: :destroy
  # nested 속성을 사용하기 위해서 아래 코드를 적어주며, attributes 속성으로 인해 nested된 questions의 content가 비어있으면 삭제되도록 true로 준다!
  accepts_nested_attributes_for :questions, reject_if: proc { |attributes| attributes['content'].blank? }, allow_destroy: true

end
