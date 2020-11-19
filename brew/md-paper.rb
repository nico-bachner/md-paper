class MdPaper < Formula
  desc "Generates scientific papers written in Markdown"
  homepage "https://md-paper.now.sh"
  url "https://github.com/nico-bachner/md-paper/archive/v0.1.0.tar.gz"
  sha256 "82e87b66d852c178c569d0dd0a6d086c31ea8f4c5d6ed5b082e424feccef238f"
  license "MIT"
  
  depends_on "pandoc"
  
  def install
    bin.install "src/md-paper.sh" => "md-paper"
    include.install "src/tex.sh" => "tex.sh"
    include.install "src/pdf.ksh" => "pdf.ksh"
    include.install "src/template.tex" => "template.tex"
  end

  test do
    system "#{bin}/md-paper", "--version"
  end
end