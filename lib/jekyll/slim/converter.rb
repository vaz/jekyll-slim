module Jekyll
  module Slim
    class Converter < ::Jekyll::Converter
      safe false
      priority :low

      def matches(ext)
        ext =~ /slim/i
      end

      def output_ext(ext)
        '.html'
      end

      def convert(content)
        self.class.convert(@config, content)
      end

      class << self
        def convert(config, content)
          config = symbolize_hash(config['slim'] || {})
          ::Sliq::Converter.new(config) { content }.render()
        end

        def hash2ostruct(hash)
          h = {}
          hash.keys.each do |k|
            v = hash[k]
            h[k] = Hash === v ? hash2ostruct(v) : v
          end
          OpenStruct.new(h)
        end

        def symbolize_hash(hash)
          h = {}
          hash.keys.each do |k|
            v = hash[k]
            h[(k.to_sym rescue k) || k] = Hash === v ? symbolize_hash(v) : v
          end
          h
        end
      end
    end
  end
end
