INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Power Tools', 'DeWalt', 'Cordless Drill', 129.99, 25);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Hand Tools', 'Stanley', 'Claw Hammer', 14.99, 50);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Safety Equipment', '3M', 'Respirator Mask', 29.99, 100);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Lifting Equipment', 'Genie', 'Material Lift', 1499.99, 5);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Concrete Tools', 'Marshalltown', 'Concrete Trowel', 29.99, 75);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Power Tools', 'Makita', 'Circular Saw', 179.99, 15);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Hand Tools', 'Klein Tools', 'Needle Nose Pliers', 12.99, 100);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Safety Equipment', 'Radians', 'Safety Glasses', 9.99, 200);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Lifting Equipment', 'JLG', 'Scissor Lift', 8999.99, 2);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Concrete Tools', 'Kraft Tool', 'Concrete Groover', 34.99, 50);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Power Tools', 'Bosch', 'Angle Grinder', 89.99, 30);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Hand Tools', 'Channellock', 'Tongue and Groove Pliers', 18.99, 75);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Safety Equipment', 'MSA', 'Hard Hat', 24.99, 150);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Lifting Equipment', 'Bobcat', 'Skid Steer Loader', 29999.99, 1);

INSERT INTO item (category, company_name, item_name, price, quantity)
VALUES ('Concrete Tools', 'Bon Tool', 'Concrete Bull Float', 89.99, 25);

update item set price=price * 80 where item_id in(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
