class Weather < ActiveRecord::Base
	Weather.order(:min_temperature)

end
