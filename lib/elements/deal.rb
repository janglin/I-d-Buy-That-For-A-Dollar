class Deal
  attr_reader :element

  def initialize(page_element)
    @element = page_element.element
  end

  def categories
    all_categories.map &:text
  end

  def categorize_as(category)
    categories_matching(category).first.check
  end

  def active_categories
    all_active_categories.map &:text
  end

  def clear_active_categories
    all_active_categories.each &:uncheck
  end

  def print
    puts "#{"-" * 15}\n#{content.text}"
  end

  private
  def show_categories
    hover_on_the_deal
    mouseover(element.element(:class => "heartx-heart"))
  end

  def all_categories
    show_categories
    element.as(:class => "heartx-deal-feedback").map {|el| Category.new(el)}
  end

  def all_active_categories
    all_categories.select &:active?
  end

  def categories_matching(text)
    all_categories.select do |category|
      category.match? text
    end
  end

  def hover_on_the_deal
    element.hover
    mouseover(element)
  end

  def mouseover(which_element)
    which_element.fire_event "onmouseover"
  end

  def content
    element.div(:class => "deal-content")
  end

end