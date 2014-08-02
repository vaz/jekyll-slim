module Jekyll
  module Slim
    class Converter < ::Jekyll::Converter
      safe false
      priority :low

      def initialize(config)
        super
        self.ensure_config_integrity
      end

      def matches(ext)
        ext =~ /slim/i
      end

      def output_ext(ext)
        '.html'
      end

      def convert(content)
        Template.new(@symbolized_config) { content }.render(locals[:slim_context])
      end

      def ensure_config_integrity
        @config['slim'] ||= {}
        @symbolized_config = @config['slim'].deep_symbolize_keys
      end
    end
  end
end
