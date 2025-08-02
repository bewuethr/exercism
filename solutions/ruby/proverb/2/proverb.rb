class Proverb
  def initialize(*items, qualifier: nil)
    @items = items
    @qualifier = qualifier
  end

  def to_s
    result = []
    @items.each_cons(2) do |first, second|
      result << "For want of a #{first} the #{second} was lost."
    end

    result << "And all for the want of a #{@qualifier} #{@items[0]}.".squeeze(" ")

    result.join("\n")
  end
end
