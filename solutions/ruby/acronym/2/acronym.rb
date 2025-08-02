module Acronym
  def self.abbreviate(str)
    str.tr("-", " ").gsub(/[[:punct:]]/, "").split.map { _1[0] }.join.upcase
  end
end
