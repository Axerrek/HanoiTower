# Wieża Hanoi - Projekt

## Opis Projektu

Projekt ten implementuje grę Wieża Hanoi, klasyczny problem algorytmiczny polegający na przenoszeniu dysków z jednej wieży na inną, z zachowaniem określonych zasad. Celem jest rozwiązanie problemu przy minimalnej liczbie ruchów, z możliwością wizualizacji procesu.

## Struktura Projektu

Projekt składa się z dwóch głównych plików:

1. `main.rb` - Główny plik uruchamiający grę, pobierający dane od użytkownika i wywołujący algorytm rozwiązujący.
2. `Hanoi.rb` - Plik zawierający klasę `TowerOfHanoi`, która implementuje algorytm oraz wizualizację rozwiązania.

## Wymagania

Aby uruchomić ten projekt, potrzebujesz:
- Ruby w wersji co najmniej 2.5
- System operacyjny Linux, MacOS lub Windows

## Instalacja

Upewnij się, że masz zainstalowane Ruby na swoim komputerze. Możesz sprawdzić wersję Ruby za pomocą polecenia:

   ```sh
   ruby -v
   ```

Sklonuj repozytorium z projektem:

   ```sh
   git clone https://github.com/twoje-repozytorium/wieza-hanoi.git
   ```

Przejdź do katalogu z projektem:


    cd wieza-hanoi

Upewnij się, że plik Hanoi.rb znajduje się w tym samym katalogu co main.rb.


## Uruchomienie

Aby uruchomić grę Wieża Hanoi, wykonaj następujące kroki:

Otwórz terminal i przejdź do katalogu z projektem.

Uruchom plik main.rb:

    ruby main.rb

Postępuj zgodnie z instrukcjami wyświetlanymi na ekranie:

- Podaj liczbę pierścieni.

- Wybierz prędkość układania (od 1 do 10).

## Instrukcja Użytkowania

#### Podanie liczby pierścieni: 

Po uruchomieniu programu zostaniesz poproszony o podanie liczby pierścieni, które mają być użyte w grze. Wpisz liczbę całkowitą większą od 0.

#### Wybór prędkości układania: 
Następnie zostaniesz poproszony o wybór prędkości układania. Wpisz liczbę od 1 do 10, gdzie 1 oznacza najwolniejsze tempo, a 10 najszybsze.

#### Rozpoczęcie gry: 
Program automatycznie rozpocznie rozwiązywanie problemu Wieży Hanoi i wyświetli wizualizację każdego kroku. Na końcu zobaczysz całkowitą liczbę ruchów potrzebnych do ukończenia gry.


### Klasa TowerOfHanoi 
zawiera następujące atrybuty i metody:
#### Atrybuty

    @num_disks - liczba dysków
    @solve_speed - szybkość animacji
    @towers - tablica zawierająca trzy wieże, z których każda jest tablicą dysków
    @move_count - liczba wykonanych ruchów

#### Metody

    initialize(num_disks, solve_speed) - konstruktor inicjalizujący obiekt z podaną liczbą dysków i szybkością animacji.
    solve - metoda rozwiązująca problem Wieży Hanoi.
    visualize - metoda wizualizująca aktualny stan wież.
    move_disks(n, from_tower, to_tower, aux_tower) - rekurencyjna metoda przenosząca dyski między wieżami.
    move_disk(from_tower, to_tower) - metoda przenosząca pojedynczy dysk między wieżami.
