require 'net/http'
require 'json'

uri = URI('https://api.mapbox.com/geocoding/v5/mapbox.places/Los%20Angeles.json?access_token=ENV['MAPBOX_API_KEY']')
res = Net::HTTP.get(uri) 
res_json = JSON.parse(res)

latitude = res_json["features"][0]["center"][1]
longitude = res_json["features"][0]["center"][0]
