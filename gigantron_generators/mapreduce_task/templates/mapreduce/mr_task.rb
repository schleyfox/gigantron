class MapReduce<%= name.camelcase %>
  include SkynetDebugger

  def self.run
    job = Skynet::Job.new(
      :mappers => 2, #change to whatever is a good number
      :reducers => 1, #same
      :map_reduce_class => self,
      :map_data => [] #acquire your data!
    )
    job.run
  end

  def self.map(profiles)
    #map code
  end

  def self.reduce(pairs)
    #reduce code
  end
end

