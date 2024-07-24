# Reprezentuje grę Wieża Hanoi.
#
# == Atrybuty
# * +num_disks+ (Integer) - liczba dysków w wieży
# * +solve_speed+ (Integer) - szybkość rozwiązywania, określająca prędkość animacji
# * +towers+ (Array) - tablica z trzema wieżami, gdzie każda wieża jest reprezentowana jako tablica dysków
# * +move_count+ (Integer) - liczba wykonanych ruchów podczas rozwiązywania problemu
#
# == Metody
# * #initialize - inicjalizuje nowy obiekt TowerOfHanoi
# * #solve - rozwiązanie problemu Wieży Hanoi
# * #visualize - wizualizacja aktualnego stanu wież
class TowerOfHanoi
  # Czytaj atrybuty opisane wyżej
  attr_reader :num_disks, :solve_speed, :towers, :move_count

  # Inicjalizuje nowy obiekt TowerOfHanoi.
  #
  # === Parametry
  # * +num_disks+ (Integer) - liczba dysków do umieszczenia na wieży
  # * +solve_speed+ (Integer) - szybkość animacji rozwiązania
  def initialize(num_disks, solve_speed)
    # przypisanie wartości z parametrów
    @num_disks = num_disks
    @solve_speed = solve_speed
    @towers = Array.new(3) { [] }
    @num_disks.downto(1) { |i| @towers[0] << i }
    @move_count = 0
  end

  # Rozwiązuje problem Wieży Hanoi.
  #
  # Wywołuje algorytm rozwiązujący i wizualizuje kolejne kroki.
  def solve
    move_disks(@num_disks, 0, 2, 1)
    visualize
  end

  # Wizualizuje aktualny stan wież.
  #
  # Czyści ekran i rysuje obecny stan wież oraz licznik ruchów.

  private

  # Rekurencyjnie przenosi dyski między wieżami.
  #
  # === Parametry
  # * +n+ (Integer) - liczba dysków do przeniesienia
  # * +from_tower+ (Integer) - indeks wieży źródłowej
  # * +to_tower+ (Integer) - indeks wieży docelowej
  # * +aux_tower+ (Integer) - indeks wieży pomocniczej
  def move_disks(n, from_tower, to_tower, aux_tower)
    if n == 1
      move_disk(from_tower, to_tower)
    else
      move_disks(n - 1, from_tower, aux_tower, to_tower)
      move_disk(from_tower, to_tower)
      move_disks(n - 1, aux_tower, to_tower, from_tower)
    end
  end

  # Przenosi pojedynczy dysk między wieżami.
  #
  # === Parametry
  # * +from_tower+ (Integer) - indeks wieży źródłowej
  # * +to_tower+ (Integer) - indeks wieży docelowej
  def move_disk(from_tower, to_tower)
    disk = @towers[from_tower].pop
    @towers[to_tower].push(disk)
    @move_count += 1
    visualize
  end

  # Reprezentuje wizualizację aktualnego stanu Wieży Hanoi.
  #
  # Metoda ta rysuje obecny stan wież na terminalu oraz wyświetla liczbę wykonanych ruchów.
  # Oczyszcza ekran przed każdym rysowaniem, aby zapewnić aktualizację wizualizacji.
  # Rysuje dyski w różnych wieżach, a także linie oddzielające wieże oraz wskaźnik liczby ruchów.
  # Wizualizacja uwzględnia kolory, które mogą być używane do oznaczenia różnych elementów (jeśli są ustawione).
  #
  # Wywołanie tej metody spowoduje, że terminal wyświetli bieżący stan Wieży Hanoi, gdzie:
  # - Dyski są reprezentowane jako pełne bloki (█),
  # - Puste miejsca są reprezentowane jako pionowe kreski (║),
  # - Linia pozioma na dole jest reprezentowana przez znak "═" z centralnym "╩".
  #
  # Po każdej aktualizacji ekran jest oczyszczany, a następnie rysowany na nowo z uwzględnieniem prędkości rozwiązania.
  #
  # @return [void]
  # @see #solve
  def visualize
    system "clear" or system "cls"
    max_height = @num_disks
    max_disk_size = @num_disks * 2 - 1
    tower_width = max_disk_size + 2
    display_width = tower_width * 3 + 2

    (0...max_height).reverse_each do |level|
      row = " " * display_width
      @towers.each_with_index do |tower, tower_index|
        center = tower_index * (tower_width+1) + tower_width / 2
        if tower[level].nil?
          row[center] = "║"
        else
          disk_size = tower[level] * 2 - 1
          start_index = center - disk_size / 2
          row[start_index, disk_size] = "█" * disk_size
        end
      end
      puts row
    end

    puts ("═" * (tower_width/2) +"╩"+ "═" * (tower_width/2) + " ") * 3
    puts "Ruch: #{@move_count}"
    sleep 1.0 / solve_speed
  end


end
