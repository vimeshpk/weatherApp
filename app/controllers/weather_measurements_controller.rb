class WeatherMeasurementsController < ApplicationController
	include WeatherMeasurementsHelper

      def index
        @test = WeatherMeasurementsHelper::getWeather()
        @parsed_json = ActiveSupport::JSON.decode(@test) 

        @list_test =  @parsed_json['list']

        @weather_details=Weather.all.order(:min_temperature) 
       
       if @weather_details.size==0
         
        @list_test.each do |datum|
        	 @testview=Weather.new(weather_params)
        	@main=datum['main']
        	@testview.min_temperature = @main['temp_min'].to_f
        	@testview.max_temperature = @main['temp_max'].to_f
        	@testview.date_time = datum['dt_txt'].to_datetime
            @testview.save
          end
        end
        
         @temp=Array.new  
         @weather_details.each do |data|
         	min_temp = data.min_temperature
  
         	@temp.push(min_temp) 
         end
        

         @date_times=Array.new  
         date_time_value = ""
         @weather_details.each do |data|
         	date_time_value =data.date_time.to_s 
  
         	@date_times.push(date_time_value) 
         end

          
      end




      def weather_params
      		params.permit(:min_temperature,:max_temperature,:date_time)
	   end



end
