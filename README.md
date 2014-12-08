# Jekyll-slim

[![Gem Version](http://img.shields.io/gem/v/jekyll-slim.svg?style=flat)](#)
[![Dependency
Status](http://img.shields.io/gemnasium/slim-template/jekyll-slim.svg?style=flat)](https://gemnasium.com/slim-template/jekyll-slim)
[![Code
Climate](http://img.shields.io/codeclimate/github/slim-template/jekyll-slim.svg?style=flat)](https://codeclimate.com/github/slim-template/jekyll-slim)
[![Build Status](http://img.shields.io/travis/slim-template/jekyll-slim.svg?style=flat)](https://travis-ci.org/slim-template/jekyll-slim)

A gem that adds [slim-lang](http://slim-lang.com) support to [Jekyll](http://github.com/mojombo/jekyll). Works for for pages, includes and layouts.

This fork is trying to fix jekyll-slim for the current version.

## Installation

Add this line to your Gemfile:

    gem 'jekyll-slim', github: 'vaz/jekyll-slim'
    gem 'sliq', github: 'vaz/sliq'

And then execute:

    $ bundle

In your Jekyll project's `_plugins` directory:

    # _plugins/jekyll-slim.rb
    require 'jekyll-slim'

This is currently working with jekyll-2.5.2, slim-2.1.0, and my own fork of
sliq.


## Usage

The gem will convert all the `.slim` files in your project's directory into HTML. That includes files in sub-directories, includes and layouts. Example:

```slim
# _layouts/default.slim
html
  head
  body
    .content-wrapper {{ content }}
```

```slim
# index.slim
---
layout: default
---

section.content Content goes here.
% include footer.slim
```

### Options

It is possible to set options available for Slim engine through the `slim` key in `_config.yml`. Example:

```yaml
# _config.yml
slim:
  pretty: true
```

### Context

This fork removes the `SlimContext` addition which made the site's
configuration available in ruby expressions in the slim code. It didn't seem
necessary and complicated things.

## Looking for maintainers

The original authors are looking for maintainers for the gem.

## Credit

Jekyll-slim was heavily inspired by [jekyll-haml](https://github.com/samvincent/jekyll-haml). It is free software, and may be redistributed under the terms specified in the LICENSE file.

This fork borrows the preconverter hack from the
[northdocks fork](https://github.com/northdocks/jekyll-slim)
