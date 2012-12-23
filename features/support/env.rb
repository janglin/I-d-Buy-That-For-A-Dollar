$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec-expectations'
require 'page-object'
require 'page-object/page_factory'
require 'require_all'

require_all 'lib'

World(PageObject::PageFactory)

PageObject::PageFactory.routes = {
    :default => [],
    :all_deals_for_levi => [
        [HomePage, :go_to_sign_in],
        [SignInPage, :sign_in_as_levi],
        [FeaturedDealPage, :all_deals],
        [AllDealsPage]
    ]
}

