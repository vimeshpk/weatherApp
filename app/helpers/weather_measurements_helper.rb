module WeatherMeasurementsHelper
	def self.getWeather()
    RestClient.get "http://samples.openweathermap.org/data/2.5/forecast?id=524901&appid=b1b15e88fa797225412429c1c50c122a1"
    end
end
