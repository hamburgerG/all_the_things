class HNSnap
  include MongoMapper::Document
  key :time_snapped, Time
  key :items, Array
end