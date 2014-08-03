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
          config = symbolize_hash(config['slim'] || {}).merge(file: Convertible.slim_current_convertible.path)
          context = hash2ostruct(Utils.deep_merge_hashes(Convertible.slim_current_convertible.site.site_payload,
                                                         page: Convertible.slim_current_convertible.to_liquid))
          # Allow also direct access to the site and page object from Slim
          context.site_object = Convertible.slim_current_convertible.site
          context.page_object = Convertible.slim_current_convertible
          ::Slim::Liquid::Converter.new(config) { content }.render(context)
        end

        def hash2ostruct(hash)
          h = {}
          hash.keys.each do |k|
            v = hash.delete(k)
            h[k] = Hash === v ? hash2ostruct(v) : v
          end
          OpenStruct.new(h)
        end

        def symbolize_hash(hash)
          h = {}
          hash.keys.each do |k|
            v = hash.delete(k)
            h[(k.to_sym rescue k) || k] = Hash === v ? symbolize_hash(v) : v
          end
          h
        end
      end
    end
  end
end
