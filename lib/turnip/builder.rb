require "gherkin/parser"
require 'turnip/node/feature'

module Turnip
  class Builder
    def self.build(feature_file)
      parser = Gherkin::Parser.new
      begin
        result = parser.parse(File.read(feature_file))

        return nil unless result[:feature]
        Node::Feature.new(result[:feature])
      rescue => e
        e.message = "An error has occured in #{feature_file}.\n#{e.message}"
        raise e
      end
    end
  end
end
