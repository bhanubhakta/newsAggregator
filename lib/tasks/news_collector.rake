namespace :news do
  desc "Collect news from new york times and dump to mySQL"

  task :collector => [:environment] do
    year = ENV['year']
    month = ENV['month']
    uri = URI("https://api.nytimes.com/svc/archive/v1/#{year}/#{month}.json")
    response = HTTParty.get(uri, :query => {'api-key' => "4bb8b99ee4034a3e9dda76a12c94a6dd"})
    @result = JSON.parse(response.body)["response"]["docs"]
    @result.each do |result|
      web_url = result['web_url']
      source = result['source']
      snippet = result['snippet']
      headline = result['headline']
      keywords = result['keywords']
      lead_paragraph = result['lead_paragraph']
      News.create(web_url: web_url, source: source, snippet: snippet, headline: headline, keywords: keywords, lead_paragraph: lead_paragraph, year: year, month: month)
    end
    puts "#{@result.count} records create for #{year} #{month}"
  end
end