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
  def visualize
    system "clear" or system "cls"
    max_height = @num_disks
    @towers.each_with_index do |tower, index|
      puts "Wieża #{index + 1}:"
      tower.each { |disk| puts " " * (max_height - disk) + "#" * (disk * 2 - 1) + " " * (max_height - disk) }
      puts "-" * (max_height * 2 - 1)
    end
    puts "Ruch: #{@move_count}"
    sleep 1.0/solve_speed
  end

end
