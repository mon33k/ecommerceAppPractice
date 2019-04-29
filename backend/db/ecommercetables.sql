DROP DATABASE IF EXISTS ecommercetables;
CREATE DATABASE ecommercetables;

\c ecommercetables;

-- DROP TABLE IF EXISTS users, orders, products, shoppingcart, inventory;

CREATE TABLE users (
    users_id SERIAL PRIMARY KEY UNIQUE,
    username VARCHAR UNIQUE NOT NULL,
    fullname VARCHAR UNIQUE NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    user_address VARCHAR UNIQUE NULL,
    firebase_uid VARCHAR NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    users_id INT REFERENCES users (users_id),
    order_customer_address VARCHAR NOT NULL REFERENCES users (user_address),
    order_return_address VARCHAR NOT NULL,
    order_total VARCHAR NOT NULL
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    category VARCHAR NOT NULL,
    gender VARCHAR NOT NULL,
    item_type VARCHAR NOT NULL,
    item_caption VARCHAR NOT NULL,
    item_description VARCHAR NULL,
    item_img_url VARCHAR NOT NULL,
    item_price VARCHAR NOT NULL
);

CREATE TABLE shoppingcart (
    order_id INT NOT NULL REFERENCES orders (order_id),
    product_id INT NOT NULL REFERENCES products (product_id)
);

CREATE TABLE inventory (
    product_id INT NOT NULL REFERENCES products (product_id),
    xs INT NULL,
    s INT NULL,
    m INT NULL, 
    l INT NULL, 
    xl INT NULL,
    xxl INT NULL
);


INSERT INTO users ( username, fullname, email, user_address, firebase_uid) values ( 'usertest', 'user test', 'test@test.com', '4 Carioca Plaza', 'mPV5r4UQYEehsrulVVWETgF6rPl2');
INSERT INTO users ( username, fullname, email, user_address, firebase_uid) values ( 'dhembry1', 'Duffy Hembry', 'duffy@test.com', '92 Sage Crossing','3vTK0v80rAd2Q8fZ4UTQXAGkvhe2');
INSERT INTO users ( username, fullname, email, user_address, firebase_uid) values ( 'ashearn2', 'Anthia Shearn', 'ant@test.com', '390 Independence Drive', 'Hb2WVC2ZI1YiZWF8FW7F0tfUy7e2');
INSERT INTO users ( username, fullname, email, user_address, firebase_uid) values ( 'gwhild3', 'Gunter Whild', 'gunter@test.com', '444 Sugar Trail', 'ZCeztykPdhQ1w1ovcUS04IPKrkx1');
INSERT INTO users ( username, fullname, email, user_address, firebase_uid) values ( 'ffarens4', 'Fernande Farens', 'faren@test.com', '6163 Carpenter Junction', '8GPL4MCHTtM5dRVyAhlAuytSLQh2');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (6, 'fmontier5', 'Francisca Montier', 'fmontier5@uol.com.br', '03888 New Castle Way');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (7, 'hkaaskooper6', 'Hadley Kaaskooper', 'hkaaskooper6@addtoany.com', '1103 Forest Dale Court');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (8, 'alydden7', 'Ashlan Lydden', 'alydden7@buzzfeed.com', '54927 Loftsgordon Park');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (9, 'bcockcroft8', 'Burton Cockcroft', 'bcockcroft8@reddit.com', '87884 Eagan Court');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (10, 'mschukraft9', 'Martica Schukraft', 'mschukraft9@barnesandnoble.com', '54 Alpine Circle');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (11, 'rbrowsea', 'Rory Browse', 'rbrowsea@google.ca', '97200 Weeping Birch Point');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (12, 'ljagiellob', 'Lari Jagiello', 'ljagiellob@indiegogo.com', '064 Michigan Terrace');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (13, 'tvelasquezc', 'Tierney Velasquez', 'tvelasquezc@bizjournals.com', '11 Hanover Hill');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (14, 'abellefantd', 'Annnora Bellefant', 'abellefantd@wufoo.com', '6277 6th Way');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (15, 'bjosofovitze', 'Bale Josofovitz', 'bjosofovitze@elegantthemes.com', '99229 Colorado Circle');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (16, 'wllewellenf', 'Warden Llewellen', 'wllewellenf@sciencedirect.com', '18 Utah Crossing');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (17, 'kswadlingeg', 'Kenyon Swadlinge', 'kswadlingeg@techcrunch.com', '215 Ridgeview Center');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (18, 'teggleh', 'Timmi Eggle', 'teggleh@prweb.com', '21 Toban Pass');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (19, 'aplaskitti', 'Annadiane Plaskitt', 'aplaskitti@smugmug.com', '8 Manley Alley');
-- INSERT INTO users (users_id, username, fullname, email, user_address) values (20, 'mpynej', 'Marney Pyne', 'mpynej@huffingtonpost.com', '4196 Pepper Wood Trail');

-- INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (1, 6, '03888 New Castle Way', '100 Random ln', '15.25');
INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (2, 2, '92 Sage Crossing', '100 Random ln', '151.5');
-- INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (3, 20, '4196 Pepper Wood Trail', '100 Random ln', '151.5');
-- INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (4, 6, '03888 New Castle Way', '100 Random ln', '226.47');
-- INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (5, 12, '064 Michigan Terrace', '100 Random ln', '77');
-- INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (6, 9, '87884 Eagan Court', '100 Random ln', '90.9');        
INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (7, 5, '6163 Carpenter Junction', '100 Random ln', '118.76');
-- INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (8, 13, '11 Hanover Hill', '100 Random ln', '111.75');
-- INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (9, 4, '444 Sugar Trail', '100 Random ln', '90.9');
-- INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (10, 2, '92 Sage Crossing', '100 Random ln', '50.00');
INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (11, 1, '4 Carioca Plaza', '100 Random ln', '268.72');
INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (12, 1, '4 Carioca Plaza', '100 Random ln', '15.25');
INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (13, 3, '390 Independence Drive', '100 Random ln', '61.75');
-- INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (14, 13, '11 Hanover Hill', '100 Random ln', '164');
-- INSERT INTO orders (order_id, users_id, order_customer_address, order_return_address, order_total) values (15, 11, '97200 Weeping Birch Point', '100 Random ln', '222.72');

INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('spring', 'Male', 'shirt', 'Floral Short Sleeve Button Up', 'Floral pattern shirt 100% cotton wooden buttons', 'http://dummyimage.com/100x100.png/dddddd/000000', '50.00');  
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('summer', 'Female', 'dress', 'Polkadot Sun Dress', 'Backless sundress 50% polyester 50% nylon fabric', 'http://dummyimage.com/100x100.png/dddddd/000000', '25.00');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('summer', 'Male', 'shorts', 'Beach Shorts', 'Swim wear 100% synthetic fibers water repellent fabric', 'http://dummyimage.com/100x100.png/ff4444/ffffff', '85.35');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('spring', 'Female', 'rainboot', 'Yellow Rainboots', 'Rainboots water resistant material', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', '48.26');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('spring', 'Male', 'jacket', 'Light Rain Jacket', 'Water resistant material tested in the rainiest of regions', 'http://dummyimage.com/100x100.png/dddddd/000000', '50.00');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('summer', 'Female', 'swimsuit', 'Light Blue Swimsuit', 'Swimsuit for the summer 20% made of seaweed', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', '40.50');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('fall', 'Male', 'jeans', 'Faded jeans',  'Jeans that look good', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', '35.75');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('fall', 'Female', 'jeans', 'Jeans with pockets', 'Keep stuff in your pockets', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', '45.25');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('summer', 'Male', 'sandals', 'Durable sandals 100% real material', 'A baby goat was used to sacrifice these sandals', 'http://dummyimage.com/100x100.png/ff4444/ffffff', '50.50');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('summer', 'Female', 'sandals', 'Durable sandals 100% real material', 'A baby goat was used to sacrifice these sandals', 'http://dummyimage.com/100x100.png/cc0000/ffffff', '30.25');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('winter', 'Male', 'shirt', 'Long sleeve shirt', 'This shirt is cool its warm', 'http://dummyimage.com/100x100.png/dddddd/000000', '42.25');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('winter', 'Male', 'shirt', 'Long sleeve shirt', 'This shirt is cool its warm', 'http://dummyimage.com/100x100.png/ff4444/ffffff', '103');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('winter', 'Female', 'shirt', 'Long sleeve shirt', 'This shirt is cool its warm', 'http://dummyimage.com/100x100.png/cc0000/ffffff', '1.75');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('fall', 'Female', 'shirt', 'Long sleeve shirt', 'This shirt is cool its warm', 'http://dummyimage.com/100x100.png/ff4444/ffffff', '350');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('summer', 'Male', 'sandals', 'Durable sandals 100% real material', 'A baby goat was used to sacrifice these sandals', 'http://dummyimage.com/100x100.png/ff4444/ffffff', '40.90');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('fall', 'Male', 'jacket', 'Sensible fall jacket', 'A smart move to get this one', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', '70.50');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('spring', 'Female', 'pants', 'Professional black slacks', 'Water repellant material', 'http://dummyimage.com/100x100.png/dddddd/000000', '3.75');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('summer', 'Male', 'shorts', 'Great shorts', 'Only the best of shorts', 'http://dummyimage.com/100x100.png/ff4444/ffffff', '5.25');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('spring', 'Female', 'pants', 'Pants with pants', 'Go out and feel great in your pants', 'http://dummyimage.com/100x100.png/cc0000/ffffff', '222.72');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('winter', 'Male', 'boot', 'Durable Winter Leather Boots', 'Walk in the snow', 'http://dummyimage.com/100x100.png/ff4444/ffffff', '5000');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('fall', 'Male', 'boot', 'Durable Winter Leather Boots', 'Walk in the snow', 'http://dummyimage.com/100x100.png/dddddd/000000', '122');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('winter', 'Male', 'boot', 'Durable Winter Leather Boots', 'Walk in the snow', 'http://dummyimage.com/100x100.png/ff4444/ffffff', '25.50');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('fall', 'Female', 'boot', 'Durable Winter Leather Boots', 'Walk in the snow', 'http://dummyimage.com/100x100.png/ff4444/ffffff', '115.75');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('summer', 'Male', 'sunglasses', 'Sun resistant sunglasses', '100% SPF proof around your eyes', 'http://dummyimage.com/100x100.png/dddddd/000000', '42.25');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('summer', 'Male', 'sunglasses', 'Sun resistant sunglasses', '100% SPF proof around your eyes', 'http://dummyimage.com/100x100.png/dddddd/000000', '35.25');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('winter', 'Female', 'jeans', 'Fleece lined jeans', 'really warm jeans for winter', 'http://dummyimage.com/100x100.png/cc0000/ffffff', '62.25');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('summer', 'Male', 'sunglasses', 'Sun resistant sunglasses', '100% SPF proof around your eyes', 'http://dummyimage.com/100x100.png/cc0000/ffffff', '52.50');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('fall', 'Female', 'jacket', 'Fleece lined jean jacket', 'Really warm when used as a jacket', 'http://dummyimage.com/100x100.png/ff4444/ffffff', '61.75');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('fall', 'Male', 'jacket', 'Fleece lined jean jacket', 'Really warm when used as a jacket', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', '15.25');
INSERT INTO products (category, gender, item_type, item_caption, item_description, item_img_url, item_price) values ('spring', 'Male', 'rainboot', 'Green Rainboots', 'Rainboots water resistant material', 'http://dummyimage.com/100x100.png/dddddd/000000', '12.42');



-- INSERT INTO shoppingcart (order_id, product_id) values (12, 29);
INSERT INTO shoppingcart (order_id, product_id) values (11, 19);
-- INSERT INTO shoppingcart (order_id, product_id) values (7, 4);
-- INSERT INTO shoppingcart (order_id, product_id) values (14, 27);
-- INSERT INTO shoppingcart (order_id, product_id) values (3, 23);
-- INSERT INTO shoppingcart (order_id, product_id) values (10, 5);
INSERT INTO shoppingcart (order_id, product_id) values (13, 28);
-- INSERT INTO shoppingcart (order_id, product_id) values (14, 25);
-- INSERT INTO shoppingcart (order_id, product_id) values (14, 6);
-- INSERT INTO shoppingcart (order_id, product_id) values (3, 7);
-- INSERT INTO shoppingcart (order_id, product_id) values (15, 19);
-- INSERT INTO shoppingcart (order_id, product_id) values (9, 1);
-- INSERT INTO shoppingcart (order_id, product_id) values (8, 5);
INSERT INTO shoppingcart (order_id, product_id) values (11, 11);
-- INSERT INTO shoppingcart (order_id, product_id) values (8, 28);
INSERT INTO shoppingcart (order_id, product_id) values (7, 16);
-- INSERT INTO shoppingcart (order_id, product_id) values (14, 7);
INSERT INTO shoppingcart (order_id, product_id) values (11, 17);
INSERT INTO shoppingcart (order_id, product_id) values (11, 29);
-- INSERT INTO shoppingcart (order_id, product_id) values (9, 15);
-- INSERT INTO shoppingcart (order_id, product_id) values (1, 29);
INSERT INTO shoppingcart (order_id, product_id) values (2, 7);
INSERT INTO shoppingcart (order_id, product_id) values (2, 23);
-- INSERT INTO shoppingcart (order_id, product_id) values (4, 17);
-- INSERT INTO shoppingcart (order_id, product_id) values (4, 19);
-- INSERT INTO shoppingcart (order_id, product_id) values (5, 29);
-- INSERT INTO shoppingcart (order_id, product_id) values (5, 28);
-- INSERT INTO shoppingcart (order_id, product_id) values (6, 15);
-- INSERT INTO shoppingcart (order_id, product_id) values (6, 5);



INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (1, 12, 10, 18, 18, 2, 7);
INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (2, 3, 16, 19, 9, 5, 1);
INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (3, 20, 14, 10, 8, 5, 15);
INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (4, 20, 17, 11, 12, 14, 17);
INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (5, 20, 20, 3, 14, 14, 9);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (6, 14, 13, 7, 9, 14, 6);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (7, 10, 7, 10, 7, 7, 16);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (8, 20, 9, 6, 10, 15, 14);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (9, 18, 18, 15, 5, 18, 8);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (10, 13, 4, 17, 8, 18, 7);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (11, 6, 18, 10, 16, 1, 3);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (12, 10, 8, 10, 5, 13, 7);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (13, 5, 2, 15, 20, 16, 5);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (14, 5, 20, 2, 20, 16, 10);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (15, 19, 12, 16, 19, 19, 14);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (16, 17, 8, 18, 9, 2, 5);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (17, 6, 4, 16, 17, 18, 3);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (18, 14, 20, 19, 8, 7, 2);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (19, 14, 8, 18, 19, 3, 2);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (20, 8, 12, 18, 9, 14, 1);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (21, 3, 18, 15, 18, 4, 12);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (22, 10, 20, 14, 6, 17, 18);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (23, 9, 16, 19, 19, 4, 3);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (24, 15, 13, 14, 6, 4, 3);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (25, 6, 2, 2, 1, 9, 19);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (26, 14, 5, 7, 17, 5, 19);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (27, 4, 9, 7, 6, 20, 2);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (28, 3, 15, 11, 1, 2, 7);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (29, 15, 1, 5, 10, 5, 14);
-- INSERT INTO inventory (product_id, xs, s, m, l, xl, xxl) values (30, 9, 8, 16, 8, 10, 3);