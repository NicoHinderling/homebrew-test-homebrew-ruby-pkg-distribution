class HelloCli < Formula
  desc "Simple CLI tool that prints hello"
  homepage "https://github.com/NicoHinderling/test-homebrew-ruby-pkg-distribution"
  url "https://github.com/NicoHinderling/test-homebrew-ruby-pkg-distribution/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "f5af3d33e30a8a0fe24dade0067f305430978aa7a10e0cc62368871ee4dcda88"  # can be gotten from the command "shasum -a 256 v0.0.1.tar.gz" if you download it from the "main" repo
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