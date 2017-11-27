class Nyx < Formula
  include Language::Python::Virtualenv

  desc "Command-line monitor for Tor"
  homepage "https://nyx.torproject.org/#home"
  url "https://files.pythonhosted.org/packages/42/37/85890dae5680f36f5b1c964ad41674ebb8d1186383fbca58f82e76de734c/nyx-2.0.4.tar.gz"
  sha256 "38db634789c2d72e485522a490397eb5f77c0bd7c689453efe57808c99dba75e"

  depends_on :python if MacOS.version <= :snow_leopard

  resource "stem" do
    url "https://files.pythonhosted.org/packages/11/d5/e51983f81b38408ae2f0e166481ad867962f6fa07610fe71119534e12d41/stem-1.6.0.tar.gz"
    sha256 "d7fe1fb13ed5a94d610b5ad77e9f1b3404db0ca0586ded7a34afd323e3b849ed"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nyx --version 2>&1")
  end
end
