require 'net/http'
require 'json'

addresses = ["28 foulser road", "19 concanon road", "45 gaskarth road"]
coordinates = []

addresses.each do |address|
  formatted_address = address.gsub(/ /, "%20") 

  bbox = "-0.599428,51.306690,-0.002237,51.579567"
  geocode_url = "https://api.mapbox.com/geocoding/v5/mapbox.places/" + formatted_address + ".json?types=address&bbox=" + bbox + "&access_token=" + ENV["MAPBOX_API_TOKEN"]
  geocode_uri = URI(geocode_url)
  geocode_res = Net::HTTP.get(geocode_uri) 
  geocode_res_json = JSON.parse(geocode_res)

  latitude = geocode_res_json["features"][0]["center"][1]
  longitude = geocode_res_json["features"][0]["center"][0]

  coordinates << "#{longitude},#{latitude}"
end

directions_url = "https://api.mapbox.com/directions/v5/mapbox/driving-traffic/" + coordinates.join(";") + "?steps=true&waypoints=0;" + (addresses.length - 1).to_s + "&access_token=" + ENV["MAPBOX_API_TOKEN"]
directions_uri = URI(directions_url)
directions_res = Net::HTTP.get(directions_uri) 
directions_res_json = JSON.parse(directions_res)

p directions_res_json
