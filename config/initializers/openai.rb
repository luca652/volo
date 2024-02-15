OpenAI.configure  do |config|
  config.access_token = ENV.fetch('OPENAI_API_KEY')
end

$open_ai_client = OpenAI::Client.new
