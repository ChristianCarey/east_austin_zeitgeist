class Comment < ApplicationRecord

  def self.all_text
    all.map { |comment| puts comment.text }.join
  end
end
