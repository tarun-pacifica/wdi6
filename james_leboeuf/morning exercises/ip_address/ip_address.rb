# class Ip

#   def initialize(address)
#     @address = address
#   end

#   def regex
#     regex = /^\d{1,3}\......+/ 
#   end

#   def match
#     if regex.match(@address)
#       p "Valid IP"
#     else
#       p "Not Valid IP"
#     end
#   end
  
# end

# Ip.new("255.255.255.255").match
# Ip.new("0.0.0.6").match
# Ip.new("0.4.0.").match

def valid_ip?(address)
  quads = address.split('.')
  quads.length == 4 && quads.all? do |quad|
    # Each part is made up purely of digits and as integers they're less than 256.
    (/^\d{1,3}$/ =~ quad) && (quad.to_i <= 255)
  end
end






