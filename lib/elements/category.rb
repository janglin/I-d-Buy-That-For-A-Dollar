class Category
  attr_reader :element

  def initialize(element)
    @element = element
  end

  def active?
    element.class_name.include? "active" and not text.empty?
  end

  def check
    element.click unless active?
  end

  def uncheck
    element.click if active?
  end

  def match?(name)
    text.include? name
  end

  def text
    element.title
  end

  def to_s
    text
  end
end