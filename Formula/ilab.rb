class Ilab < Formula
  include Language::Python::Virtualenv

  desc "InstructLab CLI Tool"
  homepage "https://github.com/instructlab/instructlab"
  url "https://github.com/instructlab/instructlab/releases/download/v0.22.1/instructlab-0.22.1.tar.gz" #requires dependabot or renovate
  sha256 "840bfbe897b4759b2d4963239eaf70a478735ca5a6427203827d4dd2c638c5f3" #requires script to fetch tarball

  depends_on "python@3.11"

  def install
    ohai "Starting installation of InstructLab CLI..."
    ohai "Step 1/3: Creating virtual environment"

    install_dir = "#{prefix}/instructlab"

    # This should create virtual env
    system "python3", "-m", "venv", "--upgrade-deps", "#{install_dir}/venv"

    ohai "Step 2/3: Installing InstructLab dependencies"

    # Install dependencies into the virtual environment
    system "#{install_dir}/venv/bin/pip", "install", "instructlab"

    ohai "Step 3/3: Linking the binary"

    # Link the binary , it fails so far based on user env - make sure you have the updated brew version
    bin.install_symlink "#{install_dir}/venv/bin/ilab"

    ohai "Installation complete. You can now use 'ilab'."
  end

  def caveats
    <<~EOS
      Note: The formula uses a Python virtual environment and may not link well with
      other Homebrew-managed Python dependencies.
    EOS
  end

  test do
    system "#{bin}/ilab", "--help"
  end
end
