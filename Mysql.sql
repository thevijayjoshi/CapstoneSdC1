create database capstone_db_c1_g7;
use capstone_db_c1_g7;
CREATE TABLE cart
(
    user_id bigint NOT NULL,
    CONSTRAINT cart_pkey1 PRIMARY KEY (user_id)
);


CREATE TABLE discount
(
    id character varying(255) NOT NULL,
    status bigint,
    CONSTRAINT discount_pkey PRIMARY KEY (id)
);

CREATE TABLE product_category
(
    category_id integer NOT NULL,
    category_name character varying(255) ,
    category_type integer,
    create_time timestamp ,
    update_time timestamp ,
    CONSTRAINT product_category_pkey PRIMARY KEY (category_id),
    CONSTRAINT uk_6kq6iveuim6wd90cxo5bksumw UNIQUE (category_type)
);

ALTER TABLE `product_category` 
CHANGE COLUMN `category_id` `category_id` INT NOT NULL AUTO_INCREMENT ;


CREATE TABLE product_info
(
    product_id character varying(255)  NOT NULL,
    product_name character varying(255)  NOT NULL,
    product_price numeric(19,2) NOT NULL,
    product_stock integer NOT NULL,
    product_description character varying(255) ,
     product_icon character varying(255) , 
     product_status integer DEFAULT 0,
    category_type integer DEFAULT 0,
    create_time timestamp ,
    update_time timestamp ,
    CONSTRAINT product_info_pkey PRIMARY KEY (product_id),
    CONSTRAINT product_info_product_stock_check CHECK (product_stock >= 0)
);

CREATE TABLE users
(
    id bigint NOT NULL,
    active boolean NOT NULL,
    address character varying(255) ,
    email character varying(255) ,
    name character varying(255) ,
    password character varying(255) ,
    phone character varying(255) ,
    role character varying(255) ,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT uk_sx468g52bpetvlad2j9y0lptc UNIQUE (email)
);

ALTER TABLE `users` 
CHANGE COLUMN `id` `id` BIGINT NOT NULL AUTO_INCREMENT ;



CREATE TABLE order_main
(
    order_id bigint NOT NULL,
    buyer_address character varying(255) ,
    buyer_email character varying(255) ,
    buyer_name character varying(255) ,
    buyer_phone character varying(255) ,
    create_time timestamp,
    order_amount numeric(19,2) NOT NULL,
    order_status integer NOT NULL DEFAULT 0,
    update_time timestamp,
    CONSTRAINT order_main_pkey PRIMARY KEY (order_id)
);

ALTER TABLE `order_main` 
CHANGE COLUMN `order_id` `order_id` BIGINT NOT NULL AUTO_INCREMENT ;



