module Jekyll
  module Slim
    begin
      require 'slim/liquid'
      puts 'Using slim-liquid'
      Template = ::Slim::Liquid::Converter
    rescue LoadError
      puts 'NOT using slim-liquid'
      require 'slim'
      Template = ::Slim::Template
    end
  end
end
