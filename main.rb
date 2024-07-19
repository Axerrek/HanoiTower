#Korzystanie z pliku z Klasą Wieży hanoi i jej metodami
require_relative 'Hanoi'
#Pętla odczytująca wartości wejściowe od użytkownika
def main
  puts "Wieża Hanoi"
  #Funkcja Wypytująca użytkownika o liczbę pierścieni
  def disks_input
    loop do
      print "Podaj liczbę pierścieni: "
      input = gets.chomp.to_i
      #warunek blokujący wartości poniżej 1 oraz wartości tekstowe
      # wartości zmiennoprzecinkowe są traktowane jak zaokrąglane w dół
      # np. 2,5 => 2
      if input.to_i > 0
        return input.to_i
      end
    end
  end
  #Funkcja Wypytująca użytkownika o szybkość wykonywania rozwiązania
  def speed_input
    loop do
      print "Wybierz Prędkość układania [1-10]"
      input= gets.chomp.to_i
      #warunek blokujący wartości, które nie są z przedziału [1-10] oraz wartości tekstowe
      # wartości zmiennoprzecinkowe są traktowane jak zaokrąglane w dół
      # np. 2,5 => 2
      if input.to_i <= 10 && input.to_i >= 1
        return input
      end
    end
  end
  #przypisanie wartości z wejścia użytkownika: num_disks i solve_speed
  num_disks = disks_input
  solve_speed = speed_input

  #Utworzenie obiektu Wieży Hanoi
  tower_of_hanoi = TowerOfHanoi.new(num_disks, solve_speed)
  #Wywołanie funkcji rozwiązującej
  tower_of_hanoi.solve
end
#Wywołanie głównej funkcji programu
main