CREATE TABLE product_in_order
(
    id bigint NOT NULL AUTO_INCREMENT,
    category_type integer NOT NULL,
    count integer,
    product_description character varying(255)  NOT NULL,
    product_icon character varying(255) ,
    product_id character varying(255) ,
    product_name character varying(255) ,
    product_price numeric(19,2) NOT NULL,
    product_stock integer,
    cart_user_id bigint,
    order_id bigint,
    CONSTRAINT product_in_order_pkey PRIMARY KEY (id),
    CONSTRAINT fkt0sfj3ffasrift1c4lv3ra85e FOREIGN KEY (order_id)
        REFERENCES order_main (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product_cart_fkey FOREIGN KEY (cart_user_id)
        REFERENCES cart (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        ,
    CONSTRAINT product_in_order_count_check CHECK (count >= 1),
    CONSTRAINT product_in_order_product_stock_check CHECK (product_stock >= 0)
);



CREATE TABLE wishlist
(
    id bigint NOT NULL AUTO_INCREMENT,
    created_date timestamp ,
    user_id bigint,
    product_id character varying(255),
    CONSTRAINT wishlist_pkey PRIMARY KEY (id),
    CONSTRAINT product_wish_fkey FOREIGN KEY (product_id)
        REFERENCES product_info (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT user_wish_Fkey FOREIGN KEY (user_id)
        REFERENCES users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

ALTER TABLE `discount`
ADD COLUMN user_email VARCHAR(255);

ALTER TABLE `discount` 
ADD INDEX `user_email_fkey_idx` (`user_email` ASC) ;
;
ALTER TABLE `discount` 
ADD CONSTRAINT `user_email_fkey`
  FOREIGN KEY (`user_email`)
  REFERENCES `users` (`email`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `discount` 
DROP PRIMARY KEY;
;

ALTER TABLE `discount` 
ADD COLUMN `coupon` VARCHAR(255) NULL AFTER `user_email`,
CHANGE COLUMN `id` `id` BIGINT NOT NULL ,
ADD PRIMARY KEY (`id`);
;

ALTER TABLE `discount` 
CHANGE COLUMN `id` `id` BIGINT NOT NULL AUTO_INCREMENT ;



INSERT INTO product_category VALUES (1, 'Furniture', 0, '2022-08-18 19:03:26', '2022-08-18 19:03:26');
INSERT INTO product_category VALUES (2, 'Living Room', 1, '2022-08-18 19:03:27', '2022-08-18 19:03:27');
INSERT INTO product_category VALUES (3, 'Lamps and Lightining ', 2, '2022-08-18 19:03:27', '2022-08-18 19:03:27');
INSERT INTO product_category VALUES (4, 'Sofas & Recliner', 3, '2022-08-18 19:03:28', '2022-08-18 19:03:28');

INSERT INTO product_info VALUES ('C01','Coffee Table',3149,25,'Premium coffee table with mat colour','https://ii1.pepperfry.com/media/catalog/product/s/i/800x880/silvio-coffee-table-in-natural-finish-silvio-coffee-table-in-natural-finish-y29a3z.jpg',0,0,'2022-08-18 19:03:26','2022-08-18 19:03:26');
INSERT INTO product_info VALUES ('C02','Dining Table',712,50,'Premium 4 seater dining table with water proof ','https://ii1.pepperfry.com/media/catalog/product/p/e/800x880/peak-4-seater-dining-set-in-cappuccino-finish-by--home-peak-4-seater-dining-set-in-cappuccino-finish-jdtget.jpg',0,0,'2022-08-18 19:03:26','2022-08-18 19:03:26');
INSERT INTO product_info VALUES ('C03','Shoe Rack',3129,100,'Stylish. Modern. Shoe rack','https://ii1.pepperfry.com/media/catalog/product/a/l/800x880/alpine-shoe-cabinet-in-walnut-finish-by-nilkamal-alpine-shoe-cabinet-in-walnut-finish-by-nilkamal-7bs5cg.jpg',0,0,'2022-08-18 19:03:26','2022-08-18 19:03:26');
INSERT INTO product_info VALUES ('C04','Study Table',2319,29,'Easy to clean and maintain, this table is worth investing in.','https://ii1.pepperfry.com/media/catalog/product/s/h/800x880/shinichi-study-table-in-columbia-walnut-finish--by-valuewud-by-pepperfry-shinichi-study-table-in-col-lgkhbo.jpg',0,0,'2022-08-18 19:03:26','2022-08-18 19:03:26');

INSERT INTO product_info VALUES ('S01','Wall Light',10810,78,'Wall light for house decor','https://ii1.pepperfry.com/media/catalog/product/n/a/494x544/natural-feel-brown-bamboo-cluster-hanging-lamp-by-radhika-dahlan-natural-feel-brown-bamboo-cluster-h-frx5wz.jpg',0,1,'2022-08-18 19:03:26','2022-08-18 19:03:26');
INSERT INTO product_info VALUES ('S02','Wall Clock',8747,85,'Frame material: Neem wood, Support material: MDF & plywood','https://ii3.pepperfry.com/media/catalog/product/r/a/494x544/random-multicolour-mdf-wood-15-x-2-x-15-inch-ocean-wall-clock-random-multicolour-mdf-wood-15-x-2-x-1-cfr6zn.jpg',0,1,'2022-08-18 19:03:26','2022-08-18 19:03:26');
INSERT INTO product_info VALUES ('S03','Floor Cushion',12900,67,'Made up of 100% cotton','https://ii1.pepperfry.com/media/catalog/product/w/i/800x880/wine-solid-100--cotton-16x16-floral-cushion-by-blanc-9-wine-solid-100--cotton-16x16-floral-cushion-b-ww2rdn.jpg',0,1,'2022-08-18 19:03:26','2022-08-18 19:03:26');
INSERT INTO product_info VALUES ('S04','Food Splatter ',5185,88,' Food Splatter with fork','https://ii1.pepperfry.com/media/catalog/product/f/r/800x880/frangipani-wooden-serving-platter-by-elementry-frangipani-wooden-serving-platter-by-elementry-bvjlfg.jpg',0,1,'2022-08-18 19:03:26','2022-08-18 19:03:26');

INSERT INTO product_info VALUES ('W01','Wall Light',1499,52,'Decorate your walls with these well designed wall light','https://ii3.pepperfry.com/media/catalog/product/o/f/494x544/offwhite-fabric-shade-4-tier-shelf-storage-floor-lamp-with-wood-base-by-sanded-edge-offwhite-fabric--bfneld.jpg',0,2,'2022-08-18 19:03:26','2022-08-18 19:03:26');
INSERT INTO product_info VALUES ('W02','Wall Light',849,103,'Better for office with automatic off and on','https://ii1.pepperfry.com/media/catalog/product/s/l/800x880/slimline-36-trio-wooden-led-hanging-lamp--brown--by-symplify-interio-slimline-36-trio-wooden-led-han-eutwom.jpg',0,2,'2022-08-18 19:03:26','2022-08-18 19:03:26');
INSERT INTO product_info VALUES ('W03','Bed Lamp',3858,90,'Best for study purpose','https://ii1.pepperfry.com/media/catalog/product/c/a/800x880/catalina-white-shade-table-lamp-with-metal-base-by-casacraft-catalina-white-shade-table-lamp-with-me-b51ev5.jpg',0,2,'2022-08-18 19:03:26','2022-08-18 19:03:26');
INSERT INTO product_info VALUES ('W04','Ultra modern newton lamp',699,200,'Recharges solar item','https://ii1.pepperfry.com/media/catalog/product/l/a/800x880/lamberth-ultra-modern-wall-lamp-by-kapoor-e-illuminations-lamberth-ultra-modern-wall-lamp-by-kapoor--kndnad.jpg',0,2,'2022-08-18 19:03:26','2022-08-18 19:03:26');
-- INSERT INTO product_info VALUES ('W05','Wall Light',1499,52,'Decorate your walls with these well designed wall light','https://ii3.pepperfry.com/media/catalog/product/o/f/494x544/offwhite-fabric-shade-4-tier-shelf-storage-floor-lamp-with-wood-base-by-sanded-edge-offwhite-fabric--bfneld.jpg',0,2,'2022-08-18 19:03:26','2022-08-18 19:03:26');

INSERT INTO product_info VALUES ('M01','Printed sofa with 3d art',2496,80,'This comes with 3 + 2 seating and 3d print on cloth lasts long','https://ii3.pepperfry.com/media/catalog/product/j/e/494x544/jerrish-wing-chair-in-cream-colour-with-ottoman-by-muebles-casa-jerrish-wing-chair-in-cream-colour-w-pqslxc.jpg',0,3,'2022-08-18 19:03:26','2022-08-18 19:03:26');
INSERT INTO product_info VALUES ('M02','Single seater sofa',1539,99,'Single seater sofa with pillow','https://ii3.pepperfry.com/media/wysiwyg/banners/Sofasrecliners_bb_web_20012021_2x_3.jpg',0,3,'2022-08-18 19:03:26','2022-08-18 19:03:26');
INSERT INTO product_info VALUES ('M03','Recliner',3952,500,'A perfect recliner for the movie nights','https://ii1.pepperfry.com/media/catalog/product/c/a/800x880/carerra-1-seater-leatherette-recliner-in-dark-brown-colour-by-casacraft-carerra-1-seater-leatherette-lcctwt.jpg',0,3,'2022-08-18 19:03:26','2022-08-18 19:03:26');
INSERT INTO product_info VALUES ('M04','3 seater recliner',999,90,'Perfect for the 3 members','https://ii1.pepperfry.com/media/catalog/product/r/h/800x880/rhea-3-seater-recliner-in-brown-colour-by-hometown-rhea-3-seater-recliner-in-brown-colour-by-hometow-8859pr.jpg',0,3,'2022-08-18 19:03:26','2022-08-18 19:03:26');

INSERT INTO users VALUES (1, true, 'Plot 456, Nargarjuna Nagar, Delhi', 'manager1@gmail.com', 'Admin', '$2a$10$LiBwO43TpKU0sZgCxNkWJueq2lqxoUBsX2Wclzk8JQ3Ejb9MWu2Xy', '1234567890', 'ROLE_MANAGER');




