require_relative('../db/sql_runner')

class Casting
  attr_reader :id
  attr_accessor :movie_id, :star_id, :fee

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id']
    @star_id = options['star_id']
    @fee = options['fee']
  end

  def self.delete_all()
    sql = "DELETE FROM castings;"
    SqlRunner.run(sql)
  end

  def save
    sql = "INSERT INTO castings (
    movie_id,
    star_id,
    fee
    ) VALUES (
      $1, $2, $3
    ) RETURNING id"
    values = [@movie_id, @star_id, @fee]
    castings = SqlRunner.run(sql, values).first
    @id = castings['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM castings"
    castings = SqlRunner.run(sql)
    return map_castings(castings)
  end

  def self.map_castings(castings_data)
    result = castings_data.map { |casting| Casting.new(casting)}
    return result
  end


end
