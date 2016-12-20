class RemoveScoresFromComments < ActiveRecord::Migration[5.0]
  def change
     # Emotional tone
    remove_column :comments, :anger
    remove_column :comments, :disgust
    remove_column :comments, :fear
    remove_column :comments, :joy
    remove_column :comments, :sadness

    # Language tone
    remove_column :comments, :analytical
    remove_column :comments, :confident
    remove_column :comments, :tentative

    # Social Tone
    remove_column :comments, :openness
    remove_column :comments, :conscientiousness
    remove_column :comments, :extraversion
    remove_column :comments, :agreeableness
    remove_column :comments, :emotional_range
  end
end
