module PhoneNumber
  def self.clean(n)
    n.gsub!(/[[:punct:][:blank:]]/, "")

    return nil if n.match?(/[^[:digit:]]/)

    n.delete_prefix!("1") if n.length == 11

    (n.length != 10 || n[0].match?(/[01]/) || n[3].match?(/[01]/)) ? nil : n
  end
end
