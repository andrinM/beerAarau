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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create the 'prices' table to link venues and beers with a price
-- CREATE TABLE `prices` (
--   `id` INT NOT NULL AUTO_INCREMENT,
--   `venue_id` INT NOT NULL,
--   `beer_id` INT NOT NULL,
--   `price` DECIMAL(6, 2) NOT NULL,
--   `volume_ml` INT NOT NULL,
--   `last_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   PRIMARY KEY (`id`),
--   FOREIGN KEY (`venue_id`) REFERENCES `venues`(`id`) ON DELETE CASCADE,
--   FOREIGN KEY (`beer_id`) REFERENCES `beers`(`id`) ON DELETE CASCADE
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
