# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :color, inclusion: { in: %w(white black calico orange grey brown),
    message: "Not a valid color"}
  validates :sex, inclusion: { in: %w(M F),
    message: "Not a valid sex"}
  validates :birth_date, :name, presence: true

  def age
    time_ago_in_words(birth_date)
  end
end
