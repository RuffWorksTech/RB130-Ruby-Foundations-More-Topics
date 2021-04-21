class TextAnalyzer
  def process
    file = File.open('text_to_analyze.txt')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split(/\n\n/).size} paragraphs" }
analyzer.process { |text| puts "#{text.split(/\n/).size} lines" }
analyzer.process { |text| puts "#{text.split.size} words" }