DROP TABLE IF EXISTS areas;
CREATE TABLE areas (
    place_name VARCHAR(255),
    polygon GEOMETRY(POLYGON, 4326)
);

INSERT INTO areas (place_name, polygon) VALUES
    ('New_York', ST_SetSRID(ST_GeomFromText('POLYGON((-74.25909 40.477399, -73.700272 40.477399, -73.700272 40.917577, -74.25909 40.917577, -74.25909 40.477399))'), 4326)),
    ('Los_Angeles', ST_SetSRID(ST_GeomFromText('POLYGON((-118.668176 33.703652, -118.155289 33.703652, -118.155289 34.337306, -118.668176 34.337306, -118.668176 33.703652))'), 4326)),
    ('Tokyo', ST_SetSRID(ST_GeomFromText('POLYGON((138.941375 35.523222, 140.68074 35.523222, 140.68074 35.898782, 138.941375 35.898782, 138.941375 35.523222))'), 4326)),
    ('London', ST_SetSRID(ST_GeomFromText('POLYGON((-0.224828 51.446878, 0.024828 51.446878, 0.024828 51.546878, -0.224828 51.546878, -0.224828 51.446878))'), 4326)),
    ('Paris', ST_SetSRID(ST_GeomFromText('POLYGON((2.224973 48.815573, 2.424973 48.815573, 2.424973 48.915573, 2.224973 48.915573, 2.224973 48.815573))'), 4326));

DROP TABLE IF EXISTS sleigh_locations;
CREATE TABLE sleigh_locations (
    timestamp TIMESTAMP WITH TIME ZONE,
    coordinate GEOMETRY(Point, 4326)
);


INSERT INTO sleigh_locations (timestamp, coordinate) VALUES
    ('2024-12-24 20:00:00+00', ST_SetSRID(ST_Point(-73.985130, 40.758896), 4326)),
    ('2024-12-24 20:15:00+00', ST_SetSRID(ST_Point(-73.850272, 40.817577), 4326)),
    ('2024-12-24 20:30:00+00', ST_SetSRID(ST_Point(-73.920272, 40.837577), 4326)),
    ('2024-12-24 20:45:00+00', ST_SetSRID(ST_Point(-73.880272, 40.797577), 4326)),
    ('2024-12-24 21:00:00+00', ST_SetSRID(ST_Point(-73.900272, 40.807577), 4326)),
    ('2024-12-24 21:15:00+00', ST_SetSRID(ST_Point(-118.243683, 34.052235), 4326)),
    ('2024-12-24 21:30:00+00', ST_SetSRID(ST_Point(-118.343683, 34.152235), 4326)),
    ('2024-12-24 21:45:00+00', ST_SetSRID(ST_Point(-118.443683, 34.252235), 4326)),
    ('2024-12-24 22:00:00+00', ST_SetSRID(ST_Point(-118.543683, 34.152235), 4326)),
    ('2024-12-24 22:15:00+00', ST_SetSRID(ST_Point(139.691706, 35.689487), 4326)),
    ('2024-12-24 22:30:00+00', ST_SetSRID(ST_Point(139.791706, 35.789487), 4326)),
    ('2024-12-24 22:45:00+00', ST_SetSRID(ST_Point(139.591706, 35.689487), 4326)),
    ('2024-12-24 23:00:00+00', ST_SetSRID(ST_Point(-0.124828, 51.496878), 4326)),
    ('2024-12-24 23:15:00+00', ST_SetSRID(ST_Point(-0.024828, 51.496878), 4326)),
    ('2024-12-24 23:30:00+00', ST_SetSRID(ST_Point(-0.074828, 51.516878), 4326)),
    ('2024-12-24 23:45:00+00', ST_SetSRID(ST_Point(-0.094828, 51.506878), 4326)),
    ('2024-12-25 00:00:00+00', ST_SetSRID(ST_Point(2.324973, 48.865573), 4326)),
    ('2024-12-25 00:15:00+00', ST_SetSRID(ST_Point(2.354973, 48.885573), 4326)),
    ('2024-12-25 01:30:00+00', ST_SetSRID(ST_Point(2.374973, 48.895573), 4326));