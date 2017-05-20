class Company < Sequel::Model
  one_to_many :jobs # - later after seeds
end