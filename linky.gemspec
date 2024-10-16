# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-linky"
  spec.version       = "0.1.1"
  spec.authors       = ["Paul Roub"]
  spec.email         = ["paul@roub.net"]

  spec.summary       = "Linktree-ish theme for Jekyll, compatible with Decap CMS"
  spec.homepage      = "http://github.com/paulroub/linky"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_data|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.3"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.8"
end
