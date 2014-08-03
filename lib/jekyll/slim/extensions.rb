module Jekyll
  class Layout
    # path is required
    # Also related to https://github.com/mojombo/jekyll/issues/225
    def path
      @name
    end

    # Allows layouts to be transformed by slim until this is fixed (1.4)
    # https://github.com/mojombo/jekyll/issues/225
    # https://github.com/mojombo/jekyll/blob/master/lib/jekyll/layout.rb
    alias old_initialize initialize
    def initialize(*args)
      old_initialize(*args)
      transform
    end

    def to_liquid
      data.merge(name: name, content: content)
    end
  end

  module Convertible
    class<< self
      attr_accessor :slim_current_convertible
    end

    alias old_transform transform
    def transform
      Convertible.slim_current_convertible = self
      old_transform
    end
  end
end
