class CommentsController < ApplicationController
  def index
    @selected_categories = params[:categories] ? params[:categories] : []
    @selected_themes     = params[:themes] ? params[:themes] : []
    @comments   = Comment.filter(category: @selected_categories, theme: @selected_themes)
    @categories = CATEGORIES
    @themes     = THEMES
    @scores     = get_scores
    @keywords   = get_keywords
  end

  private

  def get_scores
    ToneAgent.new.scores_for(comments_text_json)
  end

  def comments_text_json
    { "text" => comments_text }.to_json
  end

  def comments_text
    @comments.map { |comment| comment.text }.join
  end

  def get_keywords
    KeywordAgent.new.keywords_for(comments_text)
  end

  CATEGORIES = [ "Personal Experience", "Resources",
                 "Wisdom", "Ideas I Bring", "What's Missing",
                "Why Am I here?", "One Thing To Improve" ]

  THEMES = [ "Jobs, Employment and Training", "Education", "Food Access", 
             "Business", "Justice and Law Enforcement", "Family Support",
             "Housing and Affordability" ]
end
