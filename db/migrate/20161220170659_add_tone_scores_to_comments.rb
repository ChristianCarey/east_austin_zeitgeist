class AddToneScoresToComments < ActiveRecord::Migration[5.0]
  def change
    # Emotional tone
    add_column :comments, :anger, :float
    add_column :comments, :disgust, :float
    add_column :comments, :fear, :float
    add_column :comments, :joy, :float
    add_column :comments, :sadness, :float

    # Language tone
    add_column :comments, :analytical, :float
    add_column :comments, :confident, :float
    add_column :comments, :tentative, :float

    # Social Tone
    add_column :comments, :openness, :float
    add_column :comments, :conscientiousness, :float
    add_column :comments, :extraversion, :float
    add_column :comments, :agreeableness, :float
    add_column :comments, :emotional_range, :float
  end
end