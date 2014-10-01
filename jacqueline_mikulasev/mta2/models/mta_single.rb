class MtaSingle
  attr_accessor :line, :departure_station, :destination_station #accessor is kind of like reader and writer put together ????

  LINES = {   #THIS IS A CONSTANT  # hash #line = key and stations = value
    'n' => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
    'l' => ['8th', '6th', 'Union Square', '3rd', '1st'],
    '6' => ['Grand Central', '33rd', '28th', 'Union Square', 'Astor Place']
  }

  def number_of_stations #defining the method
    (stations.index(destination_station) - stations.index(departure_station)).abs #abs = positive number no matter if they are going back or forwards..
  end

  def stations
    LINES[line] #calling the constant and then putting it inside an instant variable...??
  end
end

