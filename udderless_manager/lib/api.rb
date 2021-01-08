require 'net/http'
require 'json'

uri = URI('https://api.mapbox.com/geocoding/v5/mapbox.places/Los%20Angeles.json?access_token=pk.eyJ1Ijoib2xsaWVzbWl0aDMiLCJhIjoiY2tqb2F3Mjl2MG0zODJ2bzh6N2M5amhsYyJ9.SLfdB1v8E9dTi0-dCxt9ag')
res = Net::HTTP.get(uri) 
res_json = JSON.parse(res)

latitude = res_json["features"][0]["center"][1]
longitude = res_json["features"][0]["center"][0]
