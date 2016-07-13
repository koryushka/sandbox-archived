class Movie < ApplicationRecord
  establish_connection :development_dup
end
