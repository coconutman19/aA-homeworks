class Gardener < ApplicationRecord
  belongs_to :house,
    class_name: 'House',
    foreign_key: :house_id,
    primary_key: :id

  has_many :plants,
    class_name: 'Plant',
    foreign_key: :gardener_id,
    primary_key: :id

  def n_plus_one_seeds
    plants = self.plants
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end

  def better_seeds_query
    plants = self.plants.includes(:seeds)
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end
end
