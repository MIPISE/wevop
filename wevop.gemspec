# frozen_string_literal: true

require_relative "lib/wevop/version"

Gem::Specification.new do |spec|
  spec.name = "wevop"
  spec.version = Wevop::VERSION
  spec.authors = ["Berlimioz"]
  spec.email = ["berlimioz@gmail.com"]

  spec.summary = "Ruby SDK for Wevop API"
  spec.description = "Ruby SDK for Wevop API"
  spec.homepage = "https://github.com/MIPISE/wevop"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.1"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "rake"
end
