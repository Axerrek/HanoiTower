# frozen_string_literal: true
# spec/tower_of_hanoi_spec.rb
require_relative '../Hanoi'  # Załaduj klasę TowerOfHanoi z pliku Hanoi.rb

RSpec.describe TowerOfHanoi do
  describe '#initialize' do
    it 'initializes with the correct number of disks' do
      game = TowerOfHanoi.new(3, 1)
      expect(game.towers).to eq([[3, 2, 1], [], []])
    end

    it 'initializes with move_count as 0' do
      game = TowerOfHanoi.new(3, 1)
      expect(game.move_count).to eq(0)
    end
  end

  describe '#solve' do
    it 'solves the puzzle and moves all disks to the target tower' do
      game = TowerOfHanoi.new(2, 1)
      game.solve
      expect(game.towers).to eq([[], [], [2, 1]])
    end

    it 'correctly counts the number of moves for 2 disks' do
      game = TowerOfHanoi.new(2, 1)
      game.solve
      expect(game.move_count).to eq(3)  # For 2 disks, the number of moves should be 3
    end

    it 'correctly counts the number of moves for 3 disks' do
      game = TowerOfHanoi.new(3, 1)
      game.solve
      expect(game.move_count).to eq(7)  # For 3 disks, the number of moves should be 7
    end
  end
end

