class AllDealsPage
  include PageObject

  link(:show_the_cities, :href => "/cities")
  span(:more_deals, :text => /See \d+ More Deals/i)

  def choose_deals_in(city, state)
    show_the_cities
    platform.list_item_for(:id => "state_#{state[0].upcase}").click
    platform.link_for(:text => /#{city}/).click
  end
end