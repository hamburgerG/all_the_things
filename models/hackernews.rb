class HNListing
  include MongoMapper::Document
  key :time_gotten, Time
  key :posts, Array
end