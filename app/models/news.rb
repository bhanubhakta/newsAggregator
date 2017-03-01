class News
  include Mongoid::Document
  field :web_url, type: String
  field :snippet, type: String
  field :lead_paragraph, type: String
  field :source, type: String
  field :headline, type: Hash
  field :keywords, type: Array
  field :year, type: Integer
  field :month, type: Integer
end