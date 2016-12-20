class CommentsController < ApplicationController
  def index
    @selected_categories = params[:categories] ? params[:categories] : []
    @selected_themes     = params[:themes] ? params[:themes] : []
    @comments   = Comment.filter(category: @selected_categories, theme: @selected_themes)
    @categories = CATEGORIES
    @themes     = THEMES
    @scores     = get_scores
    # @scores     = MOCK_RESPONSE
  end

  private

  def get_scores
    ToneAgent.new.scores_for(text_json)
  end

  def text_json
    { "text" => @comments.map { |comment| comment.text }.join }.to_json
  end

  mock_response = Struct.new(:emotional_tone, :language_tone, :social_tone)
  
  MOCK_RESPONSE = mock_response.new(
    { anger: 1, sadness: 2 },
    { something: 1, different: 4 },
    { another: 2, more: 1, again: 3}
  )

  CATEGORIES = [ "Personal Experience", "Resources",
                 "Wisdom", "Ideas I Bring", "What's Missing",
                "Why Am I here?", "One Thing To Improve" ]

  THEMES = [ "Jobs, Employment and Training", "Education", "Food Access", 
             "Business", "Justice and Law Enforcement", "Family Support",
             "Housing and Affordability" ]
end
