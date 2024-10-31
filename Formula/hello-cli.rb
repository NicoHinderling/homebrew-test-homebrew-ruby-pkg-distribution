class HelloCli < Formula
  desc "Simple CLI tool that prints hello"
  homepage "https://github.com/NicoHinderling/test-homebrew-ruby-pkg-distribution"
  url "https://github.com/NicoHinderling/test-homebrew-ruby-pkg-distribution/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "v0.0.1"  # You'll fill this in after creating the release
  license "MIT"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "hello-cli.gemspec"
    system "gem", "install", "hello-cli-#{version}.gem"
    bin.install libexec/"bin/hello"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    assert_equal "hello\n", shell_output("#{bin}/hello")
  end
end