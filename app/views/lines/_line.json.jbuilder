json.extract! line, :id, :code, :itinerary, :company, :terminal, :map_id, :kml_filename, :created_at, :updated_at
json.url line_url(line, format: :json)
