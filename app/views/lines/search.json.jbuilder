json.array!(@lines) do |line|
  json.id           line.id
  json.code         line.code
  json.itinerary    line.itinerary
  json.company      line.company
  json.terminal     line.terminal
  json.map_id       line.map_id
  json.kml_filename line.kml_filename
end