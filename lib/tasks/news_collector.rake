namespace :news do
  desc "Collect news from new york times and dump to mySQL"

  task :collector => :environment do
    uri = URI("https://api.nytimes.com/svc/archive/v1/2016/1.json")
    response = HTTParty.get(uri, :query => {'api-key' => "4bb8b99ee4034a3e9dda76a12c94a6dd"})
    @result = JSON.parse(response.body)
    puts @result.inspect
  end
end