class Attraction < ApplicationRecord
    # scope :within, -> (latitude, longitude, distance_in_mile = 1) {
    #     where(%{
    #         ST_Distance(coordinates, 'POINT())
    #     })
    # }
    def self.in_bounds(bounds)
        north = bounds['northEast']['lat'];
        east = bounds['northEast']['lng'];
        south = bounds['southWest']['lat'];
        west = bounds['southWest']['lng'];
        sql = <<-SQL, west, south, east, north
            SELECT * FROM attractions
            WHERE coordinates::geometry @ ST_MakeEnvelope(
                ?, ?, ?, ?, 4326)
        SQL
        # Attraction.find_by_sql("
        #     SELECT * FROM attractions
        #     WHERE coordinates::geometry @ ST_MakeEnvelope(
        #       ?, ?, ?, ?, 4326)", west, south, east, north)
        Attraction.find_by_sql(sql)
    end   

    # def basicquery
        
    # end
end
