DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;
SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL
);

ALTER TABLE isuumo.estate ADD INDEX esate_popularity(popularity);

-- get api/estate/search
-- where: door_height, door_width, rent, features
-- order by: popularity, id

ALTER TABLE isuumo.estate ADD INDEX esate_door_height(door_height);
ALTER TABLE isuumo.estate ADD INDEX esate_door_width(door_width);
ALTER TABLE isuumo.estate ADD INDEX esate_rent(rent);
ALTER TABLE isuumo.estate ADD INDEX esate_features(features);

-- -popularity
ALTER TABLE isuumo.estate ADD COLUMN popularity_desc INTEGER;
UPDATE isuumo.estate SET popularity_desc = -1 * popularity;
ALTER TABLE isuumo.estate ADD INDEX estate_popularity_id(popularity_desc, id);


CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL
);

-- get api/chair/search
-- where: price, height, width, depth, kind, color, features, stock
-- order by: popularity, id

ALTER TABLE isuumo.chair ADD INDEX chair_price(price);
ALTER TABLE isuumo.chair ADD INDEX chair_height(height);
ALTER TABLE isuumo.chair ADD INDEX chair_width(width);
ALTER TABLE isuumo.chair ADD INDEX chair_depth(depth);
ALTER TABLE isuumo.chair ADD INDEX chair_kind(kind);
ALTER TABLE isuumo.chair ADD INDEX chair_color(color);
ALTER TABLE isuumo.chair ADD INDEX chair_features(features);
ALTER TABLE isuumo.chair ADD INDEX chair_stock(stock);
ALTER TABLE isuumo.chair ADD INDEX chair_popularity(popularity);


