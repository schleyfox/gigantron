class <%= name.capitalize %>
  include DataMapper::Resource

  property :id, Integer, :serial => true

end
