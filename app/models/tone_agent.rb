class ToneAgent
  include HTTParty

  BASE_URI = "https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19"


  def scores_for(json)
    response = self.class.post(BASE_URI, 
                               body: json,
                               sentences: false,
                               headers: { "Content-Type" => "application/json" },
                               basic_auth: { username: ENV['tone_username'],   
                                             password: ENV['tone_password'] })
    # ToneResponse.new(JSON.parse(response.body))
    JSON.parse(response.body)
  end
end