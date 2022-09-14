class DataController < ApplicationController
  def index
    
  end
  def sendData
    if params[:name] != ""
      @name = params[:name]
      @dataJson = Oj.load(RestClient.get("https://ipinfo.io/" + @name + "/geo"))
      if @dataJson['city'] !=nil
        @city = "Miasto: " + @dataJson['city']
      end
      if @dataJson['region'] !=nil
        @region = "Region: " + @dataJson['region']
      end
      if @dataJson['country'] !=nil
        @country = "Kraj: " + @dataJson['country']
      end
      if @dataJson['loc'] !=nil
        @loc = "Lokalizacja: " + @dataJson['loc']
      end
      if @dataJson['org'] !=nil
        @org = "Organizacja: " + @dataJson['org']
      end
      if @dataJson['postal'] !=nil
        @postal = "Kod pocztowy: " + @dataJson['postal']
      end
      if @dataJson['timezone'] !=nil
        @timezone = "Strefa czasowa: " + @dataJson['timezone']
      
    end
    else
      @name = "Nieprawdilowe IP!"
    end
  rescue RestClient::NotFound
    @name = "Nieprawidlowe IP!"
  
  end

end
