ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include FactoryBot::Syntax::Methods

  # Add more helper methods to be used by all tests here...
  # parallelize(workers: 2, with: :threads)
end

class ActionDispatch::IntegrationTest
  def create_user
    post users_url, params: { user: { email: "john.cena@gmail.com", password: 'secret', password_confirmation: 'secret' } }
  end
  def get_steve
    @user = users(:steve)
  end
end