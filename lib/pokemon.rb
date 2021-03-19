class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end 
  
  def self.save(name, type, db)
    sql = <<-SQL 
    INSERT INTO pokemon (name, type) VALUES (?,?)
    SQL
    
    db.execute(sql,name, type)
    
  end 
  
  
  def self.find(num, db)
    
    sql = <<-SQL 
    SELECT * FROM pokemon WHERE id = ? 
    SQL

  new_pokemon = db.execute(sql, num)  
  
  pokemonX = self.new(id:new_pokemon[0][0], name:new_pokemon[0][1], type:new_pokemon[0][2], db:new_pokemon)
  
  pokemonX
  
  

end 

end 