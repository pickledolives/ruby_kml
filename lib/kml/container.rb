module KML
  # A Container is an abstract base class that holds one or more Features and allows the creation of nested hierarchies.
  class Container < Feature
    
    # Access the features in the container
    attr_accessor :features
    attr_accessor :plain_children
    attr_accessor :data

    def data
      @data ||= []
    end
    
    # Get the features in the container
    def features
      @features ||= []
    end

    def plain_children
      @plain_children ||= []
    end

  end
end

require 'kml/simple_data'
require 'kml/folder'
require 'kml/document'
