### @export "Set up task env"
require 'kml'
desc "Create shapes for Google Earth"
task :export_kml do
  get_db_conn(GTRON_ENV)
  output_path = ENV["OUTPUT_PATH"] || "#{GTRON_ROOT}/output"
### @end
### @export "KML boilerplate"
  kml = KMLFile.new
  doc = KML::Document.new(:name => "Gigantron Shape Demo")
### @end
### @export "Loop through shapes"
  doc.features = Shape.find(:all).map! do |shape|
    placemark = KML::Placemark.new(:name => shape.name)
### @end
### @export "Set boundaries"
    bounds = shape.coordinates.find(:all).map! do |coord|
      [coord.lon, coord.lat, coord.alt]
    end
    bounds = bounds + [bounds.first]
### @end
### @export "Create polygon"
    polygon = KML::Polygon.new( 
                :altitude_mode => 'absolute',
                :outer_boundary_is => 
                  KML::LinearRing.new(:coordinates => bounds) )

    placemark.features << polygon
    placemark
  end
### @end
### @export "Output KML"
  kml.objects << doc

  File.open("#{output_path}/shapes.kml", "w") {|f| f.write kml.render }
end
### @end
