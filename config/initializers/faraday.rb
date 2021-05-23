FARADAY = Faraday.new do |build|
  build.use Faraday::Response::Logger if Rails.env.development?
  build.adapter Faraday::Adapter::NetHttp
end