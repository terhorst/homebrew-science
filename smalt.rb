class Smalt < Formula
  desc "Aligns DNA sequencing reads with a reference genome"
  homepage "http://www.sanger.ac.uk/science/tools/smalt-0"
  # tag "bioinformatics"

  url "https://downloads.sourceforge.net/project/smalt/smalt-0.7.6.tar.gz"
  sha256 "89ccdfe471edba3577b43de9ebfdaedb5cd6e26b02bf4000c554253433796b31"
  revision 1

  bottle do
    cellar :any_skip_relocation
    sha256 "e3116e41fa4f33637c9dcf5305cf94e3f3e236d5d5636fd3b76dab1b29bdd914" => :el_capitan
    sha256 "78168b0c7f00afbabbdfc782308e80a6396cdec58a648b98d9a1bb236ca509a3" => :yosemite
    sha256 "2f89e72d483b039dd6096a801e86e999062999541a0fe3a0e0f6c42744ee657f" => :mavericks
  end

  resource "manual" do
    url "https://downloads.sourceforge.net/project/smalt/smalt_manual.pdf"
    sha256 "efd52e8429237b27797027477c33e1071f6247616d7705106af256e48307480a"
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
    doc.install resource("manual")
  end

  test do
    assert_match version.to_s, shell_output("smalt version")
  end
end
