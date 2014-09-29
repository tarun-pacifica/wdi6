json.array!(@moviies) do |moviie|
  json.extract! moviie, :id, :title, :obtained, :released, :rating, :description
  json.url moviie_url(moviie, format: :json)
end
