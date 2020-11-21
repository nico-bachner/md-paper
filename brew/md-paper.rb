class MdPaper < Formula
  desc "Generates scientific papers written in Markdown"
  homepage "https://md-paper.now.sh"
  url "https://github.com/nico-bachner/md-paper/archive/v0.1.1.tar.gz"
  sha256 "0149dd080045d685533890a0617019ca8fca240bd77e046b1d2d65c11793856e"
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
