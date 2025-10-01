-- This SQL script creates the tables for your beer prices application.
-- You can run this script in a tool like phpMyAdmin provided by your host.

-- Create the 'venues' table to store bar/pub information
-- CREATE TABLE `venues` (
--   `id` INT NOT NULL AUTO_INCREMENT,
--   `name` VARCHAR(255) NOT NULL,
--   `address` VARCHAR(255) NOT NULL,
--   `lat` DECIMAL(10, 8) NOT NULL,
--   `lng` DECIMAL(11, 8) NOT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create the 'beers' table to store different types of beers
CREATE TABLE `beers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `brewery` VARCHAR(255) NULL,
  `volume` DECIMAL(10, 2),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE bars (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    street VARCHAR(255),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8)
);

CREATE TABLE bar_has_beers (
    bar_id INT NOT NULL,
    beer_id INT NOT NULL,
    price DECIMAL(10, 2), 
    PRIMARY KEY (bar_id, beer_id),
    FOREIGN KEY (bar_id) REFERENCES bars(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (beer_id) REFERENCES beers(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- INSERT INTO `beers` (`name`, `brewery`, `volume`) VALUES
-- ('Quellfrösch Hell', 'Brauerei Locher AG.', 0.5),
-- ('Braufrisch', 'Feldschlösschen AG', 0.5),
-- ('Chopfab Draft', 'Chopfab Boxer AG', 0.5),
-- ('Calanda Glatsch', 'Calanda Bräu', 0.5);

-- INSERT INTO `bars` (`name`, `street`, `latitude`, `longitude`) VALUES
-- ('Mad Cat', 'Adelbändli 12','47.39301742991872', '8.042737828863576'),
-- ('Tuchlaube Cafe Bar', 'Metzgergasse 18','47.394087632806894', '8.04377029999985'),
-- ('Theo', 'Pelzgasse 29', '47.392450215624045', '8.04444717114053');

