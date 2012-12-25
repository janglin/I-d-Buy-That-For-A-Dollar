class Deal
  attr_reader :element

  def initialize(page_element)
    @element = page_element.element
  end

  def categories
    show_categories
    element.lis.map &:text
  end

  def categorize_as(category)
    show_categories
    the_category = element.lis(:text => /#{category}/).first
    the_category.a().click
  end

  def active_categories
    show_categories
    element.as(:class => "active").map &:title
  end

  def clear_active_categories
    show_categories
    element.as(:class => "active").each do |category|
      category.click unless category.title.empty?
    end
  end

  def print
    puts "#{"-" * 15}\n#{content.text}"
  end

  private
  def show_categories
    hover_on_the_deal
    mouseover(element.element(:class => "heartx-heart"))
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