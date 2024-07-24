# Korzystanie z pliku z Klasą Wieży Hanoi i jej metodami
require_relative 'Hanoi'

# Główna funkcja programu uruchamiająca algorytm Wieży Hanoi
#
# Wyświetla informacje o grze Wieża Hanoi i zapytuje użytkownika
# o liczbę pierścieni oraz prędkość wykonywania rozwiązania.
# Tworzy obiekt klasy TowerOfHanoi i uruchamia metodę rozwiązującą.
def main
  puts "Wieża Hanoi"


  # Sprawdza, czy dany wpis jest liczbą całkowitą.
  #
  # Metoda konwertuje wejściowy obiekt na ciąg znaków, a następnie sprawdza,
  # czy ciąg ten składa się wyłącznie z cyfr. Jest to użyteczne do walidacji,
  # czy wejściowy tekst może być traktowany jako liczba całkowita.
  #
  # Przykłady:
  #   valid_integer?("123")  #=> true
  #   valid_integer?("12.3") #=> false
  #   valid_integer?("abc")  #=> false
  #
  # @param input [Object] Obiekt wejściowy, który ma być sprawdzony.
  # @return [Boolean] Zwraca true, jeśli obiekt wejściowy jest liczbą całkowitą,
  #                   w przeciwnym razie zwraca false.
  def valid_integer?(input)
    input.to_s.match?(/^\d+$/)
  end

  # Funkcja wypytująca użytkownika o liczbę pierścieni
  #
  # Pyta użytkownika o liczbę pierścieni do momentu, aż wprowadzi
  # prawidłową wartość (liczbę całkowitą większą od 0).
  #
  # @return [Integer] liczba pierścieni
  def disks_input
    loop do
      print "Podaj liczbę pierścieni: "
      input = gets.chomp.to_i
      # warunek blokujący wartości poniżej 1 oraz wartości tekstowe
      # wartości zmiennoprzecinkowe są traktowane jak zaokrąglane w dół
      # np. 2,5 => 2
      if valid_integer?(input) && input > 0
        return input.to_i
      else
        puts "Nieprawidłowa wartość. Spróbuj ponownie."
      end
    end
  end

  # Funkcja wypytująca użytkownika o szybkość wykonywania rozwiązania
  #
  # Pyta użytkownika o prędkość układania do momentu, aż wprowadzi
  # prawidłową wartość (liczbę całkowitą z przedziału 1-10).
  #
  # @return [Integer] prędkość układania (1-10)
  def speed_input
    loop do
      print "Wybierz Prędkość układania [1-10]: "
      input = gets.chomp.to_i
      if valid_integer?(input) && input >= 1 && input <= 10
        return input
      else
        puts "Nieprawidłowa wartość. Spróbuj ponownie."
      end
    end
  end

  # Przypisanie wartości z wejścia użytkownika: num_disks i solve_speed
  num_disks = disks_input
  solve_speed = speed_input

  # Utworzenie obiektu Wieży Hanoi
  tower_of_hanoi = TowerOfHanoi.new(num_disks, solve_speed)
  # Wywołanie funkcji rozwiązującej
  tower_of_hanoi.solve
end

# Wywołanie głównej funkcji programu
main
