class Ilab < Formula
  include Language::Python::Virtualenv

  desc "InstructLab CLI Tool"
  homepage "https://github.com/instructlab/instructlab"
  url "https://github.com/instructlab/instructlab/releases/download/v0.22.1/instructlab-0.22.1.tar.gz"
  sha256 "840bfbe897b4759b2d4963239eaf70a478735ca5a6427203827d4dd2c638c5f3" # Replace with actual checksum

  depends_on "python@3.11"

  def install
    ohai "Installing InstructLab CLI..."
    virtualenv_install_with_resources
    ohai "Installation complete. You can now use 'ilab'."
  end

  test do
    system "#{bin}/ilab", "--help"
  end
end
