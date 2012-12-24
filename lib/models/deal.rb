class Deal
  attr_reader :element

  def initialize(page_element)
    @element = page_element.element
  end

  def categories
    show_categories
    element.lis.map &:text
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

end