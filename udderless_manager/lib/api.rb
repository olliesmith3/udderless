require 'net/http'
require 'json'

search = "28 foulser road"
formatted_search = search.gsub(/" "/, "%20")

url = "https://api.mapbox.com/geocoding/v5/mapbox.places/" + formatted_search + ".json?types=address&bbox=-0.599428,51.306690,-0.002237,51.579567&access_token=" + ENV["MAPBOX_API_TOKEN"]
uri = URI(url)
res = Net::HTTP.get(uri) 
res_json = JSON.parse(res)

latitude = res_json["features"][0]["center"][1]
longitude = res_json["features"][0]["center"][0]
