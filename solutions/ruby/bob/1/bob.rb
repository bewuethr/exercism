module Bob
  def self.hey(remark)
    if question?(remark) && yelled?(remark)
      "Calm down, I know what I'm doing!"
    elsif question?(remark)
      "Sure."
    elsif yelled?(remark)
      "Whoa, chill out!"
    elsif silent?(remark)
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end

  private_class_method def self.question?(remark)
    remark.gsub(/[[:space:]]+/, "").end_with?("?")
  end

  private_class_method def self.yelled?(remark)
    remark.gsub(/[^[:alpha:]]/, "").match(/^[[:upper:]]+$/)
  end

  private_class_method def self.silent?(remark)
    remark.match(/\A[[:space:]]*\z/)
  end
end
