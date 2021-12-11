ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def is_logged_in?
    !session[:customer_id].nil?
  end

  def is_admin_logged_in?
    !session[:admin_user_id].nil?
  end

  #From https://stackoverflow.com/questions/9861075/how-can-i-load-seeds-rb-into-the-test-database-without-breaking-factorygirl
  def seed_data
    require "#{Rails.root}/db/seeds.rb"
  end
end
