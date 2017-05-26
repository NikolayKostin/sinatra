class Apply < Sequel::Model
  many_to_one :job
  many_to_one :geek
end