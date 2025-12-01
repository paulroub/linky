# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name     = "jekyll-theme-linky"
  spec.version  = "0.2.8"
  spec.authors  = ["Paul Roub"]
  spec.email    = ["paul@roub.net"]

  spec.summary  = "Linktree-ish theme for Jekyll, compatible with Decap CMS"
  spec.homepage = "http://github.com/paulroub/linky"
  spec.license  = "MIT"
  spec.metadata    = { "source_code_uri" => "https://github.com/paulroub/linky/" }

  spec.files    = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_data|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.3"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.8"
  spec.add_runtime_dependency "jekyll-sass-converter", ">= 3.0.0"

  spec.required_ruby_version = ">= 2.5"
end
