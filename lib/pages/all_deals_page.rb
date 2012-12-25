class AllDealsPage
  include PageObject

  link(:show_the_cities, :href => "/cities")
  span(:more_deals, :text => /See \d+ More Deals/i)
  span(:deal_totals, :class => "results")
  link(:buy_now, :text => "Buy Now!")

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

  def the_deals(locator={})
    raw_deals(locator).map do |deal|
      Deal.new(deal)
    end
  end

  def ignored_deals
    the_deals.select(&:ignored?).map &:merchant
  end

  def clear_ignored_deals
    the_deals.select(&:ignored?).each &:care_about
  end

  def choose_to_ignore(*these_deals)
    these_deals.each do |deal|
      the_deals(:text => /#{deal}/).each &:ignore
    end
  end

  def total_number_of_deals
    deal_totals.to_i
  end

  private
  def raw_deals(locator)
    platform.divs_for({:class => "deal-list-tile"}.merge(locator))
  end
end
