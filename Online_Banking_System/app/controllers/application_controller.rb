class ApplicationController < ActionController::Base
  include ApplicationHelper
  include CustomerSessionHelper
  include AccountsHelper
  include CustomersHelper
end
