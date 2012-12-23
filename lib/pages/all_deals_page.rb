class AllDealsPage
  include PageObject

  link(:show_the_cities, :href => "/cities")
  span(:more_deals, :text => /See \d+ More Deals/i)
  span(:deal_totals, :class => "results")

  def choose_deals_in(city, state)
    show_the_cities
    platform.list_item_for(:id => "state_#{state[0].upcase}").click
    platform.link_for(:text => /#{city}/).click
  end

  def display_all_deals
    while more_deals?
      more_deals_element.click
    end
  end

  def the_deals
    platform.divs_for(:class => "deal-content")
  end

  def total_number_of_deals
    deal_totals.to_i
  end

  def print_all_deals
    the_deals.each do |deal|
      puts "-" * 15
      puts deal.text
    end
  end
end
