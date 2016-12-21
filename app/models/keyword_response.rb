class KeywordResponse
  attr_reader :words 
  
  def initialize(response_body)
    @response_body = response_body
    @words = {}
    unless response_body['status'] == "ERROR"
      set_words
    end
  end

  def set_words
    @response_body['keywords'].each do |word|
      @words[word['text']] = word['relevance']
    end
  end
end