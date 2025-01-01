class Ilab < Formula
  include Language::Python::Virtualenv

  desc "InstructLab CLI Tool"
  homepage "https://github.com/instructlab/instructlab"
  url "https://github.com/instructlab/instructlab/releases/download/v0.22.1/instructlab-0.22.1.tar.gz"
  sha256 "840bfbe897b4759b2d4963239eaf70a478735ca5a6427203827d4dd2c638c5f3" # Replace with actual checksum

  depends_on "python@3.11"

  def install
    # Inform the user about the installation process
    ohai "Starting installation of InstructLab CLI..."
    ohai "Step 1/3: Creating virtual environment"

    # Set the installation directory
    install_dir = "#{prefix}/instructlab"

    # Create a virtual environment
    system "python3", "-m", "venv", "--upgrade-deps", "#{install_dir}/venv"

    ohai "Step 2/3: Installing InstructLab dependencies"

    # Install InstructLab within the virtual environment
    system "#{install_dir}/venv/bin/pip", "install", "instructlab"

    ohai "Step 3/3: Linking the binary"

    # Link the binary
    bin.install "#{install_dir}/venv/bin/ilab"

    ohai "Installation complete. You can now use 'ilab'."
  end

  test do
    system "#{bin}/ilab", "--help"
  end
end
