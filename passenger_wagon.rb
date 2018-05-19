require_relative 'wagon'

class PassengerWagon < Wagon
  
  attr_reader :number_of_places, :booked_place, :places
  
  def post_initialize(args)
    @places = []
    @number_of_places = args[:number_of_places]
    @booked_place = 0

    init_places
  end
  
  def take_places(index)
    index = number_place(index)
    raise 'Неправильное место' if index > number_of_places
    
    if @places[index] == false
      @places[index] = true
    else
      raise 'Это место уже занято. Выберите другое'
    end
  end
  
  def number_booked_places
    booked_places.count
  end
  
  def number_free_places
    free_places.count
  end

  def free_places
    places.select { |place| place == false }
  end
  
  def booked_places
    places.select { |place| place == true }
  end
  
  def to_s
    "Пассажирский вагон №#{number}"
  end
  
  private
  
  attr_writer :number_of_places, :booked_place
  
  def init_places
    @places = Array.new(number_of_places, false)
  end
  
  def number_place(index)
    index - 1
  end
  
end
