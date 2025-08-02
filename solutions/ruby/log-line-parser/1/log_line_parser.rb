class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.sub(/^[^\s]* /, "").strip
  end

  def log_level
    @line.split(/[\[\]]/)[1].downcase
  end

  def reformat
    "#{message()} (#{log_level()})"
  end
end
