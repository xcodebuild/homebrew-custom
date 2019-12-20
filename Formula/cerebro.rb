class Cerebro < Formula
  desc "cerebro is an open source(MIT License) elasticsearch web admin tool built using Scala, Play Framework, AngularJS and Bootstrap."
  homepage "https://github.com/lmenezes/cerebro"
  url "https://github.com/lmenezes/cerebro/releases/download/v0.8.5/cerebro-0.8.5.tgz"
  sha256 "97cdba6c0054f505c6ac72ca5ae010612c86385ac0f7f760cf512e5705a00a27"

  depends_on :java => "1.8"

  def install
    # Remove Windows files
    rm_f Dir["bin/*.bat"]

    # Install everything else into package directory
    libexec.install "bin", "conf", "lib"

    # Move config files into etc
    (etc/"cerebro").install Dir[libexec/"conf/*"]
    (libexec/"conf").rmtree

    bin.install libexec/"bin/cerebro"
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
  end

  def post_install
    ln_s etc/"cerebro", libexec/"conf" unless (libexec/"conf").exist?
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test cerebro`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end