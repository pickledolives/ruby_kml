# Basic XML Structure:
#
#   <Placemark id="ID">
#     <!-- inherited from Feature element -->
#     <name>...</name>                      <!-- string -->
#     <visibility>1</visibility>            <!-- boolean -->
#     <open>1</open>                        <!-- boolean -->
#     <address>...</address>                <!-- string -->
#     <AddressDetails xmlns="urn:oasis:names:tc:ciq:xsdschema:xAL:2.0">...
#         </AddressDetails>                 <!-- string -->
#     <phoneNumber>...</phoneNumber>        <!-- string -->
#     <Snippet maxLines="2">...</Snippet>   <!-- string -->
#     <description>...</description>        <!-- string -->
#     <LookAt>...</LookAt>
#     <TimePrimitive>...</TimePrimitive>
#     <styleUrl>...</styleUrl>              <!-- anyURI -->
#     <StyleSelector>...</StyleSelector>
#     <Region>...</Region>
#     <Metadata>...</Metadata>
#   
#     <!-- specific to Placemark element -->
#     <Geometry>...</Geometry>
#   </Placemark>

module KML
  class Placemark < KML::Container
    attr_accessor :geometry
    attr_accessor :data_schema_url
    
    def render(xm=Builder::XmlMarkup.new(:indent => 2))
      xm.Placemark {
        super
        xm.ExtendedData { xm.tag!('SchemaData', schemaUrl: data_schema_url) { data.each { |r| xm.SimpleData(r.data_value, name: r.data_name) } } }
        features.each { |f| f.render(xm) }
        plain_children.each { |c| xm << c }
        geometry.render(xm) unless geometry.nil?
      }
    end
  end
end
