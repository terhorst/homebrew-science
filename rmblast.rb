class Rmblast < Formula
  desc "RepeatMasker compatible version of the standard NCBI BLAST suite"
  homepage "http://www.repeatmasker.org/RMBlast.html"
  # tag "bioinformatics"

  version "2.2.28"
  if OS.mac?
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/rmblast/LATEST/ncbi-rmblastn-#{version}-universal-macosx.tar.gz"
    sha256 "f94e91487b752eb24386c3571250a3394ec7a00e7a5370dd103f574c721b9c81"
  elsif OS.linux?
    url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/rmblast/LATEST/ncbi-rmblastn-#{version}-x64-linux.tar.gz"
    sha256 "e6503ad25a6760d2d2931f17efec80ba879877b4042a1d10a60820ec21a61cfe"
  else
    raise "Unknown operating system"
  end
  revision 1

  bottle do
    cellar :any_skip_relocation
    sha256 "77cefb50133d6e723a03b857a1502d8d63d82d139abe4c13654c3c26b1820a67" => :el_capitan
    sha256 "3c0f9d4c368e14576cb9ce390ff118360c10f52370051b2668189e37801efb5d" => :yosemite
    sha256 "090810c69bfa5c2ce0153cf18aa4e553cb470d14428d960708323015c33bc227" => :mavericks
  end

  depends_on "blast" => :recommended

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rmblastn -version")
  end
end
