class ToneResponse
  attr_reader :emotional_tone, 
              :language_tone, 
              :social_tone

  def initialize(response_body)
    @response_body = response_body
    if response_body['error']
      set_empty_hashes
    else
      set_tone_hashes
    end
  end

  private

  def set_empty_hashes
    @emotional_tone = {}
    @language_tone  = {}
    @social_tone    = {}
  end

  def set_tone_hashes
    set_emotional_tone
    set_language_tone
    set_social_tone
  end

  def set_emotional_tone
    @emotional_tone = {
      anger:   score_at(0,0),
      disgust: score_at(0,1),
      fear:    score_at(0,2),
      joy:     score_at(0,3),
      sadness: score_at(0,4)
    }
  end

  def set_language_tone
    @language_tone = {
      analytical: score_at(1,0),
      confident:  score_at(1,1),
      tentative:  score_at(1,2)
    }
  end

  def set_social_tone
    @social_tone = {
      openness:          score_at(2,0),
      conscientiousness: score_at(2,1),
      extraversion:      score_at(2,2),
      agreeableness:     score_at(2,3),
      emotional_range:   score_at(2,4)   
    }
  end

  def score_at(category_index, tone_index)
    @response_body['document_tone']['tone_categories'][category_index]['tones'][tone_index]['score']
  end
end