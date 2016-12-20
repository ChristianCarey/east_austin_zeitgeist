class KeywordAgent
  include HTTParty

  BASE_URI = "https://gateway-a.watsonplatform.net/calls/text/TextGetRankedKeywords"


  def keywords_for(text)
    response = self.class.post(BASE_URI, 
                              body: { apikey: ENV['alchemy_key'],
                                      text: text,
                                      outputMode: 'json',
                                      maxRetrieve: "10" },
                              headers: { "Accept-Encoding" => "" })
    KeywordResponse.new(JSON.parse(response.body))
  end
end