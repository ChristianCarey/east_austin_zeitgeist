class Comment < ApplicationRecord

  # def text_for_watson
  #   text.gsub(".", "&%&") + ". "
  # end

  # def update_tone_scores(scores)
  #   # Emotional tone
  #   self.anger = scores['tone_categories'][0]['tones'][0]['score']
  #   self.disgust = scores['tone_categories'][0]['tones'][1]['score']
  #   self.fear = scores['tone_categories'][0]['tones'][2]['score']
  #   self.joy = scores['tone_categories'][0]['tones'][3]['score']
  #   self.sadness = scores['tone_categories'][0]['tones'][4]['score']

  #   # Language tone
  #   self.analytical = scores['tone_categories'][1]['tones'][0]['score']
  #   self.confident = scores['tone_categories'][1]['tones'][1]['score']
  #   self.tentative = scores['tone_categories'][1]['tones'][2]['score']

  #   # Social Tone
  #   self.openness = scores['tone_categories'][2]['tones'][0]['score']
  #   self.conscientiousness = scores['tone_categories'][2]['tones'][1]['score']
  #   self.extraversion = scores['tone_categories'][2]['tones'][2]['score']
  #   self.agreeableness = scores['tone_categories'][2]['tones'][3]['score']
  #   self.emotional_range = scores['tone_categories'][2]['tones'][4]['score']
  #   save
  # end

  def self.all_text
    all.order(:id).map { |comment| comment.text }.join
  end

  def self.all_text_json
    { "text" => all_text }.to_json
  end

  def self.filter(category)
    category.empty? ? all : all.where(category: category)
  end
end


