drop table if exists purchase;
drop table if exists store;
drop table if exists customer;
drop table if exists item;

CREATE TABLE store (
    id SERIAL PRIMARY KEY,
    name text,
    address text,
    city text,
    state text,
    country text,
    postal_code VARCHAR(10),
    latitude NUMERIC(10, 6),
    longitude NUMERIC(10, 6)
);

create table customer (
    id SERIAL,
    first_name text,
    last_name text,
    email text,
    lifetime_value int,
    primary key (id)
);

create table item (
    id SERIAL,
    name text,
    description text,
    price int,
    cost int,
    primary key (id)
);

create table purchase (
    id SERIAL,
    store_id int,
    item_id int,
    customer_id int,
    total_quantity int, 
    price int,
    order_placed timestamp,
    order_collected timestamp,
    primary key (id),
    constraint customer_fk foreign key(customer_id) references customer(id),
    constraint store_fk foreign key(store_id) references store(id),
    constraint item_fk foreign key(item_id) references item(id)
);

BEGIN;

INSERT INTO item (name, description, price, cost)
VALUES 
('Espresso', 'Strong, full-bodied coffee', 2500, 1000),
('Americano', 'Espresso diluted with hot water', 3000, 1200),
('Latte', 'Espresso with steamed milk and milk foam', 3500, 1400),
('Cappuccino', 'Equal parts of espresso, steamed milk and milk foam', 3500, 1400),
('Macchiato', 'Espresso with a small amount of milk foam', 3000, 1200),
('Mocha', 'Espresso with steamed milk and chocolate', 4000, 1600),
('Green Tea', 'Healthy green tea', 2500, 1000),
('Black Tea', 'Classic black tea', 2500, 1000),
('Chai Latte', 'Spiced tea with milk', 3500, 1400),
('Iced Coffee', 'Chilled coffee with ice', 3500, 1400),
('Iced Tea', 'Chilled tea with ice', 3000, 1200),
('Lemonade', 'Freshly squeezed lemonade', 3000, 1200),
('Bagel', 'Freshly baked bagel', 3000, 1200),
('Croissant', 'Buttery and flaky croissant', 3500, 1400),
('Danish', 'Sweet pastry', 3500, 1400),
('Blueberry Muffin', 'Blueberry filled muffin', 4000, 1600),
('Chocolate Chip Cookie', 'Cookie filled with chocolate chips', 3000, 1200),
('Brownie', 'Chocolate brownie', 4000, 1600),
('Chicken Sandwich', 'Sandwich with chicken filling', 6000, 2400),
('Ham Sandwich', 'Sandwich with ham filling', 6000, 2400),
('Veggie Sandwich', 'Sandwich with vegetable filling', 5500, 2200),
('Cheese Sandwich', 'Sandwich with cheese filling', 5500, 2200),
('Greek Salad', 'Salad with Greek ingredients', 6000, 2400),
('Caesar Salad', 'Classic Caesar Salad', 6000, 2400),
('Fruit Salad', 'Salad with various fruits', 5500, 2200),
('Chicken Soup', 'Soup made from chicken', 6000, 2400),
('Tomato Soup', 'Soup made from tomatoes', 5500, 2200),
('Mushroom Soup', 'Soup made from mushrooms', 5500, 2200),
('Veggie Soup', 'Soup made from various vegetables', 5500, 2200),
('Pumpkin Soup', 'Soup made from pumpkin', 5500, 2200),
('Vanilla Ice Cream', 'Sweet vanilla ice cream', 4000, 1600),
('Chocolate Ice Cream', 'Rich chocolate ice cream', 4000, 1600),
('Strawberry Ice Cream', 'Sweet strawberry ice cream', 4000, 1600),
('Smoothie', 'Fruit smoothie', 5000, 2000),
('Juice', 'Freshly squeezed juice', 4500, 1800),
('Biscuit', 'Sweet baked biscuit', 3000, 1200),
('Scone', 'Classic British scone', 3500, 1400),
('Banana Bread', 'Moist banana bread', 4000, 1600),
('Quiche', 'Savoury pastry', 5000, 2000),
('Pancake', 'Stack of pancakes with syrup', 5000, 2000);


INSERT INTO store (name,latitude, longitude, address, city, state, country, postal_code)
VALUES ('Quatz',-33.93274,151.188577,'04170 Cody Way','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Skimia',-33.8688197,151.2092955,'109 Fairview Alley','Sydney South','New South Wales','Australia',1235),
('Oba',-33.7974423,151.2502275,'02 Goodland Park','Sydney','New South Wales','Australia',1161),
('Centidel',-33.7974423,151.2502275,'832 Moose Street','Sydney','New South Wales','Australia',1191),
('Voomm',-37.8136276,144.9630576,'88216 Ridge Oak Hill','Melbourne','Victoria','Australia',8383),
('Midel',-33.8882671,151.2078465,'26 Marquette Center','Strawberry Hills','New South Wales','Australia',1424),
('Vidoo',-33.7974423,151.2502275,'2137 Union Center','Sydney','New South Wales','Australia',1196),
('Jayo',-33.8651294,151.2078882,'73640 Vahlen Terrace','Australia Square','New South Wales','Australia',1213),
('Zoonder',-38.043127,145.297768,'54 Eastwood Alley','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Trudeo',-37.7236851,144.9633285,'8 Marcy Trail','Sydney','New South Wales','Australia',1009),
('Feedbug',-38.043127,145.297768,'67394 Canary Street','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Jayo',-34.990888,138.574391,'2 Maywood Road','Adelaide Mail Centre','South Australia','Australia',5869),
('Meevee',-34.990888,138.574391,'5 Coleman Circle','Adelaide Mail Centre','South Australia','Australia',5899),
('Lajo',-31.9505269,115.8604572,'62 Manley Crossing','Perth','Western Australia','Australia',6817),
('InnoZ',-34.990888,138.574391,'5822 Corry Parkway','Adelaide Mail Centre','South Australia','Australia',5889),
('Photobug',-41.4332215,147.1440875,'9 Toban Place','Launceston','Tasmania','Australia',7916),
('Skyndu',-33.863927,151.201887,'06 Pierstorff Court','Sydney','New South Wales','Australia',1171),
('Tambee',-33.7974423,151.2502275,'70142 Quincy Place','Sydney','New South Wales','Australia',1181),
('Oyondu',-37.8136276,144.9630576,'69 Trailsway Lane','Melbourne','Victoria','Australia',8045),
('Edgepulse',-33.93274,151.188577,'6 Arrowood Place','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Katz',-33.7974423,151.2502275,'290 Mifflin Trail','Sydney','New South Wales','Australia',1134),
('Dynazzy',-27.9424308,153.3970962,'2082 Charing Cross Plaza','Sydney','New South Wales','Australia',1140),
('Zooxo',-33.93274,151.188577,'77 Union Junction','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Rhynoodle',-37.713929,144.962411,'9 Anthes Junction','Sydney','New South Wales','Australia',1120),
('Trudoo',-38.043127,145.297768,'63534 Armistice Drive','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Meembee',-33.7974423,151.2502275,'4566 Dovetail Parkway','Sydney','New South Wales','Australia',1161),
('Digitube',-38.043127,145.297768,'70299 Hallows Lane','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Gabtune',-33.7974423,151.2502275,'6644 Waubesa Trail','Sydney','New South Wales','Australia',1161),
('Chatterbridge',-33.7974423,151.2502275,'5518 Ludington Avenue','Sydney','New South Wales','Australia',1191),
('Kazu',-27.9424308,153.3970962,'16 Summerview Street','Sydney','New South Wales','Australia',1140),
('Youspan',-37.713929,144.962411,'69824 Trailsway Parkway','Sydney','New South Wales','Australia',1120),
('Camido',-33.8989712,151.2149792,'85697 Fremont Center','Sydney','New South Wales','Australia',1130),
('Divavu',-37.8136276,144.9630576,'4 Bluejay Park','Melbourne','Victoria','Australia',8383),
('Edgetag',-33.8688197,151.2092955,'19 Bartillon Place','Sydney South','New South Wales','Australia',1235),
('Dabtype',-33.8688197,151.2092955,'15 Kennedy Pass','Sydney','New South Wales','Australia',1033),
('LiveZ',-33.7974423,151.2502275,'68 Eastlawn Drive','Sydney','New South Wales','Australia',1134),
('Plambee',-42.8821377,147.3271949,'5 Trailsway Circle','Hobart','Tasmania','Australia',7803),
('Linkbridge',-33.8882671,151.2078465,'8480 Forest Dale Center','Strawberry Hills','New South Wales','Australia',1424),
('Wordware',-42.8821377,147.3271949,'54887 Manley Center','Hobart','Tasmania','Australia',7808),
('Voolith',-37.7071402,144.9611223,'521 Bluejay Hill','Sydney','New South Wales','Australia',1206),
('Avamba',-42.8821377,147.3271949,'4526 Thompson Crossing','Hobart','Tasmania','Australia',7808),
('Bubblemix',-34.990888,138.574391,'205 Lawn Terrace','Adelaide Mail Centre','South Australia','Australia',5874),
('Devpoint',-33.8688197,151.2092955,'2904 3rd Circle','Sydney','New South Wales','Australia',1033),
('Rooxo',-34.8352742,138.596204,'21 East Court','Northern Suburbs Mc','New South Wales','Australia',1694),
('Eazzy',-33.8688197,151.2092955,'4719 Fairview Drive','Sydney South','New South Wales','Australia',1235),
('Jabberstorm',-41.4332215,147.1440875,'15803 Westerfield Parkway','Launceston','Tasmania','Australia',7916),
('Gigashots',-37.8136276,144.9630576,'62714 Dexter Crossing','Melbourne','Victoria','Australia',8383),
('Flashpoint',-41.4332215,147.1440875,'44 Trailsway Lane','Launceston','Tasmania','Australia',7916),
('Roomm',-34.9284989,138.6007456,'502 Sherman Hill','Adelaide','South Australia','Australia',5839),
('Eabox',-34.990888,138.574391,'20 Saint Paul Drive','Adelaide Mail Centre','South Australia','Australia',5889),
('Kwimbee',-33.93274,151.188577,'07720 Boyd Road','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Roodel',-33.8688197,151.2092955,'4 Westend Terrace','Sydney South','New South Wales','Australia',1235),
('Quire',-33.8688197,151.2092955,'694 Sunnyside Drive','Sydney South','New South Wales','Australia',1235),
('Skivee',-33.7974423,151.2502275,'3986 Gina Way','Sydney','New South Wales','Australia',1191),
('Wikibox',-37.8136276,144.9630576,'626 Waxwing Center','Melbourne','Victoria','Australia',8383),
('Roomm',-41.4332215,147.1440875,'28329 Bay Trail','Launceston','Tasmania','Australia',7904),
('Shuffletag',-33.8688197,151.2092955,'9 Lakewood Gardens Terrace','Sydney South','New South Wales','Australia',1235),
('Skivee',-42.8821377,147.3271949,'54520 Reinke Road','Hobart','Tasmania','Australia',7808),
('Yoveo',-33.7974423,151.2502275,'58 Village Hill','Sydney','New South Wales','Australia',1161),
('Lazz',-33.8882671,151.2078465,'98165 Green Avenue','Strawberry Hills','New South Wales','Australia',1424),
('Cogibox',-33.8688197,151.2092955,'80 Paget Road','Sydney South','New South Wales','Australia',1235),
('Skimia',-33.7974423,151.2502275,'551 High Crossing Park','Sydney','New South Wales','Australia',1161),
('Digitube',-37.8136276,144.9630576,'6616 Transport Park','Melbourne','Victoria','Australia',8045),
('Youtags',-34.9284989,138.6007456,'320 Autumn Leaf Crossing','Adelaide','South Australia','Australia',5839),
('Dynabox',-33.8688197,151.2092955,'79 Loftsgordon Terrace','Sydney South','New South Wales','Australia',1235),
('Fadeo',-33.7974423,151.2502275,'5 Transport Parkway','Sydney','New South Wales','Australia',1161),
('Zoomlounge',-34.990888,138.574391,'08681 Stoughton Street','Adelaide Mail Centre','South Australia','Australia',5874),
('Kare',-33.8989712,151.2149792,'116 East Road','Sydney','New South Wales','Australia',1130),
('Dablist',-33.8882671,151.2078465,'4207 Manitowish Circle','Strawberry Hills','New South Wales','Australia',1424),
('Cogidoo',-33.863927,151.201887,'32 Cardinal Point','Sydney','New South Wales','Australia',1171),
('Kwinu',-37.7071402,144.9611223,'12 Lawn Junction','Sydney','New South Wales','Australia',1206),
('Riffpedia',-33.8688197,151.2092955,'06833 Victoria Alley','Sydney South','New South Wales','Australia',1235),
('Oyoba',-34.9284989,138.6007456,'713 Harbort Point','Adelaide','South Australia','Australia',5839),
('Topdrive',-42.8821377,147.3271949,'4 Elka Point','Hobart','Tasmania','Australia',7808),
('Gigabox',-37.7236851,144.9633285,'746 Elmside Place','Sydney','New South Wales','Australia',1009),
('Tavu',-37.7204693,144.9629556,'4 Texas Place','Sydney','New South Wales','Australia',1109),
('Meezzy',-27.9424308,153.3970962,'1 Beilfuss Way','Sydney','New South Wales','Australia',1140),
('Nlounge',-38.043127,145.297768,'01573 Meadow Ridge Point','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Thoughtbridge',-33.8688197,151.2092955,'30052 Michigan Park','Sydney South','New South Wales','Australia',1235),
('Muxo',-33.8688197,151.2092955,'92368 Kingsford Hill','Sydney South','New South Wales','Australia',1235),
('Yombu',-42.8821377,147.3271949,'4635 Oakridge Terrace','Hobart','Tasmania','Australia',7808),
('Linkbridge',-33.8651294,151.2078882,'66541 Muir Center','Australia Square','New South Wales','Australia',1213),
('Linkbridge',-37.8136276,144.9630576,'4102 Anzinger Park','Melbourne','Victoria','Australia',8383),
('Youfeed',-34.990888,138.574391,'5 Farwell Junction','Adelaide Mail Centre','South Australia','Australia',5869),
('Dablist',-33.93274,151.188577,'0815 Mcbride Crossing','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Cogidoo',-27.9424308,153.3970962,'3475 Prentice Hill','Sydney','New South Wales','Australia',1140),
('Topicblab',-33.93274,151.188577,'6 Division Hill','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Linktype',-34.990888,138.574391,'79 Coolidge Circle','Adelaide Mail Centre','South Australia','Australia',5874),
('Einti',-34.9284989,138.6007456,'42 Valley Edge Point','Adelaide','South Australia','Australia',5839),
('Kaymbo',-34.990888,138.574391,'80814 8th Parkway','Adelaide Mail Centre','South Australia','Australia',5874),
('Jayo',-33.8989712,151.2149792,'1 Dakota Place','Sydney','New South Wales','Australia',1130),
('Realpoint',-34.9284989,138.6007456,'8018 Crowley Lane','Adelaide','South Australia','Australia',5839),
('Topiczoom',-37.8136276,144.9630576,'96919 Elka Place','Melbourne','Victoria','Australia',8383),
('Lazzy',-37.7236851,144.9633285,'695 Talisman Court','Sydney','New South Wales','Australia',1009),
('Babblestorm',-33.8989712,151.2149792,'2979 Carpenter Point','Sydney','New South Wales','Australia',1130),
('Fivebridge',-33.7974423,151.2502275,'836 Truax Terrace','Sydney','New South Wales','Australia',1191),
('Zoombox',-33.7974423,151.2502275,'1908 Mcbride Point','Sydney','New South Wales','Australia',1191),
('Yambee',-27.4697707,153.0251235,'0 Tennessee Center','Brisbane','Queensland','Australia',9010),
('Skyvu',-37.8136276,144.9630576,'64 Haas Plaza','Melbourne','Victoria','Australia',8045),
('Photolist',-33.7974423,151.2502275,'34 Summit Plaza','Sydney','New South Wales','Australia',1161),
('Leexo',-37.713929,144.962411,'2 Sutteridge Avenue','Sydney','New South Wales','Australia',1120),
('Linktype',-33.7974423,151.2502275,'49619 Onsgard Place','Sydney','New South Wales','Australia',1196),
('Photofeed',-33.8651294,151.2078882,'680 Loftsgordon Terrace','Australia Square','New South Wales','Australia',1213),
('Wikizz',-42.8821377,147.3271949,'70156 Vermont Parkway','Hobart','Tasmania','Australia',7808),
('Myworks',-41.4332215,147.1440875,'304 Di Loreto Center','Launceston','Tasmania','Australia',7904),
('Skibox',-41.4332215,147.1440875,'645 Mosinee Center','Launceston','Tasmania','Australia',7904),
('Skinix',-33.8882671,151.2078465,'8 Gateway Hill','Strawberry Hills','New South Wales','Australia',1424),
('Divavu',-31.9478653,115.8693718,'81 Dunning Junction','Perth','Western Australia','Australia',6843),
('Feedspan',-37.8136276,144.9630576,'8380 Manley Terrace','Melbourne','Victoria','Australia',8383),
('Tagchat',-33.7974423,151.2502275,'754 Westerfield Park','Sydney','New South Wales','Australia',1134),
('Katz',-41.4332215,147.1440875,'1 Jana Pass','Launceston','Tasmania','Australia',7904),
('Devcast',-38.043127,145.297768,'2 Fisk Alley','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Babbleopia',-31.9478653,115.8693718,'049 Oakridge Center','Perth','Western Australia','Australia',6843),
('Vinder',-33.7974423,151.2502275,'80978 Tony Center','Sydney','New South Wales','Australia',1181),
('Browseblab',-37.713929,144.962411,'5 Farmco Crossing','Sydney','New South Wales','Australia',1120),
('Mudo',-34.9284989,138.6007456,'304 Utah Circle','Adelaide','South Australia','Australia',5839),
('Yacero',-34.8352742,138.596204,'060 Schlimgen Circle','Northern Suburbs Mc','New South Wales','Australia',1694),
('Mynte',-31.9478653,115.8693718,'70417 Tennyson Point','Perth','Western Australia','Australia',6843),
('Mita',-33.7974423,151.2502275,'71963 Fremont Avenue','Sydney','New South Wales','Australia',1196),
('Zazio',-33.8651294,151.2078882,'1336 Jay Avenue','Australia Square','New South Wales','Australia',1213),
('Realfire',-34.990888,138.574391,'3268 Mendota Place','Adelaide Mail Centre','South Australia','Australia',5874),
('Wikido',-42.8821377,147.3271949,'37062 Esch Crossing','Hobart','Tasmania','Australia',7808),
('Youbridge',-27.4697707,153.0251235,'57 Everett Crossing','Brisbane','Queensland','Australia',9010),
('Myworks',-37.8136276,144.9630576,'04 Shasta Alley','Melbourne','Victoria','Australia',8045),
('Browseblab',-42.8821377,147.3271949,'8 Valley Edge Hill','Hobart','Tasmania','Australia',7803),
('Oyoba',-37.7236851,144.9633285,'5 Carberry Point','Sydney','New South Wales','Australia',1009),
('Devshare',-41.4332215,147.1440875,'75262 Comanche Avenue','Launceston','Tasmania','Australia',7904),
('Vinder',-42.8821377,147.3271949,'679 Kedzie Plaza','Hobart','Tasmania','Australia',7808),
('Meembee',-34.990888,138.574391,'7 Lunder Hill','Adelaide Mail Centre','South Australia','Australia',5889),
('Divavu',-41.4332215,147.1440875,'74212 Fallview Drive','Launceston','Tasmania','Australia',7904),
('Mynte',-37.8136276,144.9630576,'21 Morrow Plaza','Melbourne','Victoria','Australia',8383),
('Tagcat',-41.4332215,147.1440875,'999 Oriole Place','Launceston','Tasmania','Australia',7916),
('Feedfish',-42.8821377,147.3271949,'09 Packers Terrace','Hobart','Tasmania','Australia',7808),
('Cogidoo',-37.7204693,144.9629556,'71 Leroy Junction','Sydney','New South Wales','Australia',1109),
('Thoughtblab',-27.4697707,153.0251235,'10743 Kipling Alley','Brisbane','Queensland','Australia',9010),
('Meevee',-33.93274,151.188577,'6 Quincy Trail','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Brainlounge',-42.8821377,147.3271949,'5 Loeprich Court','Hobart','Tasmania','Australia',7808),
('Tagcat',-34.990888,138.574391,'356 Bay Lane','Adelaide Mail Centre','South Australia','Australia',5874),
('Gigashots',-38.043127,145.297768,'46 Lighthouse Bay Circle','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Muxo',-33.7974423,151.2502275,'405 Texas Point','Sydney','New South Wales','Australia',1191),
('Skiba',-34.990888,138.574391,'4 Kinsman Place','Adelaide Mail Centre','South Australia','Australia',5899),
('Trunyx',-34.990888,138.574391,'69235 Doe Crossing Avenue','Adelaide Mail Centre','South Australia','Australia',5889),
('Eidel',-27.4697707,153.0251235,'64397 Grim Point','Brisbane','Queensland','Australia',9010),
('Divape',-33.8688197,151.2092955,'33556 Trailsway Junction','Sydney','New South Wales','Australia',1033),
('Shuffledrive',-31.9505269,115.8604572,'27414 Service Trail','Perth','Western Australia','Australia',6817),
('Linkbridge',-41.4332215,147.1440875,'63 Myrtle Court','Launceston','Tasmania','Australia',7916),
('Buzzbean',-42.8821377,147.3271949,'930 Mcguire Road','Hobart','Tasmania','Australia',7808),
('Jetwire',-27.9424308,153.3970962,'73 Eastlawn Park','Sydney','New South Wales','Australia',1140),
('Yakidoo',-37.713929,144.962411,'06 Gulseth Point','Sydney','New South Wales','Australia',1120),
('Eimbee',-37.8136276,144.9630576,'147 Summerview Alley','Melbourne','Victoria','Australia',8383),
('Realbuzz',-33.863927,151.201887,'214 Derek Lane','Sydney','New South Wales','Australia',1171),
('Voolith',-33.8651294,151.2078882,'005 2nd Road','Australia Square','New South Wales','Australia',1213),
('Browseblab',-34.990888,138.574391,'14 Merry Court','Adelaide Mail Centre','South Australia','Australia',5874),
('Quimba',-37.713929,144.962411,'16417 Reindahl Road','Sydney','New South Wales','Australia',1120),
('Twinder',-31.9505269,115.8604572,'239 Cardinal Plaza','Perth','Western Australia','Australia',6817),
('Edgeify',-34.990888,138.574391,'088 Vera Center','Adelaide Mail Centre','South Australia','Australia',5889),
('Centizu',-37.7204693,144.9629556,'725 Stang Road','Sydney','New South Wales','Australia',1109),
('Riffpath',-31.9478653,115.8693718,'1 Fremont Parkway','Perth','Western Australia','Australia',6843),
('Buzzster',-34.0349557,151.0998291,'0 Carberry Avenue','Sydney','New South Wales','Australia',1028),
('Devshare',-34.990888,138.574391,'0 Lindbergh Parkway','Adelaide Mail Centre','South Australia','Australia',5899),
('Meedoo',-37.8136276,144.9630576,'3 Fordem Point','Melbourne','Victoria','Australia',8045),
('Twitterlist',-34.990888,138.574391,'9907 Kipling Center','Adelaide Mail Centre','South Australia','Australia',5874),
('Livetube',-33.7974423,151.2502275,'0 Columbus Plaza','Sydney','New South Wales','Australia',1181),
('Twimbo',-37.7071402,144.9611223,'8337 1st Alley','Sydney','New South Wales','Australia',1206),
('Jaloo',-33.8882671,151.2078465,'45171 Springview Terrace','Strawberry Hills','New South Wales','Australia',1424),
('Realblab',-38.043127,145.297768,'839 Transport Avenue','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Yamia',-33.8688197,151.2092955,'7 Thierer Place','Sydney','New South Wales','Australia',1043),
('Abatz',-41.4332215,147.1440875,'677 Park Meadow Lane','Launceston','Tasmania','Australia',7916),
('Zoomcast',-41.4332215,147.1440875,'32991 Westport Plaza','Launceston','Tasmania','Australia',7916),
('Gigaclub',-33.8882671,151.2078465,'135 Claremont Hill','Strawberry Hills','New South Wales','Australia',1424),
('Einti',-33.93274,151.188577,'459 Mockingbird Lane','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Mynte',-34.990888,138.574391,'0561 Westend Avenue','Adelaide Mail Centre','South Australia','Australia',5869),
('Camimbo',-37.8136276,144.9630576,'797 Leroy Place','Melbourne','Victoria','Australia',8045),
('Cogibox',-33.863927,151.201887,'4 Claremont Center','Sydney','New South Wales','Australia',1171),
('Omba',-34.9284989,138.6007456,'66 Hoard Place','Adelaide','South Australia','Australia',5839),
('Skalith',-34.990888,138.574391,'8 Grayhawk Trail','Adelaide Mail Centre','South Australia','Australia',5889),
('Viva',-31.9478653,115.8693718,'35 Bowman Center','Perth','Western Australia','Australia',6843),
('Edgewire',-37.8136276,144.9630576,'5676 Hintze Crossing','Melbourne','Victoria','Australia',8045),
('Camimbo',-33.8688197,151.2092955,'1626 Stephen Place','Sydney South','New South Wales','Australia',1235),
('Zoombeat',-33.7974423,151.2502275,'0203 Surrey Plaza','Sydney','New South Wales','Australia',1161),
('Realcube',-33.7974423,151.2502275,'21 Dixon Trail','Sydney','New South Wales','Australia',1161),
('Rhyzio',-31.9478653,115.8693718,'90 Parkside Point','Perth','Western Australia','Australia',6843),
('Mita',-34.990888,138.574391,'8121 Lakewood Pass','Adelaide Mail Centre','South Australia','Australia',5899),
('Abatz',-37.8136276,144.9630576,'242 Meadow Ridge Plaza','Melbourne','Victoria','Australia',8045),
('Photospace',-42.8821377,147.3271949,'71006 Warbler Junction','Hobart','Tasmania','Australia',7803),
('Rhynoodle',-41.4332215,147.1440875,'21269 Larry Hill','Launceston','Tasmania','Australia',7916),
('Devbug',-34.990888,138.574391,'97220 Birchwood Terrace','Adelaide Mail Centre','South Australia','Australia',5874),
('Brightdog',-33.93274,151.188577,'0 Blue Bill Park Circle','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Tavu',-33.93274,151.188577,'7 Myrtle Street','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Eabox',-33.8688197,151.2092955,'4416 Ryan Court','Sydney South','New South Wales','Australia',1235),
('Linkbridge',-33.863927,151.201887,'54 Pond Plaza','Sydney','New South Wales','Australia',1171),
('Gigashots',-34.9284989,138.6007456,'1351 Golf Course Terrace','Adelaide','South Australia','Australia',5839),
('Twitterbeat',-41.4332215,147.1440875,'4 Cardinal Center','Launceston','Tasmania','Australia',7904),
('Oyoyo',-31.9505269,115.8604572,'0240 Morningstar Court','Perth','Western Australia','Australia',6817),
('Skyba',-42.8821377,147.3271949,'0409 Pond Hill','Hobart','Tasmania','Australia',7803),
('Ailane',-33.7974423,151.2502275,'01617 Erie Circle','Sydney','New South Wales','Australia',1191),
('Wordpedia',-33.93274,151.188577,'53 Barby Drive','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Mynte',-27.4697707,153.0251235,'9 Moland Street','Brisbane','Queensland','Australia',9010),
('Divanoodle',-34.8352742,138.596204,'395 Hauk Place','Northern Suburbs Mc','New South Wales','Australia',1694),
('Youspan',-42.8821377,147.3271949,'03 David Pass','Hobart','Tasmania','Australia',7803),
('Kamba',-42.8821377,147.3271949,'0663 Southridge Park','Hobart','Tasmania','Australia',7803),
('Zooxo',-27.4697707,153.0251235,'280 Schmedeman Circle','Brisbane','Queensland','Australia',9010),
('Fivechat',-33.8688197,151.2092955,'8504 Surrey Circle','Sydney','New South Wales','Australia',1043),
('Blogtags',-34.990888,138.574391,'3 Morningstar Center','Adelaide Mail Centre','South Australia','Australia',5899),
('Skyble',-33.7974423,151.2502275,'977 Bartillon Circle','Sydney','New South Wales','Australia',1161),
('Photofeed',-37.7204693,144.9629556,'85425 Warbler Street','Sydney','New South Wales','Australia',1109),
('Skyba',-38.043127,145.297768,'218 Waywood Junction','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Talane',-38.043127,145.297768,'04388 Forster Crossing','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Photojam',-41.4332215,147.1440875,'2396 Melvin Terrace','Launceston','Tasmania','Australia',7904),
('Roodel',-33.7974423,151.2502275,'0 Gina Street','Sydney','New South Wales','Australia',1134),
('Aivee',-37.8136276,144.9630576,'7 Anniversary Way','Melbourne','Victoria','Australia',8045),
('Youspan',-37.7071402,144.9611223,'9979 Kennedy Way','Sydney','New South Wales','Australia',1206),
('Quatz',-41.4332215,147.1440875,'929 Milwaukee Trail','Launceston','Tasmania','Australia',7916),
('Babbleblab',-37.7071402,144.9611223,'125 Esker Street','Sydney','New South Wales','Australia',1206),
('Flashset',-37.7071402,144.9611223,'0298 Service Parkway','Sydney','New South Wales','Australia',1206),
('Wikizz',-34.9284989,138.6007456,'4 Vera Alley','Adelaide','South Australia','Australia',5839),
('Gabtune',-31.9478653,115.8693718,'40755 Tennyson Lane','Perth','Western Australia','Australia',6843),
('Mydeo',-37.8136276,144.9630576,'0253 Arkansas Road','Melbourne','Victoria','Australia',8383),
('Skimia',-34.990888,138.574391,'81 Clarendon Trail','Adelaide Mail Centre','South Australia','Australia',5874),
('Jaxworks',-37.713929,144.962411,'160 Pawling Parkway','Sydney','New South Wales','Australia',1120),
('Yambee',-33.93274,151.188577,'2065 Dovetail Circle','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Chatterbridge',-37.7204693,144.9629556,'1 Old Shore Junction','Sydney','New South Wales','Australia',1109),
('Feednation',-27.4697707,153.0251235,'39667 Spohn Crossing','Brisbane','Queensland','Australia',9010),
('Eadel',-34.990888,138.574391,'5 Rowland Street','Adelaide Mail Centre','South Australia','Australia',5874),
('Mybuzz',-33.7974423,151.2502275,'59124 Anniversary Trail','Sydney','New South Wales','Australia',1191),
('Riffpedia',-33.8989712,151.2149792,'9 Kinsman Hill','Sydney','New South Wales','Australia',1130),
('Youtags',-37.8136276,144.9630576,'387 Petterle Junction','Melbourne','Victoria','Australia',8383),
('Npath',-34.990888,138.574391,'84889 Hoffman Street','Adelaide Mail Centre','South Australia','Australia',5869),
('Omba',-37.7071402,144.9611223,'54 Messerschmidt Alley','Sydney','New South Wales','Australia',1206),
('Trunyx',-42.8821377,147.3271949,'2713 Lukken Circle','Hobart','Tasmania','Australia',7803),
('Fanoodle',-33.93274,151.188577,'14 Mcbride Avenue','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Shuffledrive',-33.7974423,151.2502275,'592 Hoepker Center','Sydney','New South Wales','Australia',1196),
('Kwideo',-37.8136276,144.9630576,'573 Mosinee Lane','Melbourne','Victoria','Australia',8045),
('Kwilith',-33.7974423,151.2502275,'34680 Forest Dale Terrace','Sydney','New South Wales','Australia',1181),
('Jabbercube',-27.4697707,153.0251235,'63 Bashford Trail','Brisbane','Queensland','Australia',9010),
('Quinu',-41.4332215,147.1440875,'96313 Marquette Court','Launceston','Tasmania','Australia',7916),
('Myworks',-33.93274,151.188577,'0223 Coolidge Center','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Trunyx',-34.9284989,138.6007456,'55 Debs Plaza','Adelaide','South Australia','Australia',5839),
('Dynazzy',-42.8821377,147.3271949,'27 Hazelcrest Alley','Hobart','Tasmania','Australia',7803),
('Photojam',-33.93274,151.188577,'369 Meadow Vale Trail','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Youopia',-34.990888,138.574391,'1129 Becker Place','Adelaide Mail Centre','South Australia','Australia',5889),
('Feednation',-33.863927,151.201887,'235 Maple Place','Sydney','New South Wales','Australia',1171),
('Yodoo',-33.93274,151.188577,'194 Comanche Junction','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Roodel',-31.9505269,115.8604572,'42 Superior Trail','Perth','Western Australia','Australia',6817),
('Agivu',-37.713929,144.962411,'2 Karstens Place','Sydney','New South Wales','Australia',1120),
('Photojam',-33.8688197,151.2092955,'6 Cardinal Center','Sydney','New South Wales','Australia',1033),
('Kwilith',-34.990888,138.574391,'23700 Cascade Crossing','Adelaide Mail Centre','South Australia','Australia',5899),
('Flipstorm',-33.93274,151.188577,'2 Dawn Crossing','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Npath',-37.713929,144.962411,'9 Raven Center','Sydney','New South Wales','Australia',1120),
('Quaxo',-37.8136276,144.9630576,'5322 Hooker Center','Melbourne','Victoria','Australia',8045),
('Buzzbean',-34.990888,138.574391,'70015 Fair Oaks Circle','Adelaide Mail Centre','South Australia','Australia',5869),
('Ozu',-37.7204693,144.9629556,'53 Magdeline Junction','Sydney','New South Wales','Australia',1109),
('Zava',-33.7974423,151.2502275,'24123 Sommers Crossing','Sydney','New South Wales','Australia',1191),
('Demizz',-34.990888,138.574391,'45 Sachtjen Way','Adelaide Mail Centre','South Australia','Australia',5869),
('Demizz',-31.9478653,115.8693718,'6952 Farragut Place','Perth','Western Australia','Australia',6843),
('Trilia',-42.8821377,147.3271949,'773 Prairieview Crossing','Hobart','Tasmania','Australia',7808),
('Tagpad',-37.7204693,144.9629556,'3440 Division Center','Sydney','New South Wales','Australia',1109),
('Avamm',-33.7974423,151.2502275,'5 Magdeline Terrace','Sydney','New South Wales','Australia',1196),
('Kwinu',-33.93274,151.188577,'84 Dennis Junction','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Flashdog',-33.7974423,151.2502275,'827 Anhalt Court','Sydney','New South Wales','Australia',1134),
('Fliptune',-33.8882671,151.2078465,'78 Walton Plaza','Strawberry Hills','New South Wales','Australia',1424),
('Oyoyo',-42.8821377,147.3271949,'9 Mifflin Court','Hobart','Tasmania','Australia',7803),
('Livefish',-33.863927,151.201887,'3779 Northwestern Place','Sydney','New South Wales','Australia',1171),
('Wordify',-34.9284989,138.6007456,'58898 Paget Crossing','Adelaide','South Australia','Australia',5839),
('Roomm',-33.7974423,151.2502275,'983 Bayside Hill','Sydney','New South Wales','Australia',1181),
('Trunyx',-38.043127,145.297768,'5 Sycamore Point','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Skyba',-34.990888,138.574391,'49738 Doe Crossing Park','Adelaide Mail Centre','South Australia','Australia',5874),
('Pixonyx',-37.7236851,144.9633285,'709 Prairieview Street','Sydney','New South Wales','Australia',1009),
('Youbridge',-33.863927,151.201887,'53 Holmberg Court','Sydney','New South Wales','Australia',1171),
('Tagchat',-33.8651294,151.2078882,'27655 Arkansas Center','Australia Square','New South Wales','Australia',1213),
('Tagfeed',-33.7974423,151.2502275,'32 Lukken Way','Sydney','New South Wales','Australia',1181),
('Pixoboo',-27.4697707,153.0251235,'90393 Ronald Regan Park','Brisbane','Queensland','Australia',9010),
('Kwideo',-34.0349557,151.0998291,'122 Ronald Regan Point','Sydney','New South Wales','Australia',1028),
('Camimbo',-34.9284989,138.6007456,'1335 American Road','Adelaide','South Australia','Australia',5839),
('Avamba',-34.8352742,138.596204,'20735 Main Point','Northern Suburbs Mc','New South Wales','Australia',1694),
('Avaveo',-33.7974423,151.2502275,'5119 Bunker Hill Circle','Sydney','New South Wales','Australia',1161),
('Zava',-27.9424308,153.3970962,'7922 Jackson Crossing','Sydney','New South Wales','Australia',1140),
('Dabvine',-33.7974423,151.2502275,'21 Cherokee Park','Sydney','New South Wales','Australia',1181),
('Topiclounge',-33.863927,151.201887,'65172 Nevada Alley','Sydney','New South Wales','Australia',1171),
('Edgeify',-37.7204693,144.9629556,'9836 Tomscot Alley','Sydney','New South Wales','Australia',1109),
('Centizu',-33.93274,151.188577,'642 Colorado Road','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Digitube',-33.8688197,151.2092955,'733 Mosinee Drive','Sydney','New South Wales','Australia',1033),
('Jabbersphere',-33.93274,151.188577,'82 Sundown Plaza','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Zoomlounge',-33.7974423,151.2502275,'456 Forest Dale Center','Sydney','New South Wales','Australia',1161),
('Topicware',-34.990888,138.574391,'50657 South Drive','Adelaide Mail Centre','South Australia','Australia',5899),
('Innojam',-33.863927,151.201887,'10 Longview Road','Sydney','New South Wales','Australia',1171),
('Quimm',-34.0349557,151.0998291,'3 Dwight Terrace','Sydney','New South Wales','Australia',1028),
('Kazio',-42.8821377,147.3271949,'38 Prentice Hill','Hobart','Tasmania','Australia',7808),
('Devbug',-33.8882671,151.2078465,'6115 Mccormick Street','Strawberry Hills','New South Wales','Australia',1424),
('Kazu',-37.8136276,144.9630576,'288 Vahlen Court','Melbourne','Victoria','Australia',8383),
('Kaymbo',-33.7974423,151.2502275,'49 Lunder Plaza','Sydney','New South Wales','Australia',1191),
('Ailane',-33.8882671,151.2078465,'8923 Cody Park','Strawberry Hills','New South Wales','Australia',1424),
('Linkbridge',-33.8989712,151.2149792,'89 Mccormick Avenue','Sydney','New South Wales','Australia',1130),
('Browseblab',-33.8688197,151.2092955,'0 Bashford Point','Sydney','New South Wales','Australia',1043),
('Quatz',-31.9478653,115.8693718,'5352 Chinook Crossing','Perth','Western Australia','Australia',6843),
('Wordtune',-37.8136276,144.9630576,'93769 Green Ridge Pass','Melbourne','Victoria','Australia',8045),
('Zava',-38.043127,145.297768,'1 Bluejay Hill','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Meeveo',-33.8882671,151.2078465,'4 Armistice Circle','Strawberry Hills','New South Wales','Australia',1424),
('Jabberstorm',-34.990888,138.574391,'2198 Nova Road','Adelaide Mail Centre','South Australia','Australia',5874),
('Linklinks',-37.7236851,144.9633285,'59 Briar Crest Crossing','Sydney','New South Wales','Australia',1009),
('Linklinks',-31.9505269,115.8604572,'13 Maple Trail','Perth','Western Australia','Australia',6817),
('Yamia',-33.7974423,151.2502275,'57363 Toban Lane','Sydney','New South Wales','Australia',1181),
('Photolist',-33.8989712,151.2149792,'93687 6th Lane','Sydney','New South Wales','Australia',1130),
('Wikizz',-41.4332215,147.1440875,'226 Aberg Parkway','Launceston','Tasmania','Australia',7904),
('Devpulse',-31.9505269,115.8604572,'22018 Manitowish Place','Perth','Western Australia','Australia',6817),
('InnoZ',-33.7974423,151.2502275,'5 Memorial Street','Sydney','New South Wales','Australia',1181),
('Jaxspan',-41.4332215,147.1440875,'073 Moulton Crossing','Launceston','Tasmania','Australia',7904),
('JumpXS',-33.8651294,151.2078882,'7665 Havey Plaza','Australia Square','New South Wales','Australia',1213),
('Tazz',-33.93274,151.188577,'88522 Utah Trail','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Jayo',-33.8651294,151.2078882,'5 Springs Hill','Australia Square','New South Wales','Australia',1213),
('Edgepulse',-42.8821377,147.3271949,'9147 Anthes Point','Hobart','Tasmania','Australia',7808),
('Jayo',-34.990888,138.574391,'906 Grim Pass','Adelaide Mail Centre','South Australia','Australia',5899),
('Voonder',-37.8136276,144.9630576,'420 Tennyson Lane','Melbourne','Victoria','Australia',8045),
('Eazzy',-37.8136276,144.9630576,'26937 Welch Drive','Melbourne','Victoria','Australia',8045),
('Jabbercube',-37.7236851,144.9633285,'6 Veith Way','Sydney','New South Wales','Australia',1009),
('Jabbercube',-41.4332215,147.1440875,'69655 Schmedeman Parkway','Launceston','Tasmania','Australia',7916),
('Zoonder',-34.990888,138.574391,'8 Summer Ridge Avenue','Adelaide Mail Centre','South Australia','Australia',5889),
('Riffpath',-27.9424308,153.3970962,'350 Tennessee Lane','Sydney','New South Wales','Australia',1140),
('Rhycero',-33.93274,151.188577,'34701 Magdeline Street','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Tanoodle',-31.9478653,115.8693718,'93 Moose Pass','Perth','Western Australia','Australia',6843),
('Realbridge',-34.990888,138.574391,'606 4th Place','Adelaide Mail Centre','South Australia','Australia',5874),
('Babbleblab',-37.7071402,144.9611223,'6274 Mariners Cove Place','Sydney','New South Wales','Australia',1206),
('Browseblab',-38.043127,145.297768,'61 Rusk Trail','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Meemm',-34.9284989,138.6007456,'92 Del Sol Junction','Adelaide','South Australia','Australia',5839),
('Quatz',-33.7974423,151.2502275,'279 Burrows Parkway','Sydney','New South Wales','Australia',1196),
('Digitube',-33.7974423,151.2502275,'3 Northview Point','Sydney','New South Wales','Australia',1181),
('Zooveo',-33.93274,151.188577,'05039 Beilfuss Parkway','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Wordify',-37.8136276,144.9630576,'3071 Service Court','Melbourne','Victoria','Australia',8383),
('Plambee',-33.8688197,151.2092955,'4426 Nevada Pass','Sydney South','New South Wales','Australia',1235),
('Zazio',-33.8688197,151.2092955,'92614 Northview Court','Sydney','New South Wales','Australia',1043),
('Avavee',-41.4332215,147.1440875,'4747 Ronald Regan Circle','Launceston','Tasmania','Australia',7904),
('Geba',-33.93274,151.188577,'6959 Park Meadow Road','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Ailane',-33.7974423,151.2502275,'71102 Hanover Parkway','Sydney','New South Wales','Australia',1134),
('Gigashots',-42.8821377,147.3271949,'6 Dixon Court','Hobart','Tasmania','Australia',7808),
('Thoughtstorm',-31.9505269,115.8604572,'46 Basil Center','Perth','Western Australia','Australia',6817),
('Jaxworks',-41.4332215,147.1440875,'04238 Rockefeller Drive','Launceston','Tasmania','Australia',7904),
('Twinder',-27.4697707,153.0251235,'3680 Jackson Terrace','Brisbane','Queensland','Australia',9010),
('Photobug',-33.7974423,151.2502275,'617 Colorado Crossing','Sydney','New South Wales','Australia',1191),
('Leexo',-37.8136276,144.9630576,'859 Corben Junction','Melbourne','Victoria','Australia',8045),
('Twinder',-37.8136276,144.9630576,'6 Portage Plaza','Melbourne','Victoria','Australia',8383),
('Jamia',-33.7974423,151.2502275,'4 Russell Terrace','Sydney','New South Wales','Australia',1134),
('Meevee',-33.93274,151.188577,'64 Weeping Birch Pass','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Gigazoom',-34.990888,138.574391,'24901 Surrey Road','Adelaide Mail Centre','South Australia','Australia',5869),
('Myworks',-31.9505269,115.8604572,'81 Browning Avenue','Perth','Western Australia','Australia',6817),
('Zooxo',-27.9424308,153.3970962,'544 Northridge Park','Sydney','New South Wales','Australia',1140),
('Camido',-38.043127,145.297768,'015 Anhalt Terrace','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Camimbo',-33.863927,151.201887,'1 Riverside Way','Sydney','New South Wales','Australia',1171),
('Tagpad',-33.7974423,151.2502275,'185 Chive Alley','Sydney','New South Wales','Australia',1161),
('Yambee',-41.4332215,147.1440875,'940 Del Sol Street','Launceston','Tasmania','Australia',7916),
('Meedoo',-33.8688197,151.2092955,'89 Pennsylvania Parkway','Sydney South','New South Wales','Australia',1235),
('Cogibox',-37.8136276,144.9630576,'6468 Prairieview Point','Melbourne','Victoria','Australia',8045),
('Skiba',-34.990888,138.574391,'6361 Carpenter Street','Adelaide Mail Centre','South Australia','Australia',5899),
('Rhybox',-27.4697707,153.0251235,'8 Jenna Junction','Brisbane','Queensland','Australia',9010),
('Yombu',-34.0349557,151.0998291,'2925 Lakeland Way','Sydney','New South Wales','Australia',1028),
('Rhycero',-34.990888,138.574391,'83 Westend Drive','Adelaide Mail Centre','South Australia','Australia',5874),
('Fatz',-33.8688197,151.2092955,'245 Vernon Avenue','Sydney','New South Wales','Australia',1033),
('Eazzy',-34.9284989,138.6007456,'52 Utah Parkway','Adelaide','South Australia','Australia',5839),
('Agivu',-34.990888,138.574391,'412 Lawn Lane','Adelaide Mail Centre','South Australia','Australia',5899),
('Meevee',-27.9424308,153.3970962,'25 Moulton Avenue','Sydney','New South Wales','Australia',1140),
('Rhynoodle',-33.7974423,151.2502275,'17 Northland Alley','Sydney','New South Wales','Australia',1161),
('Thoughtstorm',-27.9424308,153.3970962,'0706 Shelley Parkway','Sydney','New South Wales','Australia',1140),
('Jabbersphere',-33.7974423,151.2502275,'60 Sage Alley','Sydney','New South Wales','Australia',1161),
('Eidel',-38.043127,145.297768,'7655 Welch Plaza','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Livefish',-34.990888,138.574391,'8 Holmberg Trail','Adelaide Mail Centre','South Australia','Australia',5889),
('Edgewire',-33.8688197,151.2092955,'82591 Sachtjen Hill','Sydney South','New South Wales','Australia',1235),
('Nlounge',-33.7974423,151.2502275,'7 Menomonie Lane','Sydney','New South Wales','Australia',1191),
('Skipfire',-38.043127,145.297768,'16 Fairview Center','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Edgeclub',-31.9505269,115.8604572,'9 Briar Crest Place','Perth','Western Australia','Australia',6817),
('Zazio',-34.990888,138.574391,'408 Manufacturers Center','Adelaide Mail Centre','South Australia','Australia',5869),
('Pixonyx',-33.7974423,151.2502275,'25 Dorton Avenue','Sydney','New South Wales','Australia',1161),
('Thoughtsphere',-31.9478653,115.8693718,'8336 Sutteridge Court','Perth','Western Australia','Australia',6843),
('Youbridge',-38.043127,145.297768,'50245 Vera Parkway','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Eare',-42.8821377,147.3271949,'2 Jackson Crossing','Hobart','Tasmania','Australia',7808),
('Zooveo',-33.7974423,151.2502275,'82 Mccormick Parkway','Sydney','New South Wales','Australia',1191),
('Zoombox',-33.7974423,151.2502275,'0187 Bowman Park','Sydney','New South Wales','Australia',1196),
('Teklist',-34.9284989,138.6007456,'0 Tomscot Alley','Adelaide','South Australia','Australia',5839),
('Kwinu',-34.990888,138.574391,'9 Drewry Drive','Adelaide Mail Centre','South Australia','Australia',5889),
('Skyndu',-33.7974423,151.2502275,'75459 Macpherson Plaza','Sydney','New South Wales','Australia',1161),
('Jetwire',-33.8688197,151.2092955,'9036 Briar Crest Place','Sydney','New South Wales','Australia',1033),
('Oyoloo',-37.7236851,144.9633285,'0433 Anniversary Terrace','Sydney','New South Wales','Australia',1009),
('Voolia',-33.863927,151.201887,'1 Stephen Pass','Sydney','New South Wales','Australia',1171),
('Thoughtblab',-33.7974423,151.2502275,'13 Waubesa Terrace','Sydney','New South Wales','Australia',1191),
('Ainyx',-33.863927,151.201887,'4123 Caliangt Trail','Sydney','New South Wales','Australia',1171),
('Eare',-34.990888,138.574391,'10415 Rutledge Lane','Adelaide Mail Centre','South Australia','Australia',5869),
('Meeveo',-33.8688197,151.2092955,'116 Luster Place','Sydney','New South Wales','Australia',1033),
('Miboo',-33.8651294,151.2078882,'9635 Brentwood Place','Australia Square','New South Wales','Australia',1213),
('Trupe',-34.990888,138.574391,'98 Hoard Trail','Adelaide Mail Centre','South Australia','Australia',5889),
('Wordware',-33.8688197,151.2092955,'9593 Surrey Place','Sydney','New South Wales','Australia',1033),
('Vidoo',-33.8882671,151.2078465,'3 Harbort Junction','Strawberry Hills','New South Wales','Australia',1424),
('Youfeed',-33.93274,151.188577,'8733 Garrison Court','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Avavee',-34.9284989,138.6007456,'66824 Muir Trail','Adelaide','South Australia','Australia',5839),
('Latz',-38.043127,145.297768,'042 Walton Junction','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Kimia',-31.9505269,115.8604572,'62 Rigney Park','Perth','Western Australia','Australia',6817),
('Einti',-33.93274,151.188577,'6479 Lawn Circle','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Tagopia',-33.8688197,151.2092955,'60 Cordelia Junction','Sydney South','New South Wales','Australia',1235),
('Topiczoom',-38.043127,145.297768,'0 Havey Center','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Oyope',-33.7974423,151.2502275,'2 Cherokee Plaza','Sydney','New South Wales','Australia',1191),
('Realcube',-37.713929,144.962411,'718 Moland Parkway','Sydney','New South Wales','Australia',1120),
('Jabberbean',-27.4697707,153.0251235,'16955 Pepper Wood Junction','Brisbane','Queensland','Australia',9010),
('Quinu',-33.8688197,151.2092955,'45 Garrison Trail','Sydney South','New South Wales','Australia',1235),
('Midel',-33.93274,151.188577,'6 Texas Drive','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Blogtags',-34.990888,138.574391,'711 Dixon Road','Adelaide Mail Centre','South Australia','Australia',5889),
('Twimm',-33.8882671,151.2078465,'13 Tony Road','Strawberry Hills','New South Wales','Australia',1424),
('Kwimbee',-34.0349557,151.0998291,'14 Helena Court','Sydney','New South Wales','Australia',1028),
('Skyvu',-37.7204693,144.9629556,'235 Anderson Junction','Sydney','New South Wales','Australia',1109),
('Rhyloo',-34.990888,138.574391,'3099 Schurz Court','Adelaide Mail Centre','South Australia','Australia',5889),
('Quinu',-33.7974423,151.2502275,'900 Helena Road','Sydney','New South Wales','Australia',1181),
('Browseblab',-34.990888,138.574391,'59701 Sloan Circle','Adelaide Mail Centre','South Australia','Australia',5889),
('Gabtype',-27.9424308,153.3970962,'7 Tomscot Parkway','Sydney','New South Wales','Australia',1140),
('Youbridge',-33.93274,151.188577,'7070 Bartillon Court','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Wordify',-37.7204693,144.9629556,'3 Main Hill','Sydney','New South Wales','Australia',1109),
('Quamba',-33.7974423,151.2502275,'0 Delladonna Terrace','Sydney','New South Wales','Australia',1161),
('Innojam',-34.990888,138.574391,'5155 Goodland Road','Adelaide Mail Centre','South Australia','Australia',5874),
('Flashspan',-33.8882671,151.2078465,'78889 Bluejay Terrace','Strawberry Hills','New South Wales','Australia',1424),
('Jaxnation',-31.9505269,115.8604572,'7 Oak Drive','Perth','Western Australia','Australia',6817),
('Photojam',-37.7071402,144.9611223,'8668 Melvin Terrace','Sydney','New South Wales','Australia',1206),
('Babbleset',-42.8821377,147.3271949,'701 Hauk Alley','Hobart','Tasmania','Australia',7808),
('Gevee',-37.7204693,144.9629556,'1428 1st Park','Sydney','New South Wales','Australia',1109),
('Ntag',-38.043127,145.297768,'9 Maple Circle','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Fatz',-33.7974423,151.2502275,'5253 Old Gate Point','Sydney','New South Wales','Australia',1196),
('Camido',-37.8136276,144.9630576,'99395 Kings Parkway','Melbourne','Victoria','Australia',8045),
('Voolith',-34.9284989,138.6007456,'96946 Pine View Avenue','Adelaide','South Australia','Australia',5839),
('Feedfish',-37.8136276,144.9630576,'951 Menomonie Place','Melbourne','Victoria','Australia',8383),
('Gigazoom',-33.8688197,151.2092955,'50382 Elka Road','Sydney','New South Wales','Australia',1043),
('Oyondu',-37.7236851,144.9633285,'3696 Emmet Parkway','Sydney','New South Wales','Australia',1009),
('Photobug',-31.9505269,115.8604572,'4 Cascade Avenue','Perth','Western Australia','Australia',6817),
('Thoughtmix',-37.8136276,144.9630576,'74 Summer Ridge Hill','Melbourne','Victoria','Australia',8383),
('Dynabox',-27.4697707,153.0251235,'7 Bunting Avenue','Brisbane','Queensland','Australia',9010),
('Jetwire',-33.93274,151.188577,'262 Butternut Parkway','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Aivee',-37.7204693,144.9629556,'25303 Heath Hill','Sydney','New South Wales','Australia',1109),
('Topicware',-34.990888,138.574391,'4842 2nd Point','Adelaide Mail Centre','South Australia','Australia',5889),
('Quamba',-37.713929,144.962411,'93855 Lerdahl Lane','Sydney','New South Wales','Australia',1120),
('Livetube',-34.990888,138.574391,'3 Scott Crossing','Adelaide Mail Centre','South Australia','Australia',5899),
('Jaxspan',-34.990888,138.574391,'1 Reinke Center','Adelaide Mail Centre','South Australia','Australia',5869),
('Yakitri',-31.9478653,115.8693718,'7 Clyde Gallagher Hill','Perth','Western Australia','Australia',6843),
('Skipstorm',-33.8688197,151.2092955,'58 Vera Terrace','Sydney','New South Wales','Australia',1043),
('Zoovu',-34.990888,138.574391,'0379 Jay Pass','Adelaide Mail Centre','South Australia','Australia',5869),
('Dynazzy',-37.8136276,144.9630576,'03 6th Parkway','Melbourne','Victoria','Australia',8383),
('Wikizz',-37.7204693,144.9629556,'4 Victoria Lane','Sydney','New South Wales','Australia',1109),
('Twitterbridge',-34.0349557,151.0998291,'195 Southridge Point','Sydney','New South Wales','Australia',1028),
('Realbridge',-42.8821377,147.3271949,'57 Forest Dale Court','Hobart','Tasmania','Australia',7803),
('Digitube',-34.990888,138.574391,'931 Kinsman Trail','Adelaide Mail Centre','South Australia','Australia',5889),
('Voomm',-34.990888,138.574391,'53 Mallory Court','Adelaide Mail Centre','South Australia','Australia',5899),
('Mita',-37.7204693,144.9629556,'68648 Kensington Plaza','Sydney','New South Wales','Australia',1109),
('Oyoloo',-42.8821377,147.3271949,'51 Blackbird Lane','Hobart','Tasmania','Australia',7808),
('Youfeed',-34.8352742,138.596204,'2 Goodland Hill','Northern Suburbs Mc','New South Wales','Australia',1694),
('Realblab',-33.8688197,151.2092955,'5 Corscot Place','Sydney','New South Wales','Australia',1033),
('Innotype',-33.8688197,151.2092955,'91408 Harbort Parkway','Sydney','New South Wales','Australia',1043),
('Yakijo',-27.4697707,153.0251235,'3728 Kipling Lane','Brisbane','Queensland','Australia',9010),
('Avamm',-34.990888,138.574391,'1743 Emmet Terrace','Adelaide Mail Centre','South Australia','Australia',5889),
('Fivebridge',-33.93274,151.188577,'05248 Northview Avenue','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Leenti',-33.8989712,151.2149792,'6 Schmedeman Place','Sydney','New South Wales','Australia',1130),
('Topicshots',-42.8821377,147.3271949,'46858 Mesta Road','Hobart','Tasmania','Australia',7803),
('Realpoint',-33.8688197,151.2092955,'659 Browning Center','Sydney','New South Wales','Australia',1033),
('Lazzy',-34.9284989,138.6007456,'497 4th Court','Adelaide','South Australia','Australia',5839),
('Brainsphere',-37.7236851,144.9633285,'47 Charing Cross Terrace','Sydney','New South Wales','Australia',1009),
('Quamba',-42.8821377,147.3271949,'19 Forest Dale Street','Hobart','Tasmania','Australia',7803),
('Voonyx',-27.9424308,153.3970962,'98056 Toban Pass','Sydney','New South Wales','Australia',1140),
('Kwideo',-33.7974423,151.2502275,'5738 Buell Parkway','Sydney','New South Wales','Australia',1161),
('Pixope',-37.7204693,144.9629556,'8487 David Hill','Sydney','New South Wales','Australia',1109),
('Photobean',-33.7974423,151.2502275,'70773 Sutteridge Park','Sydney','New South Wales','Australia',1161),
('Shufflebeat',-33.8688197,151.2092955,'6967 Fuller Park','Sydney South','New South Wales','Australia',1235),
('Yombu',-33.8882671,151.2078465,'646 Cascade Hill','Strawberry Hills','New South Wales','Australia',1424),
('Skippad',-34.990888,138.574391,'02370 4th Road','Adelaide Mail Centre','South Australia','Australia',5874),
('Divavu',-27.9424308,153.3970962,'885 Utah Parkway','Sydney','New South Wales','Australia',1140),
('Photospace',-33.7974423,151.2502275,'3 Northview Place','Sydney','New South Wales','Australia',1161),
('Lazzy',-34.990888,138.574391,'299 Melvin Road','Adelaide Mail Centre','South Australia','Australia',5874),
('Jabbertype',-33.7974423,151.2502275,'45913 3rd Road','Sydney','New South Wales','Australia',1134),
('Brightbean',-33.7974423,151.2502275,'2573 Bunker Hill Crossing','Sydney','New South Wales','Australia',1161),
('Kaymbo',-37.8136276,144.9630576,'0 Troy Junction','Melbourne','Victoria','Australia',8383),
('Bubbletube',-37.8136276,144.9630576,'1 Twin Pines Drive','Melbourne','Victoria','Australia',8045),
('Youfeed',-27.4697707,153.0251235,'14790 Oak Drive','Brisbane','Queensland','Australia',9010),
('Vinte',-34.990888,138.574391,'05 Nelson Lane','Adelaide Mail Centre','South Australia','Australia',5889),
('Skidoo',-33.7974423,151.2502275,'5703 Lillian Avenue','Sydney','New South Wales','Australia',1161),
('Cogibox',-33.7974423,151.2502275,'595 Novick Place','Sydney','New South Wales','Australia',1191),
('Edgepulse',-34.990888,138.574391,'82347 Lindbergh Terrace','Adelaide Mail Centre','South Australia','Australia',5874),
('Divanoodle',-33.8688197,151.2092955,'71 Summer Ridge Pass','Sydney','New South Wales','Australia',1043),
('Jaxworks',-33.7974423,151.2502275,'50 Pine View Road','Sydney','New South Wales','Australia',1181),
('Photobug',-42.8821377,147.3271949,'61518 Parkside Drive','Hobart','Tasmania','Australia',7808),
('Jaxnation',-37.7204693,144.9629556,'2733 Thierer Trail','Sydney','New South Wales','Australia',1109),
('Babbleset',-34.8352742,138.596204,'1 Dorton Drive','Northern Suburbs Mc','New South Wales','Australia',1694),
('Realbridge',-42.8821377,147.3271949,'7 Westend Point','Hobart','Tasmania','Australia',7803),
('Browsetype',-37.7204693,144.9629556,'8 Buell Court','Sydney','New South Wales','Australia',1109),
('Zoomdog',-27.4697707,153.0251235,'06517 Northwestern Center','Brisbane','Queensland','Australia',9010),
('Topicware',-37.7236851,144.9633285,'836 Duke Terrace','Sydney','New South Wales','Australia',1009),
('Twitterworks',-31.9478653,115.8693718,'3194 Donald Point','Perth','Western Australia','Australia',6843),
('Jaxnation',-33.93274,151.188577,'4 Union Center','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Quimm',-33.7974423,151.2502275,'3 Derek Plaza','Sydney','New South Wales','Australia',1181),
('Eabox',-41.4332215,147.1440875,'38 Heffernan Center','Launceston','Tasmania','Australia',7904),
('Brainsphere',-33.7974423,151.2502275,'3 Holy Cross Street','Sydney','New South Wales','Australia',1191),
('Skiptube',-27.4697707,153.0251235,'88851 Schlimgen Crossing','Brisbane','Queensland','Australia',9010),
('Oyondu',-37.8136276,144.9630576,'252 Quincy Parkway','Melbourne','Victoria','Australia',8383),
('Miboo',-33.863927,151.201887,'39 Kingsford Point','Sydney','New South Wales','Australia',1171),
('Dabshots',-33.8651294,151.2078882,'138 Independence Pass','Australia Square','New South Wales','Australia',1213),
('Digitube',-33.8688197,151.2092955,'38 Lyons Pass','Sydney South','New South Wales','Australia',1235),
('Yakitri',-33.7974423,151.2502275,'36 Morningstar Park','Sydney','New South Wales','Australia',1191),
('Avaveo',-34.990888,138.574391,'2 Eastwood Lane','Adelaide Mail Centre','South Australia','Australia',5899),
('Jabberstorm',-34.8352742,138.596204,'5 Nobel Court','Northern Suburbs Mc','New South Wales','Australia',1694),
('Realcube',-33.7974423,151.2502275,'84959 Fair Oaks Road','Sydney','New South Wales','Australia',1134),
('Jabbertype',-34.990888,138.574391,'95026 Golden Leaf Road','Adelaide Mail Centre','South Australia','Australia',5874),
('Skinix',-27.9424308,153.3970962,'31 Springs Road','Sydney','New South Wales','Australia',1140),
('Ntag',-31.9478653,115.8693718,'9 Weeping Birch Junction','Perth','Western Australia','Australia',6843),
('Riffpedia',-34.8352742,138.596204,'8864 Stephen Street','Northern Suburbs Mc','New South Wales','Australia',1694),
('Thoughtstorm',-37.7204693,144.9629556,'4153 Express Circle','Sydney','New South Wales','Australia',1109),
('Mudo',-33.7974423,151.2502275,'6 Dottie Point','Sydney','New South Wales','Australia',1161),
('Quamba',-31.9478653,115.8693718,'310 Shoshone Point','Perth','Western Australia','Australia',6843),
('Demizz',-41.4332215,147.1440875,'973 Old Shore Terrace','Launceston','Tasmania','Australia',7916),
('Devpoint',-33.8882671,151.2078465,'03917 Melby Avenue','Strawberry Hills','New South Wales','Australia',1424),
('Quire',-27.9424308,153.3970962,'1254 Ridgeway Court','Sydney','New South Wales','Australia',1140),
('Browsebug',-34.990888,138.574391,'6903 Truax Way','Adelaide Mail Centre','South Australia','Australia',5899),
('Wordpedia',-42.8821377,147.3271949,'834 Katie Hill','Hobart','Tasmania','Australia',7808),
('Pixoboo',-37.7236851,144.9633285,'325 Melrose Avenue','Sydney','New South Wales','Australia',1009),
('Devshare',-37.7236851,144.9633285,'2247 Nancy Alley','Sydney','New South Wales','Australia',1009),
('Innotype',-33.863927,151.201887,'5051 Charing Cross Road','Sydney','New South Wales','Australia',1171),
('Babbleopia',-37.7071402,144.9611223,'3 Scoville Crossing','Sydney','New South Wales','Australia',1206),
('Flashspan',-33.8688197,151.2092955,'943 Scofield Circle','Sydney','New South Wales','Australia',1033),
('Quatz',-33.7974423,151.2502275,'44599 Carberry Crossing','Sydney','New South Wales','Australia',1191),
('Meemm',-33.8688197,151.2092955,'5113 Rockefeller Park','Sydney','New South Wales','Australia',1043),
('Flipopia',-34.990888,138.574391,'72 Cordelia Crossing','Adelaide Mail Centre','South Australia','Australia',5889),
('Kazio',-33.8651294,151.2078882,'7 Katie Parkway','Australia Square','New South Wales','Australia',1213),
('Eazzy',-34.990888,138.574391,'608 High Crossing Trail','Adelaide Mail Centre','South Australia','Australia',5899),
('Twitterwire',-33.7974423,151.2502275,'63 Lerdahl Pass','Sydney','New South Wales','Australia',1196),
('Roomm',-33.7974423,151.2502275,'89660 Fordem Way','Sydney','New South Wales','Australia',1134),
('Mudo',-34.8352742,138.596204,'9 Oak Way','Northern Suburbs Mc','New South Wales','Australia',1694),
('Ooba',-34.990888,138.574391,'95207 Muir Crossing','Adelaide Mail Centre','South Australia','Australia',5889),
('Rhyloo',-37.7204693,144.9629556,'0108 Washington Lane','Sydney','New South Wales','Australia',1109),
('Mydeo',-27.4697707,153.0251235,'6 1st Junction','Brisbane','Queensland','Australia',9010),
('Skinix',-37.7071402,144.9611223,'0 Bartelt Center','Sydney','New South Wales','Australia',1206),
('Meevee',-33.93274,151.188577,'80 Debra Point','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Tazzy',-33.8688197,151.2092955,'5910 Derek Court','Sydney South','New South Wales','Australia',1235),
('Eazzy',-33.8651294,151.2078882,'701 Independence Court','Australia Square','New South Wales','Australia',1213),
('Meembee',-42.8821377,147.3271949,'5946 Vermont Park','Hobart','Tasmania','Australia',7803),
('Meeveo',-31.9478653,115.8693718,'99859 Lawn Place','Perth','Western Australia','Australia',6843),
('Rhynoodle',-37.8136276,144.9630576,'342 Kim Terrace','Melbourne','Victoria','Australia',8045),
('Skivee',-31.9505269,115.8604572,'161 Armistice Junction','Perth','Western Australia','Australia',6817),
('Topicblab',-33.8688197,151.2092955,'75992 Pankratz Point','Sydney South','New South Wales','Australia',1235),
('Linklinks',-34.990888,138.574391,'5 Hallows Pass','Adelaide Mail Centre','South Australia','Australia',5889),
('Mynte',-31.9505269,115.8604572,'13314 Becker Center','Perth','Western Australia','Australia',6817),
('Kazu',-27.9424308,153.3970962,'36 Bunker Hill Court','Sydney','New South Wales','Australia',1140),
('Brainlounge',-31.9478653,115.8693718,'26917 Red Cloud Alley','Perth','Western Australia','Australia',6843),
('Oloo',-31.9505269,115.8604572,'26273 Birchwood Terrace','Perth','Western Australia','Australia',6817),
('Skilith',-41.4332215,147.1440875,'9 Swallow Drive','Launceston','Tasmania','Australia',7916),
('Photobug',-38.043127,145.297768,'20 Blue Bill Park Hill','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Yata',-33.7974423,151.2502275,'1 Orin Drive','Sydney','New South Wales','Australia',1161),
('Blogtag',-33.93274,151.188577,'75044 Nobel Park','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Dabvine',-33.8882671,151.2078465,'75 Lighthouse Bay Alley','Strawberry Hills','New South Wales','Australia',1424),
('Katz',-37.7236851,144.9633285,'19806 Green Ridge Park','Sydney','New South Wales','Australia',1009),
('Livepath',-33.7974423,151.2502275,'2 Gerald Trail','Sydney','New South Wales','Australia',1134),
('Wikizz',-42.8821377,147.3271949,'44 Barnett Center','Hobart','Tasmania','Australia',7803),
('Mycat',-42.8821377,147.3271949,'47 Schlimgen Street','Hobart','Tasmania','Australia',7808),
('Geba',-41.4332215,147.1440875,'597 Dixon Terrace','Launceston','Tasmania','Australia',7916),
('Mita',-42.8821377,147.3271949,'61 Lindbergh Way','Hobart','Tasmania','Australia',7803),
('Gabcube',-33.7974423,151.2502275,'69167 Acker Parkway','Sydney','New South Wales','Australia',1134),
('Topiczoom',-33.7974423,151.2502275,'9 Darwin Pass','Sydney','New South Wales','Australia',1181),
('Skaboo',-33.7974423,151.2502275,'40 Iowa Lane','Sydney','New South Wales','Australia',1196),
('Linkbuzz',-33.8688197,151.2092955,'8667 Grasskamp Hill','Sydney South','New South Wales','Australia',1235),
('Yadel',-33.7974423,151.2502275,'368 Carberry Junction','Sydney','New South Wales','Australia',1134),
('Meembee',-33.863927,151.201887,'14566 Dawn Way','Sydney','New South Wales','Australia',1171),
('Meevee',-42.8821377,147.3271949,'1 Laurel Center','Hobart','Tasmania','Australia',7803),
('Livepath',-34.990888,138.574391,'26 Pine View Pass','Adelaide Mail Centre','South Australia','Australia',5874),
('Blogtag',-33.7974423,151.2502275,'2 Coolidge Park','Sydney','New South Wales','Australia',1196),
('Aimbo',-34.990888,138.574391,'7113 8th Court','Adelaide Mail Centre','South Australia','Australia',5869),
('Rhyzio',-37.7071402,144.9611223,'8 Warbler Point','Sydney','New South Wales','Australia',1206),
('Oozz',-31.9505269,115.8604572,'72194 Mayer Lane','Perth','Western Australia','Australia',6817),
('Ntags',-31.9505269,115.8604572,'391 Southridge Park','Perth','Western Australia','Australia',6817),
('Yambee',-34.8352742,138.596204,'2431 Brown Circle','Northern Suburbs Mc','New South Wales','Australia',1694),
('Devshare',-37.7204693,144.9629556,'6092 Mallory Street','Sydney','New South Wales','Australia',1109),
('Tagtune',-33.8882671,151.2078465,'89 Melrose Way','Strawberry Hills','New South Wales','Australia',1424),
('Zoonder',-34.990888,138.574391,'4299 Pearson Crossing','Adelaide Mail Centre','South Australia','Australia',5889),
('Browsetype',-34.990888,138.574391,'36083 Stuart Crossing','Adelaide Mail Centre','South Australia','Australia',5874),
('Pixope',-42.8821377,147.3271949,'41 Vera Park','Hobart','Tasmania','Australia',7808),
('Bluezoom',-42.8821377,147.3271949,'66 Gale Lane','Hobart','Tasmania','Australia',7808),
('Wordware',-31.9478653,115.8693718,'76 Roth Crossing','Perth','Western Australia','Australia',6843),
('Flashpoint',-33.7974423,151.2502275,'85 Doe Crossing Trail','Sydney','New South Wales','Australia',1181),
('Leenti',-33.7974423,151.2502275,'43 8th Center','Sydney','New South Wales','Australia',1161),
('Buzzster',-31.9505269,115.8604572,'0 Towne Court','Perth','Western Australia','Australia',6817),
('Gabcube',-34.9284989,138.6007456,'5382 Anderson Place','Adelaide','South Australia','Australia',5839),
('Babbleblab',-41.4332215,147.1440875,'305 Stang Junction','Launceston','Tasmania','Australia',7904),
('Skaboo',-33.8989712,151.2149792,'44 Straubel Alley','Sydney','New South Wales','Australia',1130),
('Divavu',-33.863927,151.201887,'93 Red Cloud Avenue','Sydney','New South Wales','Australia',1171),
('Gigashots',-33.93274,151.188577,'82400 Carberry Point','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Bubblebox',-33.7974423,151.2502275,'58 Chinook Hill','Sydney','New South Wales','Australia',1161),
('Aimbo',-27.4697707,153.0251235,'908 Lien Place','Brisbane','Queensland','Australia',9010),
('Fanoodle',-33.863927,151.201887,'345 Londonderry Way','Sydney','New South Wales','Australia',1171),
('Eayo',-42.8821377,147.3271949,'1383 Superior Center','Hobart','Tasmania','Australia',7808),
('Brightbean',-33.8651294,151.2078882,'9 Rutledge Park','Australia Square','New South Wales','Australia',1213),
('Camimbo',-33.863927,151.201887,'39 Evergreen Way','Sydney','New South Wales','Australia',1171),
('Lajo',-34.990888,138.574391,'25788 Holy Cross Crossing','Adelaide Mail Centre','South Australia','Australia',5889),
('Topiclounge',-33.8882671,151.2078465,'10 Eliot Crossing','Strawberry Hills','New South Wales','Australia',1424),
('Jazzy',-41.4332215,147.1440875,'48 Rusk Lane','Launceston','Tasmania','Australia',7916),
('Blogtags',-34.990888,138.574391,'895 Havey Alley','Adelaide Mail Centre','South Australia','Australia',5899),
('Meeveo',-33.7974423,151.2502275,'669 Schiller Drive','Sydney','New South Wales','Australia',1181),
('Devify',-33.8651294,151.2078882,'24 Coleman Drive','Australia Square','New South Wales','Australia',1213),
('Yotz',-34.8352742,138.596204,'8691 Meadow Ridge Hill','Northern Suburbs Mc','New South Wales','Australia',1694),
('Devshare',-34.990888,138.574391,'9 Namekagon Circle','Adelaide Mail Centre','South Australia','Australia',5889),
('Cogilith',-31.9505269,115.8604572,'58719 Luster Road','Perth','Western Australia','Australia',6817),
('Voomm',-42.8821377,147.3271949,'096 Golf Course Road','Hobart','Tasmania','Australia',7808),
('Topicstorm',-34.990888,138.574391,'00316 Autumn Leaf Alley','Adelaide Mail Centre','South Australia','Australia',5889),
('Centidel',-37.8136276,144.9630576,'29 Sheridan Hill','Melbourne','Victoria','Australia',8045),
('Viva',-33.8989712,151.2149792,'99 Monterey Plaza','Sydney','New South Wales','Australia',1130),
('Kanoodle',-33.8688197,151.2092955,'4853 Mcguire Parkway','Sydney','New South Wales','Australia',1033),
('Blognation',-37.713929,144.962411,'6173 Grasskamp Place','Sydney','New South Wales','Australia',1120),
('Browseblab',-37.7071402,144.9611223,'032 Esch Lane','Sydney','New South Wales','Australia',1206),
('Devbug',-34.990888,138.574391,'18 Mcbride Court','Adelaide Mail Centre','South Australia','Australia',5899),
('Digitube',-37.8136276,144.9630576,'5 Jackson Plaza','Melbourne','Victoria','Australia',8045),
('Skinder',-31.9478653,115.8693718,'1064 Mcguire Terrace','Perth','Western Australia','Australia',6843),
('Yombu',-34.8352742,138.596204,'06 Donald Drive','Northern Suburbs Mc','New South Wales','Australia',1694),
('Youbridge',-34.9284989,138.6007456,'0 Florence Center','Adelaide','South Australia','Australia',5839),
('Latz',-33.8989712,151.2149792,'076 Dayton Road','Sydney','New South Wales','Australia',1130),
('Izio',-33.7974423,151.2502275,'5873 Logan Pass','Sydney','New South Wales','Australia',1161),
('Twitternation',-33.93274,151.188577,'274 Goodland Pass','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Oyoba',-33.93274,151.188577,'109 North Circle','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Abatz',-33.93274,151.188577,'257 Lillian Hill','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Skyvu',-34.990888,138.574391,'12 Laurel Way','Adelaide Mail Centre','South Australia','Australia',5899),
('Thoughtstorm',-33.7974423,151.2502275,'56 Donald Road','Sydney','New South Wales','Australia',1134),
('Bubbletube',-42.8821377,147.3271949,'468 Hanover Trail','Hobart','Tasmania','Australia',7808),
('Skilith',-27.9424308,153.3970962,'9 Ronald Regan Park','Sydney','New South Wales','Australia',1140),
('Muxo',-33.863927,151.201887,'15 Hovde Way','Sydney','New South Wales','Australia',1171),
('Oozz',-34.990888,138.574391,'6 Blue Bill Park Alley','Adelaide Mail Centre','South Australia','Australia',5899),
('Yakitri',-41.4332215,147.1440875,'0531 8th Terrace','Launceston','Tasmania','Australia',7904),
('Tambee',-33.863927,151.201887,'1 Vera Drive','Sydney','New South Wales','Australia',1171),
('Skippad',-42.8821377,147.3271949,'81728 Marquette Alley','Hobart','Tasmania','Australia',7803),
('Twiyo',-37.713929,144.962411,'26462 Hoepker Avenue','Sydney','New South Wales','Australia',1120),
('Katz',-34.9284989,138.6007456,'62778 Melody Hill','Adelaide','South Australia','Australia',5839),
('Mydeo',-41.4332215,147.1440875,'69397 Blue Bill Park Drive','Launceston','Tasmania','Australia',7904),
('Thoughtworks',-33.7974423,151.2502275,'3 Corry Alley','Sydney','New South Wales','Australia',1191),
('Youopia',-42.8821377,147.3271949,'29280 Riverside Hill','Hobart','Tasmania','Australia',7803),
('Youopia',-37.8136276,144.9630576,'77674 La Follette Junction','Melbourne','Victoria','Australia',8383),
('Shuffletag',-37.8136276,144.9630576,'81358 Summer Ridge Drive','Melbourne','Victoria','Australia',8383),
('Thoughtstorm',-33.8688197,151.2092955,'4 Cody Crossing','Sydney South','New South Wales','Australia',1235),
('Jayo',-34.990888,138.574391,'470 Meadow Ridge Junction','Adelaide Mail Centre','South Australia','Australia',5899),
('Skinte',-31.9505269,115.8604572,'9470 Melvin Way','Perth','Western Australia','Australia',6817),
('Topiclounge',-33.7974423,151.2502275,'1 Becker Drive','Sydney','New South Wales','Australia',1161),
('Gevee',-34.9284989,138.6007456,'3 Waubesa Road','Adelaide','South Australia','Australia',5839),
('Kazio',-33.863927,151.201887,'16999 Schmedeman Place','Sydney','New South Wales','Australia',1171),
('InnoZ',-33.8651294,151.2078882,'6 Boyd Point','Australia Square','New South Wales','Australia',1213),
('Devpoint',-34.990888,138.574391,'3269 Mallory Center','Adelaide Mail Centre','South Australia','Australia',5899),
('Zoonder',-33.8651294,151.2078882,'81 Dottie Drive','Australia Square','New South Wales','Australia',1213),
('LiveZ',-34.0349557,151.0998291,'47 Nevada Road','Sydney','New South Wales','Australia',1028),
('Twitterlist',-41.4332215,147.1440875,'3 Raven Alley','Launceston','Tasmania','Australia',7916),
('Jabberbean',-27.9424308,153.3970962,'2914 Hovde Crossing','Sydney','New South Wales','Australia',1140),
('Kazio',-41.4332215,147.1440875,'16 Debs Alley','Launceston','Tasmania','Australia',7904),
('Tambee',-37.8136276,144.9630576,'67826 Little Fleur Street','Melbourne','Victoria','Australia',8383),
('Skipstorm',-33.8688197,151.2092955,'0423 Old Gate Park','Sydney','New South Wales','Australia',1033),
('Miboo',-33.8688197,151.2092955,'6647 Lyons Avenue','Sydney','New South Wales','Australia',1043),
('Skyble',-33.93274,151.188577,'3 Almo Park','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Quamba',-33.7974423,151.2502275,'9112 Fuller Terrace','Sydney','New South Wales','Australia',1196),
('Tagtune',-33.8688197,151.2092955,'479 Packers Trail','Sydney South','New South Wales','Australia',1235),
('Bubbletube',-33.7974423,151.2502275,'6131 Scoville Junction','Sydney','New South Wales','Australia',1161),
('Aibox',-33.7974423,151.2502275,'98252 Kropf Place','Sydney','New South Wales','Australia',1191),
('Plambee',-33.8651294,151.2078882,'81 Bellgrove Road','Australia Square','New South Wales','Australia',1213),
('Zooveo',-33.8688197,151.2092955,'5 Ilene Park','Sydney','New South Wales','Australia',1043),
('Jetpulse',-33.7974423,151.2502275,'77694 Longview Drive','Sydney','New South Wales','Australia',1181),
('Divape',-33.7974423,151.2502275,'15879 Graceland Pass','Sydney','New South Wales','Australia',1134),
('Fanoodle',-41.4332215,147.1440875,'61439 Harbort Way','Launceston','Tasmania','Australia',7904),
('Divape',-33.7974423,151.2502275,'72 Clarendon Trail','Sydney','New South Wales','Australia',1134),
('Yacero',-41.4332215,147.1440875,'1086 Texas Point','Launceston','Tasmania','Australia',7916),
('Avavee',-33.8882671,151.2078465,'543 Harbort Pass','Strawberry Hills','New South Wales','Australia',1424),
('Realpoint',-31.9505269,115.8604572,'75 Fallview Hill','Perth','Western Australia','Australia',6817),
('Kazu',-41.4332215,147.1440875,'9 Morning Crossing','Launceston','Tasmania','Australia',7904),
('Youtags',-37.8136276,144.9630576,'542 Golf Course Court','Melbourne','Victoria','Australia',8383),
('Tanoodle',-33.863927,151.201887,'782 Kropf Junction','Sydney','New South Wales','Australia',1171),
('Ntags',-42.8821377,147.3271949,'723 Doe Crossing Alley','Hobart','Tasmania','Australia',7803),
('Dabfeed',-33.8688197,151.2092955,'2529 Johnson Place','Sydney','New South Wales','Australia',1033),
('Digitube',-34.990888,138.574391,'86 Eagle Crest Lane','Adelaide Mail Centre','South Australia','Australia',5899),
('Thoughtsphere',-34.9284989,138.6007456,'82515 Reindahl Center','Adelaide','South Australia','Australia',5839),
('Zava',-37.7236851,144.9633285,'41544 Red Cloud Pass','Sydney','New South Wales','Australia',1009),
('Quamba',-37.7236851,144.9633285,'6 Rowland Drive','Sydney','New South Wales','Australia',1009),
('Yombu',-34.990888,138.574391,'59137 Kingsford Park','Adelaide Mail Centre','South Australia','Australia',5869),
('Linktype',-33.8688197,151.2092955,'1200 Jenifer Street','Sydney','New South Wales','Australia',1033),
('Pixope',-33.8651294,151.2078882,'3288 Helena Place','Australia Square','New South Wales','Australia',1213),
('Trilith',-34.8352742,138.596204,'3188 Ryan Parkway','Northern Suburbs Mc','New South Wales','Australia',1694),
('Realblab',-33.93274,151.188577,'942 Scott Road','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Dazzlesphere',-41.4332215,147.1440875,'12 Menomonie Crossing','Launceston','Tasmania','Australia',7904),
('Riffpedia',-33.8688197,151.2092955,'4501 Ridgeview Center','Sydney','New South Wales','Australia',1043),
('Jaxspan',-33.7974423,151.2502275,'6 Spohn Plaza','Sydney','New South Wales','Australia',1191),
('Tanoodle',-34.9284989,138.6007456,'420 Rieder Trail','Adelaide','South Australia','Australia',5839),
('Kanoodle',-27.9424308,153.3970962,'45 Mesta Place','Sydney','New South Wales','Australia',1140),
('Thoughtmix',-27.9424308,153.3970962,'94767 Sutteridge Street','Sydney','New South Wales','Australia',1140),
('Ntags',-31.9478653,115.8693718,'4 Pleasure Road','Perth','Western Australia','Australia',6843),
('Skynoodle',-34.9284989,138.6007456,'1407 Independence Drive','Adelaide','South Australia','Australia',5839),
('Tavu',-33.8688197,151.2092955,'4414 Messerschmidt Plaza','Sydney','New South Wales','Australia',1033),
('Kamba',-33.8651294,151.2078882,'09504 Judy Crossing','Australia Square','New South Wales','Australia',1213),
('Skimia',-37.7204693,144.9629556,'4329 Graceland Court','Sydney','New South Wales','Australia',1109),
('Mydeo',-33.8989712,151.2149792,'11751 Gale Hill','Sydney','New South Wales','Australia',1130),
('Gabtype',-34.990888,138.574391,'009 Thackeray Road','Adelaide Mail Centre','South Australia','Australia',5899),
('Wikizz',-34.990888,138.574391,'4 Talmadge Junction','Adelaide Mail Centre','South Australia','Australia',5874),
('Jetpulse',-33.7974423,151.2502275,'10 Bunting Alley','Sydney','New South Wales','Australia',1161),
('Twitterbeat',-34.990888,138.574391,'7240 Sunfield Point','Adelaide Mail Centre','South Australia','Australia',5869),
('Dynabox',-37.7071402,144.9611223,'8625 Nelson Way','Sydney','New South Wales','Australia',1206),
('Yodoo',-38.043127,145.297768,'00 Forest Point','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Flashspan',-33.7974423,151.2502275,'14 Londonderry Place','Sydney','New South Wales','Australia',1181),
('Pixoboo',-33.863927,151.201887,'32243 Annamark Pass','Sydney','New South Wales','Australia',1171),
('Meezzy',-33.7974423,151.2502275,'047 Eastlawn Place','Sydney','New South Wales','Australia',1161),
('Jaloo',-42.8821377,147.3271949,'3780 Hanover Pass','Hobart','Tasmania','Australia',7808),
('Eadel',-33.93274,151.188577,'84700 Reinke Point','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Wikivu',-33.93274,151.188577,'3 Del Mar Court','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Feedspan',-34.990888,138.574391,'08264 Warbler Plaza','Adelaide Mail Centre','South Australia','Australia',5899),
('Brightdog',-27.4697707,153.0251235,'6 Hayes Lane','Brisbane','Queensland','Australia',9010),
('Jetpulse',-33.93274,151.188577,'258 Annamark Plaza','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Realmix',-31.9478653,115.8693718,'3556 Gale Road','Perth','Western Australia','Australia',6843),
('Chatterbridge',-37.7071402,144.9611223,'47428 Michigan Street','Sydney','New South Wales','Australia',1206),
('Roomm',-37.8136276,144.9630576,'5005 Muir Lane','Melbourne','Victoria','Australia',8383),
('Fadeo',-41.4332215,147.1440875,'9 Kensington Terrace','Launceston','Tasmania','Australia',7916),
('Ozu',-33.8989712,151.2149792,'26377 Melody Hill','Sydney','New South Wales','Australia',1130),
('Meetz',-34.990888,138.574391,'38 Village Park','Adelaide Mail Centre','South Australia','Australia',5869),
('Eidel',-37.7071402,144.9611223,'60100 Northland Trail','Sydney','New South Wales','Australia',1206),
('Centimia',-33.7974423,151.2502275,'67536 Kim Crossing','Sydney','New South Wales','Australia',1196),
('Zoomlounge',-37.7204693,144.9629556,'2 Tennessee Hill','Sydney','New South Wales','Australia',1109),
('Linklinks',-33.8882671,151.2078465,'074 Beilfuss Parkway','Strawberry Hills','New South Wales','Australia',1424),
('Yacero',-37.8136276,144.9630576,'63687 Independence Circle','Melbourne','Victoria','Australia',8383),
('Shuffledrive',-34.990888,138.574391,'41260 Norway Maple Alley','Adelaide Mail Centre','South Australia','Australia',5899),
('Photofeed',-42.8821377,147.3271949,'2574 Green Ridge Trail','Hobart','Tasmania','Australia',7803),
('Janyx',-33.93274,151.188577,'94913 Sloan Plaza','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Skilith',-31.9478653,115.8693718,'490 Dorton Crossing','Perth','Western Australia','Australia',6843),
('Skiba',-33.863927,151.201887,'89595 Algoma Hill','Sydney','New South Wales','Australia',1171),
('Youfeed',-33.8688197,151.2092955,'95 International Alley','Sydney South','New South Wales','Australia',1235),
('Fivebridge',-37.713929,144.962411,'05 Stuart Road','Sydney','New South Wales','Australia',1120),
('Topicware',-33.8651294,151.2078882,'651 Cody Road','Australia Square','New South Wales','Australia',1213),
('Browseblab',-33.8651294,151.2078882,'10 David Hill','Australia Square','New South Wales','Australia',1213),
('Mybuzz',-33.8651294,151.2078882,'2147 Petterle Point','Australia Square','New South Wales','Australia',1213),
('Jaxbean',-38.043127,145.297768,'488 Milwaukee Road','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Gigaclub',-41.4332215,147.1440875,'0 Northridge Terrace','Launceston','Tasmania','Australia',7916),
('Vipe',-41.4332215,147.1440875,'06433 Ridgeway Circle','Launceston','Tasmania','Australia',7916),
('Eire',-33.7974423,151.2502275,'9602 Macpherson Crossing','Sydney','New South Wales','Australia',1161),
('Eimbee',-41.4332215,147.1440875,'410 Sommers Parkway','Launceston','Tasmania','Australia',7916),
('Skynoodle',-33.8651294,151.2078882,'181 Larry Plaza','Australia Square','New South Wales','Australia',1213),
('Brightbean',-37.7236851,144.9633285,'42049 Nova Place','Sydney','New South Wales','Australia',1009),
('Jabbersphere',-33.7974423,151.2502275,'7124 Forest Run Park','Sydney','New South Wales','Australia',1191),
('Lazzy',-34.990888,138.574391,'711 Loeprich Alley','Adelaide Mail Centre','South Australia','Australia',5874),
('Quinu',-41.4332215,147.1440875,'14870 Ohio Trail','Launceston','Tasmania','Australia',7916),
('Oloo',-41.4332215,147.1440875,'8 Valley Edge Plaza','Launceston','Tasmania','Australia',7904),
('Centimia',-33.8989712,151.2149792,'30 Fallview Circle','Sydney','New South Wales','Australia',1130),
('Thoughtsphere',-34.0349557,151.0998291,'3 Oak Plaza','Sydney','New South Wales','Australia',1028),
('Rhynoodle',-33.8651294,151.2078882,'96 Blackbird Place','Australia Square','New South Wales','Australia',1213),
('Wordtune',-42.8821377,147.3271949,'97 Maple Park','Hobart','Tasmania','Australia',7808),
('Ooba',-33.93274,151.188577,'3201 Hansons Trail','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Abatz',-33.7974423,151.2502275,'06 Shasta Street','Sydney','New South Wales','Australia',1161),
('Twitterworks',-33.93274,151.188577,'5 Thierer Lane','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Flipstorm',-41.4332215,147.1440875,'43 Eliot Lane','Launceston','Tasmania','Australia',7916),
('Quatz',-42.8821377,147.3271949,'89422 Daystar Place','Hobart','Tasmania','Australia',7803),
('Zoombeat',-41.4332215,147.1440875,'4 Ridgeview Alley','Launceston','Tasmania','Australia',7904),
('Yoveo',-37.7204693,144.9629556,'6622 Quincy Point','Sydney','New South Wales','Australia',1109),
('Zazio',-33.7974423,151.2502275,'315 Pankratz Junction','Sydney','New South Wales','Australia',1181),
('Tagtune',-31.9478653,115.8693718,'1 Sommers Avenue','Perth','Western Australia','Australia',6843),
('Voomm',-34.8352742,138.596204,'733 Coleman Way','Northern Suburbs Mc','New South Wales','Australia',1694),
('Tavu',-31.9505269,115.8604572,'2 Green Ridge Lane','Perth','Western Australia','Australia',6817),
('Jabbertype',-37.7236851,144.9633285,'863 Crest Line Trail','Sydney','New South Wales','Australia',1009),
('Lazzy',-38.043127,145.297768,'93 Dakota Place','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Meejo',-33.7974423,151.2502275,'2 Parkside Terrace','Sydney','New South Wales','Australia',1134),
('Eabox',-42.8821377,147.3271949,'32792 Glendale Point','Hobart','Tasmania','Australia',7803),
('Flashset',-33.7974423,151.2502275,'1 Donald Hill','Sydney','New South Wales','Australia',1196),
('Wikizz',-33.7974423,151.2502275,'2081 Hoepker Way','Sydney','New South Wales','Australia',1134),
('Twimm',-31.9505269,115.8604572,'4 Logan Street','Perth','Western Australia','Australia',6817),
('Pixope',-33.8882671,151.2078465,'63396 Hollow Ridge Junction','Strawberry Hills','New South Wales','Australia',1424),
('Quinu',-33.7974423,151.2502275,'932 Southridge Park','Sydney','New South Wales','Australia',1181),
('Flipopia',-33.8688197,151.2092955,'361 Buell Parkway','Sydney South','New South Wales','Australia',1235),
('InnoZ',-37.7071402,144.9611223,'03742 Killdeer Junction','Sydney','New South Wales','Australia',1206),
('Skyble',-33.8882671,151.2078465,'45588 Carberry Center','Strawberry Hills','New South Wales','Australia',1424),
('Kwinu',-34.990888,138.574391,'76476 Morningstar Terrace','Adelaide Mail Centre','South Australia','Australia',5889),
('Zazio',-33.8882671,151.2078465,'77 Merrick Alley','Strawberry Hills','New South Wales','Australia',1424),
('InnoZ',-33.7974423,151.2502275,'0755 Independence Park','Sydney','New South Wales','Australia',1181),
('Roodel',-42.8821377,147.3271949,'95 Larry Street','Hobart','Tasmania','Australia',7803),
('Brainlounge',-33.7974423,151.2502275,'2591 Autumn Leaf Street','Sydney','New South Wales','Australia',1196),
('Abata',-33.863927,151.201887,'544 Lien Hill','Sydney','New South Wales','Australia',1171),
('Skynoodle',-34.8352742,138.596204,'56 Lawn Terrace','Northern Suburbs Mc','New South Wales','Australia',1694),
('Yombu',-34.990888,138.574391,'7381 Maywood Way','Adelaide Mail Centre','South Australia','Australia',5899),
('Skynoodle',-34.8352742,138.596204,'2 Becker Trail','Northern Suburbs Mc','New South Wales','Australia',1694),
('Skaboo',-27.4697707,153.0251235,'10977 Evergreen Center','Brisbane','Queensland','Australia',9010),
('Kwilith',-34.990888,138.574391,'383 Londonderry Place','Adelaide Mail Centre','South Australia','Australia',5889),
('Skipfire',-37.8136276,144.9630576,'507 South Trail','Melbourne','Victoria','Australia',8383),
('Yamia',-37.713929,144.962411,'5116 Redwing Terrace','Sydney','New South Wales','Australia',1120),
('Vidoo',-34.990888,138.574391,'62659 Maple Drive','Adelaide Mail Centre','South Australia','Australia',5889),
('Jaxnation',-42.8821377,147.3271949,'947 Grasskamp Avenue','Hobart','Tasmania','Australia',7808),
('Digitube',-34.9284989,138.6007456,'58 Londonderry Center','Adelaide','South Australia','Australia',5839),
('Divavu',-37.8136276,144.9630576,'93770 Harbort Pass','Melbourne','Victoria','Australia',8045),
('Livetube',-37.7236851,144.9633285,'68179 Macpherson Pass','Sydney','New South Wales','Australia',1009),
('Yozio',-34.990888,138.574391,'09895 Vermont Drive','Adelaide Mail Centre','South Australia','Australia',5869),
('Trupe',-33.8989712,151.2149792,'17 Sunfield Street','Sydney','New South Wales','Australia',1130),
('Meejo',-34.990888,138.574391,'81688 Glacier Hill Trail','Adelaide Mail Centre','South Australia','Australia',5874),
('Kayveo',-34.0349557,151.0998291,'92 Jenna Pass','Sydney','New South Wales','Australia',1028),
('Riffpath',-33.8688197,151.2092955,'92 Washington Center','Sydney South','New South Wales','Australia',1235),
('Buzzster',-41.4332215,147.1440875,'95 Briar Crest Pass','Launceston','Tasmania','Australia',7916),
('Thoughtstorm',-33.7974423,151.2502275,'1786 Doe Crossing Drive','Sydney','New South Wales','Australia',1191),
('Skynoodle',-37.7236851,144.9633285,'89 Green Terrace','Sydney','New South Wales','Australia',1009),
('Wordtune',-33.8651294,151.2078882,'83007 Bluestem Lane','Australia Square','New South Wales','Australia',1213),
('Geba',-37.713929,144.962411,'70593 Leroy Pass','Sydney','New South Wales','Australia',1120),
('Digitube',-37.7236851,144.9633285,'206 Colorado Parkway','Sydney','New South Wales','Australia',1009),
('Ntags',-37.8136276,144.9630576,'19 Iowa Center','Melbourne','Victoria','Australia',8045),
('Fivebridge',-42.8821377,147.3271949,'69 Morrow Court','Hobart','Tasmania','Australia',7808),
('Fatz',-37.7071402,144.9611223,'341 Melrose Road','Sydney','New South Wales','Australia',1206),
('Jaxspan',-38.043127,145.297768,'052 Warrior Alley','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Quimm',-31.9505269,115.8604572,'91 Spaight Lane','Perth','Western Australia','Australia',6817),
('Quire',-33.7974423,151.2502275,'16100 Homewood Hill','Sydney','New South Wales','Australia',1191),
('Jabbertype',-33.93274,151.188577,'11053 Emmet Avenue','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Bubbletube',-34.990888,138.574391,'16297 Memorial Trail','Adelaide Mail Centre','South Australia','Australia',5874),
('Oodoo',-33.8688197,151.2092955,'1223 Southridge Avenue','Sydney','New South Wales','Australia',1033),
('Viva',-34.0349557,151.0998291,'80 Cardinal Road','Sydney','New South Wales','Australia',1028),
('Skalith',-37.7071402,144.9611223,'10 Pepper Wood Junction','Sydney','New South Wales','Australia',1206),
('Tazzy',-37.8136276,144.9630576,'6 Meadow Valley Pass','Melbourne','Victoria','Australia',8383),
('Babbleblab',-33.8882671,151.2078465,'31 Oak Valley Center','Strawberry Hills','New South Wales','Australia',1424),
('Flashdog',-33.7974423,151.2502275,'9048 Hayes Court','Sydney','New South Wales','Australia',1161),
('Trudoo',-33.8688197,151.2092955,'381 3rd Pass','Sydney','New South Wales','Australia',1043),
('Blogtag',-33.8882671,151.2078465,'2596 Pond Parkway','Strawberry Hills','New South Wales','Australia',1424),
('Kazu',-42.8821377,147.3271949,'1 Russell Plaza','Hobart','Tasmania','Australia',7803),
('Feedspan',-31.9478653,115.8693718,'0 Sachs Court','Perth','Western Australia','Australia',6843),
('Wordware',-41.4332215,147.1440875,'744 Maple Court','Launceston','Tasmania','Australia',7916),
('Rhycero',-33.8688197,151.2092955,'66 Coolidge Court','Sydney','New South Wales','Australia',1043),
('Devbug',-27.4697707,153.0251235,'8783 Schlimgen Terrace','Brisbane','Queensland','Australia',9010),
('Mudo',-33.8651294,151.2078882,'9722 Green Trail','Australia Square','New South Wales','Australia',1213),
('Zoomzone',-34.0349557,151.0998291,'13521 Scoville Street','Sydney','New South Wales','Australia',1028),
('Voolith',-33.7974423,151.2502275,'374 Lakewood Gardens Center','Sydney','New South Wales','Australia',1161),
('Quinu',-31.9478653,115.8693718,'159 Debra Point','Perth','Western Australia','Australia',6843),
('Quatz',-37.713929,144.962411,'2576 Westridge Terrace','Sydney','New South Wales','Australia',1120),
('Meevee',-37.7071402,144.9611223,'4362 School Road','Sydney','New South Wales','Australia',1206),
('Muxo',-38.043127,145.297768,'11134 Di Loreto Way','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Topicstorm',-33.7974423,151.2502275,'0 Muir Trail','Sydney','New South Wales','Australia',1134),
('Dabfeed',-34.990888,138.574391,'5 Meadow Valley Circle','Adelaide Mail Centre','South Australia','Australia',5869),
('Oodoo',-33.93274,151.188577,'70513 Rieder Avenue','Eastern Suburbs Mc','New South Wales','Australia',1325),
('JumpXS',-27.9424308,153.3970962,'893 Scoville Center','Sydney','New South Wales','Australia',1140),
('Cogidoo',-33.863927,151.201887,'48 Reinke Parkway','Sydney','New South Wales','Australia',1171),
('Janyx',-34.8352742,138.596204,'2974 Truax Alley','Northern Suburbs Mc','New South Wales','Australia',1694),
('Kwimbee',-37.713929,144.962411,'617 Sheridan Trail','Sydney','New South Wales','Australia',1120),
('Divanoodle',-41.4332215,147.1440875,'179 Killdeer Center','Launceston','Tasmania','Australia',7904),
('Yakitri',-38.043127,145.297768,'909 Novick Point','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Fivespan',-37.8136276,144.9630576,'77473 Artisan Street','Melbourne','Victoria','Australia',8045),
('Riffpath',-33.93274,151.188577,'15320 Charing Cross Way','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Fatz',-33.7974423,151.2502275,'58 Roth Trail','Sydney','New South Wales','Australia',1181),
('Livetube',-33.8989712,151.2149792,'2 Judy Alley','Sydney','New South Wales','Australia',1130),
('Skaboo',-27.9424308,153.3970962,'976 Moland Circle','Sydney','New South Wales','Australia',1140),
('Skinte',-33.863927,151.201887,'44 Anderson Point','Sydney','New South Wales','Australia',1171),
('Topdrive',-33.93274,151.188577,'32770 7th Pass','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Oyope',-31.9478653,115.8693718,'50868 Division Avenue','Perth','Western Australia','Australia',6843),
('Oyoloo',-33.93274,151.188577,'664 Raven Junction','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Meevee',-33.7974423,151.2502275,'65560 Pankratz Hill','Sydney','New South Wales','Australia',1161),
('Aimbo',-33.93274,151.188577,'9 Caliangt Drive','Eastern Suburbs Mc','New South Wales','Australia',1391),
('DabZ',-33.7974423,151.2502275,'36 Clemons Plaza','Sydney','New South Wales','Australia',1181),
('Zoovu',-42.8821377,147.3271949,'6785 Shoshone Center','Hobart','Tasmania','Australia',7803),
('Photospace',-33.8989712,151.2149792,'522 Kingsford Parkway','Sydney','New South Wales','Australia',1130),
('Geba',-33.8882671,151.2078465,'128 Hovde Circle','Strawberry Hills','New South Wales','Australia',1424),
('Skivee',-33.7974423,151.2502275,'6086 Blaine Pass','Sydney','New South Wales','Australia',1161),
('Rhyloo',-34.0349557,151.0998291,'63 Laurel Park','Sydney','New South Wales','Australia',1028),
('Muxo',-41.4332215,147.1440875,'1800 Arapahoe Crossing','Launceston','Tasmania','Australia',7916),
('Zoozzy',-41.4332215,147.1440875,'79759 Buell Street','Launceston','Tasmania','Australia',7916),
('Yakijo',-38.043127,145.297768,'6 Elmside Trail','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Youfeed',-37.8136276,144.9630576,'46 Crest Line Plaza','Melbourne','Victoria','Australia',8383),
('Divape',-27.4697707,153.0251235,'8780 Havey Junction','Brisbane','Queensland','Australia',9010),
('Browseblab',-27.9424308,153.3970962,'508 Havey Way','Sydney','New South Wales','Australia',1140),
('Talane',-42.8821377,147.3271949,'1 Hudson Park','Hobart','Tasmania','Australia',7803),
('Yamia',-27.4697707,153.0251235,'8669 Coolidge Road','Brisbane','Queensland','Australia',9010),
('Skivee',-42.8821377,147.3271949,'04584 Fuller Drive','Hobart','Tasmania','Australia',7803),
('Skynoodle',-33.8688197,151.2092955,'795 Elka Junction','Sydney South','New South Wales','Australia',1235),
('Skinix',-37.7204693,144.9629556,'336 Annamark Center','Sydney','New South Wales','Australia',1109),
('Skinte',-34.0349557,151.0998291,'305 Vermont Pass','Sydney','New South Wales','Australia',1028),
('Mybuzz',-33.7974423,151.2502275,'68844 Glacier Hill Avenue','Sydney','New South Wales','Australia',1161),
('Browsecat',-37.8136276,144.9630576,'4487 Ridgeway Parkway','Melbourne','Victoria','Australia',8045),
('Thoughtstorm',-33.7974423,151.2502275,'4 Norway Maple Court','Sydney','New South Wales','Australia',1134),
('Trudoo',-33.8688197,151.2092955,'4604 Milwaukee Way','Sydney','New South Wales','Australia',1033),
('Kazu',-37.7236851,144.9633285,'3648 Anhalt Crossing','Sydney','New South Wales','Australia',1009),
('Voonder',-37.713929,144.962411,'41 Florence Point','Sydney','New South Wales','Australia',1120),
('Dynazzy',-33.7974423,151.2502275,'40982 Loftsgordon Drive','Sydney','New South Wales','Australia',1134),
('Devcast',-41.4332215,147.1440875,'7 North Hill','Launceston','Tasmania','Australia',7916),
('Pixonyx',-41.4332215,147.1440875,'6 Shopko Avenue','Launceston','Tasmania','Australia',7904),
('Meemm',-37.7204693,144.9629556,'46907 Michigan Hill','Sydney','New South Wales','Australia',1109),
('Quimm',-37.7236851,144.9633285,'7366 Utah Point','Sydney','New South Wales','Australia',1009),
('Tagchat',-42.8821377,147.3271949,'3074 Glendale Circle','Hobart','Tasmania','Australia',7808),
('Voonder',-33.7974423,151.2502275,'36925 Clarendon Place','Sydney','New South Wales','Australia',1191),
('Kwideo',-33.8688197,151.2092955,'76 Eggendart Hill','Sydney South','New South Wales','Australia',1235),
('Katz',-33.8882671,151.2078465,'153 Lerdahl Plaza','Strawberry Hills','New South Wales','Australia',1424),
('Rhynyx',-34.8352742,138.596204,'465 Tony Lane','Northern Suburbs Mc','New South Wales','Australia',1694),
('Topicstorm',-31.9505269,115.8604572,'2972 Straubel Hill','Perth','Western Australia','Australia',6817),
('Dazzlesphere',-34.9284989,138.6007456,'79 Laurel Drive','Adelaide','South Australia','Australia',5839),
('Wikizz',-31.9478653,115.8693718,'8 Esker Point','Perth','Western Australia','Australia',6843),
('Thoughtbridge',-33.8688197,151.2092955,'944 Jenifer Pass','Sydney South','New South Wales','Australia',1235),
('Tagfeed',-37.7071402,144.9611223,'510 Morning Junction','Sydney','New South Wales','Australia',1206),
('Fliptune',-33.93274,151.188577,'45820 International Crossing','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Shuffledrive',-27.9424308,153.3970962,'25320 Lunder Circle','Sydney','New South Wales','Australia',1140),
('Blogspan',-33.7974423,151.2502275,'5980 Shasta Street','Sydney','New South Wales','Australia',1134),
('Zazio',-33.8882671,151.2078465,'83812 Steensland Way','Strawberry Hills','New South Wales','Australia',1424),
('Realbridge',-31.9478653,115.8693718,'776 Lerdahl Way','Perth','Western Australia','Australia',6843),
('Cogidoo',-34.9284989,138.6007456,'08 Victoria Lane','Adelaide','South Australia','Australia',5839),
('Skalith',-34.0349557,151.0998291,'04332 Forest Terrace','Sydney','New South Wales','Australia',1028),
('Feedspan',-34.8352742,138.596204,'3557 Tennyson Way','Northern Suburbs Mc','New South Wales','Australia',1694),
('Twitterbridge',-33.7974423,151.2502275,'33309 Buhler Place','Sydney','New South Wales','Australia',1161),
('Skimia',-33.93274,151.188577,'734 Meadow Ridge Drive','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Meejo',-33.8651294,151.2078882,'59 Kenwood Pass','Australia Square','New South Wales','Australia',1213),
('Youspan',-37.8136276,144.9630576,'3763 Clemons Terrace','Melbourne','Victoria','Australia',8383),
('Tagchat',-41.4332215,147.1440875,'29 Gulseth Center','Launceston','Tasmania','Australia',7916),
('Feednation',-34.8352742,138.596204,'4 Sage Trail','Northern Suburbs Mc','New South Wales','Australia',1694),
('Agimba',-33.8989712,151.2149792,'2276 Havey Alley','Sydney','New South Wales','Australia',1130),
('Ailane',-33.93274,151.188577,'36 Dunning Alley','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Jabberbean',-37.7236851,144.9633285,'530 Barnett Street','Sydney','New South Wales','Australia',1009),
('Yambee',-34.8352742,138.596204,'12 Eagle Crest Street','Northern Suburbs Mc','New South Wales','Australia',1694),
('Fatz',-33.93274,151.188577,'3138 Dapin Point','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Plambee',-34.9284989,138.6007456,'04140 Eggendart Point','Adelaide','South Australia','Australia',5839),
('Oloo',-33.7974423,151.2502275,'9 David Junction','Sydney','New South Wales','Australia',1181),
('Shufflester',-33.8688197,151.2092955,'7 Artisan Terrace','Sydney','New South Wales','Australia',1043),
('Zoozzy',-27.4697707,153.0251235,'0943 Melvin Avenue','Brisbane','Queensland','Australia',9010),
('Jaxworks',-27.4697707,153.0251235,'95187 Amoth Terrace','Brisbane','Queensland','Australia',9010),
('Browsedrive',-31.9505269,115.8604572,'2 Reinke Pass','Perth','Western Australia','Australia',6817),
('Flashspan',-33.7974423,151.2502275,'03322 Lake View Avenue','Sydney','New South Wales','Australia',1181),
('Centizu',-37.7071402,144.9611223,'3 Crownhardt Lane','Sydney','New South Wales','Australia',1206),
('Dabvine',-42.8821377,147.3271949,'54 Tennyson Plaza','Hobart','Tasmania','Australia',7808),
('Voolith',-34.0349557,151.0998291,'099 Summit Trail','Sydney','New South Wales','Australia',1028),
('Shuffledrive',-33.8882671,151.2078465,'0652 Bashford Alley','Strawberry Hills','New South Wales','Australia',1424),
('Flashpoint',-27.4697707,153.0251235,'9 Crescent Oaks Trail','Brisbane','Queensland','Australia',9010),
('LiveZ',-27.4697707,153.0251235,'85429 Dakota Park','Brisbane','Queensland','Australia',9010),
('Jetwire',-33.7974423,151.2502275,'4 Ronald Regan Road','Sydney','New South Wales','Australia',1191),
('Agivu',-33.8651294,151.2078882,'6 Union Way','Australia Square','New South Wales','Australia',1213),
('Flashset',-42.8821377,147.3271949,'5 Ridgeview Park','Hobart','Tasmania','Australia',7803),
('Yakitri',-31.9478653,115.8693718,'5857 Stone Corner Junction','Perth','Western Australia','Australia',6843),
('Quaxo',-37.7071402,144.9611223,'201 Weeping Birch Street','Sydney','New South Wales','Australia',1206),
('Gabvine',-31.9478653,115.8693718,'5 Utah Center','Perth','Western Australia','Australia',6843),
('Skinix',-42.8821377,147.3271949,'8631 Alpine Place','Hobart','Tasmania','Australia',7803),
('Roomm',-42.8821377,147.3271949,'3 Tennyson Center','Hobart','Tasmania','Australia',7803),
('Einti',-27.4697707,153.0251235,'73 Fulton Street','Brisbane','Queensland','Australia',9010),
('Realbuzz',-33.7974423,151.2502275,'84 Old Shore Junction','Sydney','New South Wales','Australia',1161),
('Oyonder',-34.9284989,138.6007456,'859 Carioca Trail','Adelaide','South Australia','Australia',5839),
('Yadel',-33.8651294,151.2078882,'308 Talisman Lane','Australia Square','New South Wales','Australia',1213),
('Janyx',-34.990888,138.574391,'41 Barnett Avenue','Adelaide Mail Centre','South Australia','Australia',5874),
('Mydeo',-42.8821377,147.3271949,'3 Ridgeview Place','Hobart','Tasmania','Australia',7803),
('Skinte',-34.990888,138.574391,'6194 Tennyson Center','Adelaide Mail Centre','South Australia','Australia',5889),
('Voonix',-33.8882671,151.2078465,'3830 Lukken Way','Strawberry Hills','New South Wales','Australia',1424),
('Skivee',-34.990888,138.574391,'665 Bartelt Trail','Adelaide Mail Centre','South Australia','Australia',5899),
('Edgeclub',-34.990888,138.574391,'74 Porter Lane','Adelaide Mail Centre','South Australia','Australia',5889),
('Wordware',-42.8821377,147.3271949,'6 Messerschmidt Drive','Hobart','Tasmania','Australia',7808),
('Rooxo',-33.7974423,151.2502275,'969 Starling Road','Sydney','New South Wales','Australia',1191),
('Jaxspan',-33.8688197,151.2092955,'31 Banding Pass','Sydney','New South Wales','Australia',1033),
('Photobean',-41.4332215,147.1440875,'01 Clemons Parkway','Launceston','Tasmania','Australia',7904),
('Jazzy',-33.7974423,151.2502275,'5 Old Gate Pass','Sydney','New South Wales','Australia',1196),
('Realbridge',-31.9478653,115.8693718,'00 Algoma Plaza','Perth','Western Australia','Australia',6843),
('Dynabox',-41.4332215,147.1440875,'7253 Meadow Ridge Pass','Launceston','Tasmania','Australia',7916),
('Voomm',-34.9284989,138.6007456,'29 Spohn Hill','Adelaide','South Australia','Australia',5839),
('Flashset',-34.8352742,138.596204,'031 Beilfuss Center','Northern Suburbs Mc','New South Wales','Australia',1694),
('Divanoodle',-34.9284989,138.6007456,'104 Kropf Place','Adelaide','South Australia','Australia',5839),
('Shufflester',-31.9505269,115.8604572,'0 Shelley Parkway','Perth','Western Australia','Australia',6817),
('Eidel',-33.8688197,151.2092955,'378 Caliangt Center','Sydney','New South Wales','Australia',1033),
('Twitterlist',-42.8821377,147.3271949,'39517 Erie Center','Hobart','Tasmania','Australia',7808),
('Mudo',-42.8821377,147.3271949,'240 Roxbury Alley','Hobart','Tasmania','Australia',7808),
('Jabbercube',-33.8688197,151.2092955,'38 Havey Place','Sydney','New South Wales','Australia',1033),
('Mydeo',-34.9284989,138.6007456,'41 Ramsey Court','Adelaide','South Australia','Australia',5839),
('Kanoodle',-33.7974423,151.2502275,'928 International Street','Sydney','New South Wales','Australia',1181),
('Browsebug',-37.7236851,144.9633285,'52 Sherman Hill','Sydney','New South Wales','Australia',1009),
('Thoughtstorm',-34.0349557,151.0998291,'36 Scott Point','Sydney','New South Wales','Australia',1028),
('Kwinu',-33.8688197,151.2092955,'09 Summer Ridge Road','Sydney South','New South Wales','Australia',1235),
('Skinix',-37.7071402,144.9611223,'9 Pawling Avenue','Sydney','New South Wales','Australia',1206),
('Dynabox',-33.7974423,151.2502275,'85788 Graceland Point','Sydney','New South Wales','Australia',1181),
('Kazu',-33.7974423,151.2502275,'17 Westport Park','Sydney','New South Wales','Australia',1196),
('Voonyx',-34.0349557,151.0998291,'8 Lotheville Parkway','Sydney','New South Wales','Australia',1028),
('Vitz',-31.9505269,115.8604572,'7 Ilene Alley','Perth','Western Australia','Australia',6817),
('Wikido',-33.8989712,151.2149792,'040 Becker Terrace','Sydney','New South Wales','Australia',1130),
('Oodoo',-33.7974423,151.2502275,'931 Nevada Lane','Sydney','New South Wales','Australia',1161),
('Npath',-37.7236851,144.9633285,'3 Ridgeview Circle','Sydney','New South Wales','Australia',1009),
('Dynava',-33.8651294,151.2078882,'13 Huxley Avenue','Australia Square','New South Wales','Australia',1213),
('Browsezoom',-33.7974423,151.2502275,'18 Old Gate Trail','Sydney','New South Wales','Australia',1196),
('Plambee',-37.7204693,144.9629556,'69480 Springs Crossing','Sydney','New South Wales','Australia',1109),
('Aimbu',-42.8821377,147.3271949,'87663 Mcbride Junction','Hobart','Tasmania','Australia',7808),
('Minyx',-37.7204693,144.9629556,'306 Clove Park','Sydney','New South Wales','Australia',1109),
('Aimbo',-41.4332215,147.1440875,'0 Harbort Alley','Launceston','Tasmania','Australia',7904),
('Jabbersphere',-33.8651294,151.2078882,'546 Mccormick Street','Australia Square','New South Wales','Australia',1213),
('Twitterlist',-37.7204693,144.9629556,'941 Knutson Circle','Sydney','New South Wales','Australia',1109),
('JumpXS',-33.8882671,151.2078465,'6 Forest Run Terrace','Strawberry Hills','New South Wales','Australia',1424),
('Voomm',-34.9284989,138.6007456,'99591 Sycamore Trail','Adelaide','South Australia','Australia',5839),
('Quinu',-33.7974423,151.2502275,'7 Norway Maple Road','Sydney','New South Wales','Australia',1196),
('Flipbug',-33.863927,151.201887,'3123 Lunder Avenue','Sydney','New South Wales','Australia',1171),
('Ozu',-37.7204693,144.9629556,'307 Cascade Park','Sydney','New South Wales','Australia',1109),
('Trunyx',-33.8688197,151.2092955,'74 Stuart Crossing','Sydney South','New South Wales','Australia',1235),
('Feedfish',-34.990888,138.574391,'3 3rd Drive','Adelaide Mail Centre','South Australia','Australia',5874),
('Gabtype',-33.8688197,151.2092955,'729 Lake View Trail','Sydney','New South Wales','Australia',1033),
('Pixonyx',-33.8688197,151.2092955,'7 Northfield Alley','Sydney','New South Wales','Australia',1043),
('Snaptags',-33.8882671,151.2078465,'0 Bellgrove Plaza','Strawberry Hills','New South Wales','Australia',1424),
('Flashpoint',-33.8989712,151.2149792,'20939 Algoma Crossing','Sydney','New South Wales','Australia',1130),
('Zoovu',-27.4697707,153.0251235,'58 Hooker Trail','Brisbane','Queensland','Australia',9010),
('Yodoo',-33.93274,151.188577,'90 South Place','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Trupe',-33.863927,151.201887,'88465 Maywood Parkway','Sydney','New South Wales','Australia',1171),
('Photobug',-42.8821377,147.3271949,'74189 Del Sol Center','Hobart','Tasmania','Australia',7803),
('Meetz',-33.93274,151.188577,'51 Swallow Alley','Eastern Suburbs Mc','New South Wales','Australia',1391),
('Youspan',-33.8688197,151.2092955,'655 Pierstorff Point','Sydney South','New South Wales','Australia',1235),
('Trudoo',-33.7974423,151.2502275,'312 Hollow Ridge Alley','Sydney','New South Wales','Australia',1161),
('Devbug',-41.4332215,147.1440875,'63958 Bartillon Plaza','Launceston','Tasmania','Australia',7904),
('Skimia',-34.9284989,138.6007456,'87284 Dryden Avenue','Adelaide','South Australia','Australia',5839),
('Voolith',-38.043127,145.297768,'90 Del Sol Circle','Eastern Suburbs Mc','New South Wales','Australia',1315),
('Wikibox',-33.7974423,151.2502275,'3689 Holmberg Circle','Sydney','New South Wales','Australia',1191),
('Voolia',-33.7974423,151.2502275,'1 Sullivan Plaza','Sydney','New South Wales','Australia',1181),
('Blogpad',-33.863927,151.201887,'18085 Di Loreto Avenue','Sydney','New South Wales','Australia',1171),
('Npath',-33.8882671,151.2078465,'663 Charing Cross Hill','Strawberry Hills','New South Wales','Australia',1424),
('Gabcube',-37.7071402,144.9611223,'71 Laurel Avenue','Sydney','New South Wales','Australia',1206),
('Jaxspan',-27.4697707,153.0251235,'76 Novick Hill','Brisbane','Queensland','Australia',9010),
('Dablist',-27.4697707,153.0251235,'5942 Surrey Plaza','Brisbane','Queensland','Australia',9010),
('Chatterbridge',-33.7974423,151.2502275,'0 Meadow Vale Drive','Sydney','New South Wales','Australia',1196),
('Oyope',-33.863927,151.201887,'00806 Haas Place','Sydney','New South Wales','Australia',1171),
('Agimba',-37.713929,144.962411,'50386 Sullivan Terrace','Sydney','New South Wales','Australia',1120),
('Agivu',-34.9284989,138.6007456,'27471 Mandrake Avenue','Adelaide','South Australia','Australia',5839),
('Babbleblab',-33.863927,151.201887,'65034 Homewood Street','Sydney','New South Wales','Australia',1171),
('Twitterworks',-41.4332215,147.1440875,'76273 Goodland Lane','Launceston','Tasmania','Australia',7904),
('Dynazzy',-37.8136276,144.9630576,'46 High Crossing Crossing','Melbourne','Victoria','Australia',8045),
('Twimm',-34.8352742,138.596204,'6 Pond Avenue','Northern Suburbs Mc','New South Wales','Australia',1694),
('Zoomcast',-33.7974423,151.2502275,'252 8th Plaza','Sydney','New South Wales','Australia',1161),
('Skynoodle',-33.93274,151.188577,'3 Valley Edge Point','Eastern Suburbs Mc','New South Wales','Australia',1325),
('Dynabox',-37.7071402,144.9611223,'437 Rutledge Hill','Sydney','New South Wales','Australia',1206);

insert into customer (first_name,last_name,email) VALUES ('Zorine','Hucquart','zhucquart0@g.co');
insert into customer (first_name,last_name,email) VALUES ('Allard','Sheringham','asheringham1@accuweather.com');
insert into customer (first_name,last_name,email) VALUES ('Oliy','Josse','ojosse2@skype.com');
insert into customer (first_name,last_name,email) VALUES ('Christye','Gilvear','cgilvear3@oaic.gov.au');
insert into customer (first_name,last_name,email) VALUES ('Novelia','Maulden','nmaulden4@weebly.com');
insert into customer (first_name,last_name,email) VALUES ('Mendy','Charlwood','mcharlwood5@comcast.net');
insert into customer (first_name,last_name,email) VALUES ('Teodorico','Arkin','tarkin6@biglobe.ne.jp');
insert into customer (first_name,last_name,email) VALUES ('Arney','Rickis','arickis7@xrea.com');
insert into customer (first_name,last_name,email) VALUES ('Karlik','OBradain','kobradain8@shareasale.com');
insert into customer (first_name,last_name,email) VALUES ('Jonis','Dullingham','jdullingham9@joomla.org');
insert into customer (first_name,last_name,email) VALUES ('Cassondra','Notti','cnottia@deviantart.com');
insert into customer (first_name,last_name,email) VALUES ('Torrin','Triggol','ttriggolb@google.com.au');
insert into customer (first_name,last_name,email) VALUES ('Husain','Sussams','hsussamsc@themeforest.net');
insert into customer (first_name,last_name,email) VALUES ('Kimball','Eastup','keastupd@imgur.com');
insert into customer (first_name,last_name,email) VALUES ('Aileen','Schruyers','aschruyerse@storify.com');
insert into customer (first_name,last_name,email) VALUES ('Karyn','Urvoy','kurvoyf@rambler.ru');
insert into customer (first_name,last_name,email) VALUES ('Wandie','Blundel','wblundelg@businessinsider.com');
insert into customer (first_name,last_name,email) VALUES ('Dame','Cud','dcudh@dmoz.org');
insert into customer (first_name,last_name,email) VALUES ('Ardisj','Prestner','aprestneri@redcross.org');
insert into customer (first_name,last_name,email) VALUES ('Westley','Evett','wevettj@miitbeian.gov.cn');
insert into customer (first_name,last_name,email) VALUES ('Hallie','Jiruch','hjiruchk@sphinn.com');
insert into customer (first_name,last_name,email) VALUES ('Anselm','Bockmaster','abockmasterl@dion.ne.jp');
insert into customer (first_name,last_name,email) VALUES ('Raynell','Ormistone','rormistonem@yahoo.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Starr','Blackbrough','sblackbroughn@wunderground.com');
insert into customer (first_name,last_name,email) VALUES ('Edan','Traynor','etraynoro@yahoo.com');
insert into customer (first_name,last_name,email) VALUES ('Erminie','Narbett','enarbettp@printfriendly.com');
insert into customer (first_name,last_name,email) VALUES ('Yvon','Stoaks','ystoaksq@aboutads.info');
insert into customer (first_name,last_name,email) VALUES ('Galvin','Gaudin','ggaudinr@intel.com');
insert into customer (first_name,last_name,email) VALUES ('Ethelbert','Clere','ecleres@salon.com');
insert into customer (first_name,last_name,email) VALUES ('Cristie','Margeram','cmargeramt@miibeian.gov.cn');
insert into customer (first_name,last_name,email) VALUES ('Libbi','Simmonite','lsimmoniteu@si.edu');
insert into customer (first_name,last_name,email) VALUES ('Sargent','Baudry','sbaudryv@slashdot.org');
insert into customer (first_name,last_name,email) VALUES ('Arleen','Lazar','alazarw@washington.edu');
insert into customer (first_name,last_name,email) VALUES ('Blane','Hinzer','bhinzerx@wix.com');
insert into customer (first_name,last_name,email) VALUES ('Vanni','Gowling','vgowlingy@si.edu');
insert into customer (first_name,last_name,email) VALUES ('Veronika','Hatherley','vhatherleyz@biblegateway.com');
insert into customer (first_name,last_name,email) VALUES ('Lazar','Sidwell','lsidwell10@devhub.com');
insert into customer (first_name,last_name,email) VALUES ('Delcina','Gyrgorcewicx','dgyrgorcewicx11@skype.com');
insert into customer (first_name,last_name,email) VALUES ('Blayne','Klouz','bklouz12@comcast.net');
insert into customer (first_name,last_name,email) VALUES ('Jacquenette','Brastead','jbrastead13@noaa.gov');
insert into customer (first_name,last_name,email) VALUES ('Eveline','Domengue','edomengue14@plala.or.jp');
insert into customer (first_name,last_name,email) VALUES ('Mikey','Thornthwaite','mthornthwaite15@ca.gov');
insert into customer (first_name,last_name,email) VALUES ('Alleyn','Gartsyde','agartsyde16@freewebs.com');
insert into customer (first_name,last_name,email) VALUES ('Hy','Tuttle','htuttle17@cafepress.com');
insert into customer (first_name,last_name,email) VALUES ('Sherwood','Ivanchov','sivanchov18@wsj.com');
insert into customer (first_name,last_name,email) VALUES ('Sergei','Sporgeon','ssporgeon19@jiathis.com');
insert into customer (first_name,last_name,email) VALUES ('Nicolas','De Freyne','ndefreyne1a@psu.edu');
insert into customer (first_name,last_name,email) VALUES ('Madalyn','Sherry','msherry1b@google.com.au');
insert into customer (first_name,last_name,email) VALUES ('Rozele','Kollasch','rkollasch1c@nhs.uk');
insert into customer (first_name,last_name,email) VALUES ('Odetta','Petrak','opetrak1d@google.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Jaye','Garmans','jgarmans1e@blogtalkradio.com');
insert into customer (first_name,last_name,email) VALUES ('Tamqrah','Suffe','tsuffe1f@gmpg.org');
insert into customer (first_name,last_name,email) VALUES ('Nathanael','Gostall','ngostall1g@ucla.edu');
insert into customer (first_name,last_name,email) VALUES ('Heida','Gelletly','hgelletly1h@netscape.com');
insert into customer (first_name,last_name,email) VALUES ('Gweneth','Denham','gdenham1i@facebook.com');
insert into customer (first_name,last_name,email) VALUES ('Janot','Stephen','jstephen1j@photobucket.com');
insert into customer (first_name,last_name,email) VALUES ('Case','Ramme','cramme1k@opera.com');
insert into customer (first_name,last_name,email) VALUES ('Sigismund','Richie','srichie1l@who.int');
insert into customer (first_name,last_name,email) VALUES ('Brook','Rockell','brockell1m@slate.com');
insert into customer (first_name,last_name,email) VALUES ('Christine','Stenners','cstenners1n@reference.com');
insert into customer (first_name,last_name,email) VALUES ('Maurise','Ducaen','mducaen1o@altervista.org');
insert into customer (first_name,last_name,email) VALUES ('Chance','Dragge','cdragge1p@twitpic.com');
insert into customer (first_name,last_name,email) VALUES ('Codie','Hallowes','challowes1q@joomla.org');
insert into customer (first_name,last_name,email) VALUES ('Izak','Annwyl','iannwyl1r@infoseek.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Dory','Tapton','dtapton1s@marketwatch.com');
insert into customer (first_name,last_name,email) VALUES ('Matthiew','Froom','mfroom1t@auda.org.au');
insert into customer (first_name,last_name,email) VALUES ('Drud','Pridding','dpridding1u@chron.com');
insert into customer (first_name,last_name,email) VALUES ('Valentin','Nesbeth','vnesbeth1v@ox.ac.uk');
insert into customer (first_name,last_name,email) VALUES ('Bartolemo','Davall','bdavall1w@dell.com');
insert into customer (first_name,last_name,email) VALUES ('Kittie','Kennealy','kkennealy1x@youtube.com');
insert into customer (first_name,last_name,email) VALUES ('Archy','Kitlee','akitlee1y@examiner.com');
insert into customer (first_name,last_name,email) VALUES ('Archaimbaud','Kringe','akringe1z@census.gov');
insert into customer (first_name,last_name,email) VALUES ('Barton','Philliphs','bphilliphs20@live.com');
insert into customer (first_name,last_name,email) VALUES ('Bette-ann','Jaukovic','bjaukovic21@sbwire.com');
insert into customer (first_name,last_name,email) VALUES ('Ethelyn','Debling','edebling22@arstechnica.com');
insert into customer (first_name,last_name,email) VALUES ('Theodoric','Junifer','tjunifer23@multiply.com');
insert into customer (first_name,last_name,email) VALUES ('Hyacinthia','Elvidge','helvidge24@nyu.edu');
insert into customer (first_name,last_name,email) VALUES ('Alyda','Roglieri','aroglieri25@cloudflare.com');
insert into customer (first_name,last_name,email) VALUES ('Lin','Mc Corley','lmccorley26@behance.net');
insert into customer (first_name,last_name,email) VALUES ('Evered','Gath','egath27@elpais.com');
insert into customer (first_name,last_name,email) VALUES ('Cristal','Jaume','cjaume28@plala.or.jp');
insert into customer (first_name,last_name,email) VALUES ('Xenia','Ivanyukov','xivanyukov29@163.com');
insert into customer (first_name,last_name,email) VALUES ('Ivett','Ripping','iripping2a@typepad.com');
insert into customer (first_name,last_name,email) VALUES ('Inna','Skerratt','iskerratt2b@addthis.com');
insert into customer (first_name,last_name,email) VALUES ('Olympia','Simioli','osimioli2c@huffingtonpost.com');
insert into customer (first_name,last_name,email) VALUES ('Ernesto','Gatfield','egatfield2d@ucoz.ru');
insert into customer (first_name,last_name,email) VALUES ('Ebonee','Cockitt','ecockitt2e@photobucket.com');
insert into customer (first_name,last_name,email) VALUES ('Lou','Pitkethly','lpitkethly2f@noaa.gov');
insert into customer (first_name,last_name,email) VALUES ('Olin','Le Grand','olegrand2g@amazonaws.com');
insert into customer (first_name,last_name,email) VALUES ('Aline','Arnaez','aarnaez2h@nifty.com');
insert into customer (first_name,last_name,email) VALUES ('Zandra','Cleveland','zcleveland2i@booking.com');
insert into customer (first_name,last_name,email) VALUES ('Heath','Dingivan','hdingivan2j@illinois.edu');
insert into customer (first_name,last_name,email) VALUES ('Harriette','Flaherty','hflaherty2k@ft.com');
insert into customer (first_name,last_name,email) VALUES ('Holden','Birdwistle','hbirdwistle2l@cam.ac.uk');
insert into customer (first_name,last_name,email) VALUES ('Laurie','Hanstock','lhanstock2m@freewebs.com');
insert into customer (first_name,last_name,email) VALUES ('Cassondra','Rozanski','crozanski2n@statcounter.com');
insert into customer (first_name,last_name,email) VALUES ('Fairfax','Iacovielli','fiacovielli2o@4shared.com');
insert into customer (first_name,last_name,email) VALUES ('Britteny','Taunton','btaunton2p@blog.com');
insert into customer (first_name,last_name,email) VALUES ('Porty','Cooksey','pcooksey2q@fda.gov');
insert into customer (first_name,last_name,email) VALUES ('Maiga','DAubney','mdaubney2r@zdnet.com');
insert into customer (first_name,last_name,email) VALUES ('Adel','MacCafferky','amaccafferky2s@fda.gov');
insert into customer (first_name,last_name,email) VALUES ('Nickie','Wynter','nwynter2t@wp.com');
insert into customer (first_name,last_name,email) VALUES ('Karoline','Donizeau','kdonizeau2u@reference.com');
insert into customer (first_name,last_name,email) VALUES ('Giralda','Alvaro','galvaro2v@illinois.edu');
insert into customer (first_name,last_name,email) VALUES ('Georgi','Rikkard','grikkard2w@fc2.com');
insert into customer (first_name,last_name,email) VALUES ('Jessalyn','Zuanazzi','jzuanazzi2x@washingtonpost.com');
insert into customer (first_name,last_name,email) VALUES ('Florinda','Posse','fposse2y@foxnews.com');
insert into customer (first_name,last_name,email) VALUES ('Leonie','Chalice','lchalice2z@census.gov');
insert into customer (first_name,last_name,email) VALUES ('Edsel','Tolworthie','etolworthie30@imageshack.us');
insert into customer (first_name,last_name,email) VALUES ('Kenyon','Greathead','kgreathead31@nifty.com');
insert into customer (first_name,last_name,email) VALUES ('Ingram','Sore','isore32@ask.com');
insert into customer (first_name,last_name,email) VALUES ('Chloris','Suddaby','csuddaby33@usgs.gov');
insert into customer (first_name,last_name,email) VALUES ('Issi','Lambert-Ciorwyn','ilambertciorwyn34@prnewswire.com');
insert into customer (first_name,last_name,email) VALUES ('Etienne','Carnall','ecarnall35@ebay.co.uk');
insert into customer (first_name,last_name,email) VALUES ('Trent','Anersen','tanersen36@webs.com');
insert into customer (first_name,last_name,email) VALUES ('Tootsie','Cheeke','tcheeke37@flickr.com');
insert into customer (first_name,last_name,email) VALUES ('Silvester','Goodram','sgoodram38@icio.us');
insert into customer (first_name,last_name,email) VALUES ('Babs','Choldcroft','bcholdcroft39@tumblr.com');
insert into customer (first_name,last_name,email) VALUES ('Lorrin','De Giovanni','ldegiovanni3a@wunderground.com');
insert into customer (first_name,last_name,email) VALUES ('Tina','Pridie','tpridie3b@ustream.tv');
insert into customer (first_name,last_name,email) VALUES ('Gwenore','Eadie','geadie3c@desdev.cn');
insert into customer (first_name,last_name,email) VALUES ('Jamal','Tranfield','jtranfield3d@eepurl.com');
insert into customer (first_name,last_name,email) VALUES ('Kirby','Scourfield','kscourfield3e@examiner.com');
insert into customer (first_name,last_name,email) VALUES ('Ramsay','Seakin','rseakin3f@sina.com.cn');
insert into customer (first_name,last_name,email) VALUES ('Minna','Niesegen','mniesegen3g@answers.com');
insert into customer (first_name,last_name,email) VALUES ('Guntar','Durn','gdurn3h@cbsnews.com');
insert into customer (first_name,last_name,email) VALUES ('Bobby','De Filippi','bdefilippi3i@spiegel.de');
insert into customer (first_name,last_name,email) VALUES ('Garwood','Burgiss','gburgiss3j@princeton.edu');
insert into customer (first_name,last_name,email) VALUES ('Imojean','Satchel','isatchel3k@webnode.com');
insert into customer (first_name,last_name,email) VALUES ('Jacklyn','Niblock','jniblock3l@simplemachines.org');
insert into customer (first_name,last_name,email) VALUES ('Vergil','Evill','vevill3m@smh.com.au');
insert into customer (first_name,last_name,email) VALUES ('Evelyn','Cowton','ecowton3n@oracle.com');
insert into customer (first_name,last_name,email) VALUES ('Philippe','Tidball','ptidball3o@blogtalkradio.com');
insert into customer (first_name,last_name,email) VALUES ('Daloris','Volks','dvolks3p@desdev.cn');
insert into customer (first_name,last_name,email) VALUES ('Gale','Philo','gphilo3q@reverbnation.com');
insert into customer (first_name,last_name,email) VALUES ('Fabiano','Fairney','ffairney3r@shareasale.com');
insert into customer (first_name,last_name,email) VALUES ('Kimmi','Guage','kguage3s@sciencedaily.com');
insert into customer (first_name,last_name,email) VALUES ('Marcile','Kornas','mkornas3t@time.com');
insert into customer (first_name,last_name,email) VALUES ('Base','Salazar','bsalazar3u@pagesperso-orange.fr');
insert into customer (first_name,last_name,email) VALUES ('La verne','Mollett','lmollett3v@printfriendly.com');
insert into customer (first_name,last_name,email) VALUES ('Auguste','MacAllaster','amacallaster3w@foxnews.com');
insert into customer (first_name,last_name,email) VALUES ('George','Camden','gcamden3x@abc.net.au');
insert into customer (first_name,last_name,email) VALUES ('Valentine','Belvin','vbelvin3y@patch.com');
insert into customer (first_name,last_name,email) VALUES ('Marv','Nashe','mnashe3z@redcross.org');
insert into customer (first_name,last_name,email) VALUES ('Jasun','Mitchenson','jmitchenson40@virginia.edu');
insert into customer (first_name,last_name,email) VALUES ('Phedra','Andreasen','pandreasen41@ycombinator.com');
insert into customer (first_name,last_name,email) VALUES ('Maynord','Danielsen','mdanielsen42@craigslist.org');
insert into customer (first_name,last_name,email) VALUES ('Wald','Purchall','wpurchall43@shareasale.com');
insert into customer (first_name,last_name,email) VALUES ('Brittan','Linger','blinger44@rediff.com');
insert into customer (first_name,last_name,email) VALUES ('Roseline','Gard','rgard45@thetimes.co.uk');
insert into customer (first_name,last_name,email) VALUES ('Normand','Laible','nlaible46@eepurl.com');
insert into customer (first_name,last_name,email) VALUES ('Gard','Blaxill','gblaxill47@weebly.com');
insert into customer (first_name,last_name,email) VALUES ('Pris','Beek','pbeek48@pinterest.com');
insert into customer (first_name,last_name,email) VALUES ('Merilee','Arkcoll','markcoll49@over-blog.com');
insert into customer (first_name,last_name,email) VALUES ('Rhianon','Bilbey','rbilbey4a@admin.ch');
insert into customer (first_name,last_name,email) VALUES ('Patric','Cumbes','pcumbes4b@about.com');
insert into customer (first_name,last_name,email) VALUES ('Dolly','Arrowsmith','darrowsmith4c@bluehost.com');
insert into customer (first_name,last_name,email) VALUES ('Corny','Tollmache','ctollmache4d@kickstarter.com');
insert into customer (first_name,last_name,email) VALUES ('Killy','Haskur','khaskur4e@issuu.com');
insert into customer (first_name,last_name,email) VALUES ('Kessiah','Domegan','kdomegan4f@senate.gov');
insert into customer (first_name,last_name,email) VALUES ('Jessamine','Leser','jleser4g@bloglines.com');
insert into customer (first_name,last_name,email) VALUES ('Brigit','Lingfoot','blingfoot4h@ycombinator.com');
insert into customer (first_name,last_name,email) VALUES ('Korrie','Lambird','klambird4i@meetup.com');
insert into customer (first_name,last_name,email) VALUES ('Matelda','Dillistone','mdillistone4j@cyberchimps.com');
insert into customer (first_name,last_name,email) VALUES ('Aubrey','Ewers','aewers4k@pen.io');
insert into customer (first_name,last_name,email) VALUES ('Dawna','Gwatkin','dgwatkin4l@bbc.co.uk');
insert into customer (first_name,last_name,email) VALUES ('Mia','Jillings','mjillings4m@earthlink.net');
insert into customer (first_name,last_name,email) VALUES ('Kasey','Liepina','kliepina4n@wufoo.com');
insert into customer (first_name,last_name,email) VALUES ('Luz','Langan','llangan4o@wikimedia.org');
insert into customer (first_name,last_name,email) VALUES ('Hillery','Roffey','hroffey4p@earthlink.net');
insert into customer (first_name,last_name,email) VALUES ('Delaney','Bentley','dbentley4q@squidoo.com');
insert into customer (first_name,last_name,email) VALUES ('Rosy','Stoeck','rstoeck4r@gmpg.org');
insert into customer (first_name,last_name,email) VALUES ('Ariel','Millin','amillin4s@google.nl');
insert into customer (first_name,last_name,email) VALUES ('Thorstein','Timberlake','ttimberlake4t@businesswire.com');
insert into customer (first_name,last_name,email) VALUES ('Lexine','De Freyne','ldefreyne4u@ow.ly');
insert into customer (first_name,last_name,email) VALUES ('Joyann','Alexsandrev','jalexsandrev4v@dropbox.com');
insert into customer (first_name,last_name,email) VALUES ('Lambert','Quarry','lquarry4w@google.com.au');
insert into customer (first_name,last_name,email) VALUES ('Virgie','Pennone','vpennone4x@altervista.org');
insert into customer (first_name,last_name,email) VALUES ('Celestine','Ryall','cryall4y@gov.uk');
insert into customer (first_name,last_name,email) VALUES ('Ollie','Doudny','odoudny4z@1und1.de');
insert into customer (first_name,last_name,email) VALUES ('Ursa','Surgenor','usurgenor50@examiner.com');
insert into customer (first_name,last_name,email) VALUES ('Olenka','Lynock','olynock51@vkontakte.ru');
insert into customer (first_name,last_name,email) VALUES ('Derry','Kivelhan','dkivelhan52@reuters.com');
insert into customer (first_name,last_name,email) VALUES ('Inge','Kelling','ikelling53@flickr.com');
insert into customer (first_name,last_name,email) VALUES ('Ianthe','Cripps','icripps54@aol.com');
insert into customer (first_name,last_name,email) VALUES ('Anabelle','Mate','amate55@chicagotribune.com');
insert into customer (first_name,last_name,email) VALUES ('Simona','Littell','slittell56@t.co');
insert into customer (first_name,last_name,email) VALUES ('Thebault','Possek','tpossek57@bizjournals.com');
insert into customer (first_name,last_name,email) VALUES ('Fania','Kingsnorth','fkingsnorth58@goodreads.com');
insert into customer (first_name,last_name,email) VALUES ('Kile','Zammitt','kzammitt59@webs.com');
insert into customer (first_name,last_name,email) VALUES ('Addie','Jeakins','ajeakins5a@prnewswire.com');
insert into customer (first_name,last_name,email) VALUES ('Clayson','Huthart','chuthart5b@pinterest.com');
insert into customer (first_name,last_name,email) VALUES ('Lizzie','Joy','ljoy5c@ucoz.ru');
insert into customer (first_name,last_name,email) VALUES ('George','Guerner','gguerner5d@yahoo.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Karlene','Feldklein','kfeldklein5e@networksolutions.com');
insert into customer (first_name,last_name,email) VALUES ('Jarid','Doylend','jdoylend5f@merriam-webster.com');
insert into customer (first_name,last_name,email) VALUES ('Monica','Stephen','mstephen5g@instagram.com');
insert into customer (first_name,last_name,email) VALUES ('Drud','Tomes','dtomes5h@dagondesign.com');
insert into customer (first_name,last_name,email) VALUES ('Jeremias','McClurg','jmcclurg5i@ifeng.com');
insert into customer (first_name,last_name,email) VALUES ('Margaretha','Duffit','mduffit5j@illinois.edu');
insert into customer (first_name,last_name,email) VALUES ('Nissie','Vlies','nvlies5k@godaddy.com');
insert into customer (first_name,last_name,email) VALUES ('Keane','Kensit','kkensit5l@scientificamerican.com');
insert into customer (first_name,last_name,email) VALUES ('Lory','Nares','lnares5m@mapy.cz');
insert into customer (first_name,last_name,email) VALUES ('Gianni','Farmiloe','gfarmiloe5n@china.com.cn');
insert into customer (first_name,last_name,email) VALUES ('Jaclyn','Cook','jcook5o@businessweek.com');
insert into customer (first_name,last_name,email) VALUES ('Caitlin','Harp','charp5p@163.com');
insert into customer (first_name,last_name,email) VALUES ('Norbert','MacMichael','nmacmichael5q@mayoclinic.com');
insert into customer (first_name,last_name,email) VALUES ('Michelle','Plumstead','mplumstead5r@abc.net.au');
insert into customer (first_name,last_name,email) VALUES ('Rochette','Bach','rbach5s@oakley.com');
insert into customer (first_name,last_name,email) VALUES ('Krissie','Thirlwall','kthirlwall5t@usa.gov');
insert into customer (first_name,last_name,email) VALUES ('Shane','McHale','smchale5u@squarespace.com');
insert into customer (first_name,last_name,email) VALUES ('Bil','Freddi','bfreddi5v@ezinearticles.com');
insert into customer (first_name,last_name,email) VALUES ('Mel','Boyes','mboyes5w@china.com.cn');
insert into customer (first_name,last_name,email) VALUES ('Arne','Halt','ahalt5x@altervista.org');
insert into customer (first_name,last_name,email) VALUES ('Sherri','Bloxsum','sbloxsum5y@cbsnews.com');
insert into customer (first_name,last_name,email) VALUES ('Magda','Ziemecki','mziemecki5z@rakuten.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Melodee','Ponsford','mponsford60@surveymonkey.com');
insert into customer (first_name,last_name,email) VALUES ('Leonardo','Jumel','ljumel61@geocities.jp');
insert into customer (first_name,last_name,email) VALUES ('Sander','Fairbanks','sfairbanks62@sciencedirect.com');
insert into customer (first_name,last_name,email) VALUES ('Leonardo','Roubay','lroubay63@goo.ne.jp');
insert into customer (first_name,last_name,email) VALUES ('Quint','Gheeorghie','qgheeorghie64@barnesandnoble.com');
insert into customer (first_name,last_name,email) VALUES ('Perceval','Phelipeaux','pphelipeaux65@huffingtonpost.com');
insert into customer (first_name,last_name,email) VALUES ('Tedman','Auten','tauten66@engadget.com');
insert into customer (first_name,last_name,email) VALUES ('Meade','Grigoriscu','mgrigoriscu67@admin.ch');
insert into customer (first_name,last_name,email) VALUES ('Issiah','Older','iolder68@hexun.com');
insert into customer (first_name,last_name,email) VALUES ('Merrill','Bromont','mbromont69@mlb.com');
insert into customer (first_name,last_name,email) VALUES ('Rosemarie','Mournian','rmournian6a@timesonline.co.uk');
insert into customer (first_name,last_name,email) VALUES ('Carlynne','Greatland','cgreatland6b@vimeo.com');
insert into customer (first_name,last_name,email) VALUES ('Morry','di Rocca','mdirocca6c@nba.com');
insert into customer (first_name,last_name,email) VALUES ('Sarajane','Lanston','slanston6d@netscape.com');
insert into customer (first_name,last_name,email) VALUES ('Christian','Oseman','coseman6e@earthlink.net');
insert into customer (first_name,last_name,email) VALUES ('Prue','Blazdell','pblazdell6f@miitbeian.gov.cn');
insert into customer (first_name,last_name,email) VALUES ('Reginald','Hilldrup','rhilldrup6g@yahoo.com');
insert into customer (first_name,last_name,email) VALUES ('Morley','Meffin','mmeffin6h@unicef.org');
insert into customer (first_name,last_name,email) VALUES ('Lulu','McAvey','lmcavey6i@networksolutions.com');
insert into customer (first_name,last_name,email) VALUES ('Melodee','Pesik','mpesik6j@salon.com');
insert into customer (first_name,last_name,email) VALUES ('Tibold','Keyden','tkeyden6k@altervista.org');
insert into customer (first_name,last_name,email) VALUES ('Silvia','Conrart','sconrart6l@ehow.com');
insert into customer (first_name,last_name,email) VALUES ('Bent','Hassur','bhassur6m@yelp.com');
insert into customer (first_name,last_name,email) VALUES ('Emelita','Millan','emillan6n@cnbc.com');
insert into customer (first_name,last_name,email) VALUES ('Max','Howlin','mhowlin6o@about.me');
insert into customer (first_name,last_name,email) VALUES ('Patrick','Tokley','ptokley6p@uol.com.br');
insert into customer (first_name,last_name,email) VALUES ('Erhard','Sulter','esulter6q@psu.edu');
insert into customer (first_name,last_name,email) VALUES ('Jasun','Chasemore','jchasemore6r@china.com.cn');
insert into customer (first_name,last_name,email) VALUES ('Titos','Pawelec','tpawelec6s@wikimedia.org');
insert into customer (first_name,last_name,email) VALUES ('Mattie','Schruyer','mschruyer6t@nifty.com');
insert into customer (first_name,last_name,email) VALUES ('Judon','Belmont','jbelmont6u@vistaprint.com');
insert into customer (first_name,last_name,email) VALUES ('Lou','Trowill','ltrowill6v@cocolog-nifty.com');
insert into customer (first_name,last_name,email) VALUES ('Fritz','Yegorkin','fyegorkin6w@arstechnica.com');
insert into customer (first_name,last_name,email) VALUES ('Orelle','McKendry','omckendry6x@wikipedia.org');
insert into customer (first_name,last_name,email) VALUES ('Cybil','Trenchard','ctrenchard6y@cloudflare.com');
insert into customer (first_name,last_name,email) VALUES ('Janey','Lawling','jlawling6z@nps.gov');
insert into customer (first_name,last_name,email) VALUES ('Inglis','Bushby','ibushby70@google.de');
insert into customer (first_name,last_name,email) VALUES ('Belvia','Crocombe','bcrocombe71@foxnews.com');
insert into customer (first_name,last_name,email) VALUES ('Averill','Iapico','aiapico72@instagram.com');
insert into customer (first_name,last_name,email) VALUES ('Nannie','Corrin','ncorrin73@cornell.edu');
insert into customer (first_name,last_name,email) VALUES ('Megan','Click','mclick74@mac.com');
insert into customer (first_name,last_name,email) VALUES ('Jacquenette','Hodinton','jhodinton75@barnesandnoble.com');
insert into customer (first_name,last_name,email) VALUES ('Fifine','Rove','frove76@gnu.org');
insert into customer (first_name,last_name,email) VALUES ('Yelena','Grimsley','ygrimsley77@prlog.org');
insert into customer (first_name,last_name,email) VALUES ('Kele','Dunseith','kdunseith78@skype.com');
insert into customer (first_name,last_name,email) VALUES ('Federico','Woolhouse','fwoolhouse79@networkadvertising.org');
insert into customer (first_name,last_name,email) VALUES ('Micky','Attewill','mattewill7a@telegraph.co.uk');
insert into customer (first_name,last_name,email) VALUES ('Bethina','Way','bway7b@epa.gov');
insert into customer (first_name,last_name,email) VALUES ('Larisa','Shemmin','lshemmin7c@mapquest.com');
insert into customer (first_name,last_name,email) VALUES ('Bowie','Christescu','bchristescu7d@miitbeian.gov.cn');
insert into customer (first_name,last_name,email) VALUES ('Ashlee','Shuter','ashuter7e@vinaora.com');
insert into customer (first_name,last_name,email) VALUES ('Danit','Dyster','ddyster7f@businessweek.com');
insert into customer (first_name,last_name,email) VALUES ('Rudie','Gibbett','rgibbett7g@oaic.gov.au');
insert into customer (first_name,last_name,email) VALUES ('Ebenezer','Thomsson','ethomsson7h@scientificamerican.com');
insert into customer (first_name,last_name,email) VALUES ('Jervis','Witherdon','jwitherdon7i@mayoclinic.com');
insert into customer (first_name,last_name,email) VALUES ('Dunstan','Dadswell','ddadswell7j@dailymotion.com');
insert into customer (first_name,last_name,email) VALUES ('Egon','Chilton','echilton7k@nsw.gov.au');
insert into customer (first_name,last_name,email) VALUES ('Miriam','Deveril','mdeveril7l@cbsnews.com');
insert into customer (first_name,last_name,email) VALUES ('Madelina','Jancar','mjancar7m@sphinn.com');
insert into customer (first_name,last_name,email) VALUES ('Angel','Wilse','awilse7n@ibm.com');
insert into customer (first_name,last_name,email) VALUES ('Fawne','Gratton','fgratton7o@wikipedia.org');
insert into customer (first_name,last_name,email) VALUES ('Tanya','McDonnell','tmcdonnell7p@fema.gov');
insert into customer (first_name,last_name,email) VALUES ('Catrina','Curner','ccurner7q@nps.gov');
insert into customer (first_name,last_name,email) VALUES ('Giles','Binnes','gbinnes7r@redcross.org');
insert into customer (first_name,last_name,email) VALUES ('Katrina','Chandler','kchandler7s@soup.io');
insert into customer (first_name,last_name,email) VALUES ('Rickert','Insall','rinsall7t@1688.com');
insert into customer (first_name,last_name,email) VALUES ('Kareem','Temple','ktemple7u@unicef.org');
insert into customer (first_name,last_name,email) VALUES ('Baily','Petheridge','bpetheridge7v@ebay.com');
insert into customer (first_name,last_name,email) VALUES ('Amy','Roskelley','aroskelley7w@nifty.com');
insert into customer (first_name,last_name,email) VALUES ('Tobe','Andrysiak','tandrysiak7x@pagesperso-orange.fr');
insert into customer (first_name,last_name,email) VALUES ('Wainwright','Wasteney','wwasteney7y@prlog.org');
insert into customer (first_name,last_name,email) VALUES ('Husain','Halbeard','hhalbeard7z@mediafire.com');
insert into customer (first_name,last_name,email) VALUES ('Tobin','Yellowlee','tyellowlee80@tinyurl.com');
insert into customer (first_name,last_name,email) VALUES ('Marja','Elden','melden81@nih.gov');
insert into customer (first_name,last_name,email) VALUES ('Mallory','Cremer','mcremer82@jugem.jp');
insert into customer (first_name,last_name,email) VALUES ('Jewel','Skough','jskough83@zdnet.com');
insert into customer (first_name,last_name,email) VALUES ('Angie','Lawton','alawton84@ca.gov');
insert into customer (first_name,last_name,email) VALUES ('Wrennie','Davley','wdavley85@rambler.ru');
insert into customer (first_name,last_name,email) VALUES ('Thelma','Witherbed','twitherbed86@reuters.com');
insert into customer (first_name,last_name,email) VALUES ('Adel','Kenningham','akenningham87@de.vu');
insert into customer (first_name,last_name,email) VALUES ('Delmer','Whysall','dwhysall88@zdnet.com');
insert into customer (first_name,last_name,email) VALUES ('Meredeth','Devonside','mdevonside89@whitehouse.gov');
insert into customer (first_name,last_name,email) VALUES ('Kally','Andreix','kandreix8a@ca.gov');
insert into customer (first_name,last_name,email) VALUES ('Neddy','Aire','naire8b@lulu.com');
insert into customer (first_name,last_name,email) VALUES ('Collete','Cudbertson','ccudbertson8c@google.com.br');
insert into customer (first_name,last_name,email) VALUES ('Debi','Moran','dmoran8d@va.gov');
insert into customer (first_name,last_name,email) VALUES ('Jake','Leftbridge','jleftbridge8e@vimeo.com');
insert into customer (first_name,last_name,email) VALUES ('Dalila','Terbrug','dterbrug8f@cloudflare.com');
insert into customer (first_name,last_name,email) VALUES ('Kaitlynn','Giovanitti','kgiovanitti8g@lulu.com');
insert into customer (first_name,last_name,email) VALUES ('Augie','Gravie','agravie8h@homestead.com');
insert into customer (first_name,last_name,email) VALUES ('Morey','Poel','mpoel8i@yahoo.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Norman','Ghilks','nghilks8j@github.com');
insert into customer (first_name,last_name,email) VALUES ('Randell','Genney','rgenney8k@noaa.gov');
insert into customer (first_name,last_name,email) VALUES ('Mirella','Walder','mwalder8l@eventbrite.com');
insert into customer (first_name,last_name,email) VALUES ('Maurise','Marcoolyn','mmarcoolyn8m@biblegateway.com');
insert into customer (first_name,last_name,email) VALUES ('Edd','Ather','eather8n@businesswire.com');
insert into customer (first_name,last_name,email) VALUES ('Guenna','Crunkhurn','gcrunkhurn8o@theglobeandmail.com');
insert into customer (first_name,last_name,email) VALUES ('Haley','Going','hgoing8p@opensource.org');
insert into customer (first_name,last_name,email) VALUES ('Fianna','Spurge','fspurge8q@dropbox.com');
insert into customer (first_name,last_name,email) VALUES ('Petronille','Duddy','pduddy8r@google.com.hk');
insert into customer (first_name,last_name,email) VALUES ('Griselda','Bottomore','gbottomore8s@hubpages.com');
insert into customer (first_name,last_name,email) VALUES ('Milton','Winters','mwinters8t@comcast.net');
insert into customer (first_name,last_name,email) VALUES ('Marquita','Ilson','milson8u@businesswire.com');
insert into customer (first_name,last_name,email) VALUES ('Hubert','Kennicott','hkennicott8v@networksolutions.com');
insert into customer (first_name,last_name,email) VALUES ('Agneta','Hanrahan','ahanrahan8w@dell.com');
insert into customer (first_name,last_name,email) VALUES ('Tallie','Dyka','tdyka8x@whitehouse.gov');
insert into customer (first_name,last_name,email) VALUES ('Dale','McCrohon','dmccrohon8y@mediafire.com');
insert into customer (first_name,last_name,email) VALUES ('Hedy','Foulds','hfoulds8z@meetup.com');
insert into customer (first_name,last_name,email) VALUES ('Brnaba','Bentham','bbentham90@360.cn');
insert into customer (first_name,last_name,email) VALUES ('Sharline','Cheel','scheel91@dagondesign.com');
insert into customer (first_name,last_name,email) VALUES ('Adriena','Hugnot','ahugnot92@reuters.com');
insert into customer (first_name,last_name,email) VALUES ('Barnabe','Trunkfield','btrunkfield93@de.vu');
insert into customer (first_name,last_name,email) VALUES ('Georgy','OBrian','gobrian94@squidoo.com');
insert into customer (first_name,last_name,email) VALUES ('Brenden','Coffelt','bcoffelt95@themeforest.net');
insert into customer (first_name,last_name,email) VALUES ('Ole','Meharry','omeharry96@digg.com');
insert into customer (first_name,last_name,email) VALUES ('Pammie','Rawlins','prawlins97@mit.edu');
insert into customer (first_name,last_name,email) VALUES ('Payton','Josland','pjosland98@nature.com');
insert into customer (first_name,last_name,email) VALUES ('Jeramie','Tungay','jtungay99@ezinearticles.com');
insert into customer (first_name,last_name,email) VALUES ('Christiane','Mauro','cmauro9a@baidu.com');
insert into customer (first_name,last_name,email) VALUES ('Bernie','Marden','bmarden9b@addthis.com');
insert into customer (first_name,last_name,email) VALUES ('Rodrick','Riddle','rriddle9c@infoseek.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Agustin','Hendriksen','ahendriksen9d@ovh.net');
insert into customer (first_name,last_name,email) VALUES ('Freddy','Rendell','frendell9e@vkontakte.ru');
insert into customer (first_name,last_name,email) VALUES ('Peadar','Melonby','pmelonby9f@theguardian.com');
insert into customer (first_name,last_name,email) VALUES ('Burnard','Brownsill','bbrownsill9g@macromedia.com');
insert into customer (first_name,last_name,email) VALUES ('Gerry','Tanton','gtanton9h@php.net');
insert into customer (first_name,last_name,email) VALUES ('Leonid','Bampkin','lbampkin9i@sciencedaily.com');
insert into customer (first_name,last_name,email) VALUES ('Elisabeth','Kinny','ekinny9j@about.com');
insert into customer (first_name,last_name,email) VALUES ('Avictor','MacKey','amackey9k@goodreads.com');
insert into customer (first_name,last_name,email) VALUES ('Dilly','Magarrell','dmagarrell9l@fda.gov');
insert into customer (first_name,last_name,email) VALUES ('Olenolin','Berrie','oberrie9m@tripod.com');
insert into customer (first_name,last_name,email) VALUES ('Filide','Hakking','fhakking9n@pagesperso-orange.fr');
insert into customer (first_name,last_name,email) VALUES ('Felizio','Stiffkins','fstiffkins9o@hibu.com');
insert into customer (first_name,last_name,email) VALUES ('Sampson','Fittall','sfittall9p@nydailynews.com');
insert into customer (first_name,last_name,email) VALUES ('Dottie','Gammett','dgammett9q@vimeo.com');
insert into customer (first_name,last_name,email) VALUES ('Cairistiona','Bonsul','cbonsul9r@usda.gov');
insert into customer (first_name,last_name,email) VALUES ('Doe','Roelofsen','droelofsen9s@reverbnation.com');
insert into customer (first_name,last_name,email) VALUES ('Roi','Ellcome','rellcome9t@stumbleupon.com');
insert into customer (first_name,last_name,email) VALUES ('Byrle','Haibel','bhaibel9u@gnu.org');
insert into customer (first_name,last_name,email) VALUES ('Bentlee','Doghartie','bdoghartie9v@oaic.gov.au');
insert into customer (first_name,last_name,email) VALUES ('Nari','Giffaut','ngiffaut9w@tmall.com');
insert into customer (first_name,last_name,email) VALUES ('Miof mela','Eagle','meagle9x@i2i.jp');
insert into customer (first_name,last_name,email) VALUES ('Martin','Docharty','mdocharty9y@clickbank.net');
insert into customer (first_name,last_name,email) VALUES ('Nadeen','Clutram','nclutram9z@jugem.jp');
insert into customer (first_name,last_name,email) VALUES ('Ardelia','Van Giffen','avangiffena0@purevolume.com');
insert into customer (first_name,last_name,email) VALUES ('Drew','Arends','darendsa1@wikipedia.org');
insert into customer (first_name,last_name,email) VALUES ('Tallulah','Lowton','tlowtona2@pinterest.com');
insert into customer (first_name,last_name,email) VALUES ('Jay','Petren','jpetrena3@networkadvertising.org');
insert into customer (first_name,last_name,email) VALUES ('Pearline','Pues','ppuesa4@ustream.tv');
insert into customer (first_name,last_name,email) VALUES ('Raimundo','MacKerley','rmackerleya5@geocities.com');
insert into customer (first_name,last_name,email) VALUES ('Alfreda','Bebbington','abebbingtona6@nature.com');
insert into customer (first_name,last_name,email) VALUES ('Amby','Gidden','agiddena7@yandex.ru');
insert into customer (first_name,last_name,email) VALUES ('Cal','Pellant','cpellanta8@photobucket.com');
insert into customer (first_name,last_name,email) VALUES ('Sallyanne','Starte','sstartea9@baidu.com');
insert into customer (first_name,last_name,email) VALUES ('Chaddie','Kelf','ckelfaa@weibo.com');
insert into customer (first_name,last_name,email) VALUES ('Mattie','Klehyn','mklehynab@examiner.com');
insert into customer (first_name,last_name,email) VALUES ('Aaren','Faull','afaullac@time.com');
insert into customer (first_name,last_name,email) VALUES ('Seline','Sparshott','ssparshottad@archive.org');
insert into customer (first_name,last_name,email) VALUES ('Teena','Traylen','ttraylenae@loc.gov');
insert into customer (first_name,last_name,email) VALUES ('Annamarie','Charlin','acharlinaf@army.mil');
insert into customer (first_name,last_name,email) VALUES ('Casar','Iredell','ciredellag@economist.com');
insert into customer (first_name,last_name,email) VALUES ('Darrin','Attkins','dattkinsah@discovery.com');
insert into customer (first_name,last_name,email) VALUES ('Randie','Foynes','rfoynesai@list-manage.com');
insert into customer (first_name,last_name,email) VALUES ('Evangeline','Lenahan','elenahanaj@census.gov');
insert into customer (first_name,last_name,email) VALUES ('Lexis','Schroter','lschroterak@soup.io');
insert into customer (first_name,last_name,email) VALUES ('Adeline','Ouchterlony','aouchterlonyal@tumblr.com');
insert into customer (first_name,last_name,email) VALUES ('Edan','Ormerod','eormerodam@webeden.co.uk');
insert into customer (first_name,last_name,email) VALUES ('Nomi','Grebert','ngrebertan@desdev.cn');
insert into customer (first_name,last_name,email) VALUES ('Jessalin','Laddle','jladdleao@sogou.com');
insert into customer (first_name,last_name,email) VALUES ('Don','Mouatt','dmouattap@meetup.com');
insert into customer (first_name,last_name,email) VALUES ('Jessie','Mungan','jmunganaq@dmoz.org');
insert into customer (first_name,last_name,email) VALUES ('Kattie','Duchart','kduchartar@usa.gov');
insert into customer (first_name,last_name,email) VALUES ('Blake','Dockrell','bdockrellas@cdc.gov');
insert into customer (first_name,last_name,email) VALUES ('Jacenta','Davall','jdavallat@japanpost.jp');
insert into customer (first_name,last_name,email) VALUES ('Ainslee','Welldrake','awelldrakeau@ucla.edu');
insert into customer (first_name,last_name,email) VALUES ('Evangelia','Leggan','elegganav@ifeng.com');
insert into customer (first_name,last_name,email) VALUES ('Fred','Championnet','fchampionnetaw@yellowpages.com');
insert into customer (first_name,last_name,email) VALUES ('Paulette','Dumbleton','pdumbletonax@wsj.com');
insert into customer (first_name,last_name,email) VALUES ('Lanni','Bowler','lbowleray@usgs.gov');
insert into customer (first_name,last_name,email) VALUES ('Jeffrey','Rawsthorn','jrawsthornaz@flavors.me');
insert into customer (first_name,last_name,email) VALUES ('Gibb','Tithecott','gtithecottb0@blogspot.com');
insert into customer (first_name,last_name,email) VALUES ('Bradford','Borrington','bborringtonb1@storify.com');
insert into customer (first_name,last_name,email) VALUES ('Paule','McGuff','pmcguffb2@cisco.com');
insert into customer (first_name,last_name,email) VALUES ('Maynard','Queree','mquereeb3@bloglovin.com');
insert into customer (first_name,last_name,email) VALUES ('Fran','Cicchelli','fcicchellib4@techcrunch.com');
insert into customer (first_name,last_name,email) VALUES ('Vasily','Josse','vjosseb5@4shared.com');
insert into customer (first_name,last_name,email) VALUES ('Cathie','Gehring','cgehringb6@godaddy.com');
insert into customer (first_name,last_name,email) VALUES ('Joceline','Brantzen','jbrantzenb7@indiegogo.com');
insert into customer (first_name,last_name,email) VALUES ('Concordia','Glawsop','cglawsopb8@cisco.com');
insert into customer (first_name,last_name,email) VALUES ('Nickolai','Sawood','nsawoodb9@reddit.com');
insert into customer (first_name,last_name,email) VALUES ('Yancey','Dedam','ydedamba@fda.gov');
insert into customer (first_name,last_name,email) VALUES ('Lilla','Badam','lbadambb@twitter.com');
insert into customer (first_name,last_name,email) VALUES ('Jolee','Lavigne','jlavignebc@spotify.com');
insert into customer (first_name,last_name,email) VALUES ('Devin','Mc Comb','dmccombbd@rakuten.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Norma','Burgwin','nburgwinbe@woothemes.com');
insert into customer (first_name,last_name,email) VALUES ('Oona','Acom','oacombf@1688.com');
insert into customer (first_name,last_name,email) VALUES ('Tully','Parbrook','tparbrookbg@blogspot.com');
insert into customer (first_name,last_name,email) VALUES ('Arleen','Loughren','aloughrenbh@umich.edu');
insert into customer (first_name,last_name,email) VALUES ('Rebekkah','Martinho','rmartinhobi@bloglovin.com');
insert into customer (first_name,last_name,email) VALUES ('Cassius','Sainte Paul','csaintepaulbj@ucoz.com');
insert into customer (first_name,last_name,email) VALUES ('Lemmie','Surmeyers','lsurmeyersbk@feedburner.com');
insert into customer (first_name,last_name,email) VALUES ('Adlai','Raselles','arasellesbl@clickbank.net');
insert into customer (first_name,last_name,email) VALUES ('Turner','Blabber','tblabberbm@edublogs.org');
insert into customer (first_name,last_name,email) VALUES ('Terri','Gontier','tgontierbn@yellowpages.com');
insert into customer (first_name,last_name,email) VALUES ('Ferdy','Wix','fwixbo@kickstarter.com');
insert into customer (first_name,last_name,email) VALUES ('Louella','Gadault','lgadaultbp@statcounter.com');
insert into customer (first_name,last_name,email) VALUES ('Renate','Priscott','rpriscottbq@youtube.com');
insert into customer (first_name,last_name,email) VALUES ('Inessa','Sowman','isowmanbr@nsw.gov.au');
insert into customer (first_name,last_name,email) VALUES ('Tate','Howard','thowardbs@acquirethisname.com');
insert into customer (first_name,last_name,email) VALUES ('Irena','Prater','ipraterbt@usda.gov');
insert into customer (first_name,last_name,email) VALUES ('Keelby','Epinoy','kepinoybu@imageshack.us');
insert into customer (first_name,last_name,email) VALUES ('Derron','Dowyer','ddowyerbv@xinhuanet.com');
insert into customer (first_name,last_name,email) VALUES ('Harbert','Darlaston','hdarlastonbw@ibm.com');
insert into customer (first_name,last_name,email) VALUES ('Sheela','Daulton','sdaultonbx@dagondesign.com');
insert into customer (first_name,last_name,email) VALUES ('Harlin','Alcock','halcockby@exblog.jp');
insert into customer (first_name,last_name,email) VALUES ('Consuela','Hefforde','cheffordebz@phoca.cz');
insert into customer (first_name,last_name,email) VALUES ('Luisa','Ramm','lrammc0@ucoz.com');
insert into customer (first_name,last_name,email) VALUES ('Abbey','Minmagh','aminmaghc1@buzzfeed.com');
insert into customer (first_name,last_name,email) VALUES ('Karrie','Otham','kothamc2@yandex.ru');
insert into customer (first_name,last_name,email) VALUES ('Babara','Baxstare','bbaxstarec3@smugmug.com');
insert into customer (first_name,last_name,email) VALUES ('Rodolphe','Trethewey','rtretheweyc4@indiegogo.com');
insert into customer (first_name,last_name,email) VALUES ('Ardis','Georgescu','ageorgescuc5@apple.com');
insert into customer (first_name,last_name,email) VALUES ('Wilone','Dingwall','wdingwallc6@goo.gl');
insert into customer (first_name,last_name,email) VALUES ('Dalia','Capeling','dcapelingc7@desdev.cn');
insert into customer (first_name,last_name,email) VALUES ('Erny','Eriksson','eerikssonc8@mapquest.com');
insert into customer (first_name,last_name,email) VALUES ('Carver','Vasyunichev','cvasyunichevc9@discovery.com');
insert into customer (first_name,last_name,email) VALUES ('Valida','Higgonet','vhiggonetca@examiner.com');
insert into customer (first_name,last_name,email) VALUES ('Nanice','Vamplus','nvampluscb@umn.edu');
insert into customer (first_name,last_name,email) VALUES ('Fitzgerald','Mack','fmackcc@paypal.com');
insert into customer (first_name,last_name,email) VALUES ('Lib','Cloney','lcloneycd@reverbnation.com');
insert into customer (first_name,last_name,email) VALUES ('Silvanus','Broomer','sbroomerce@xinhuanet.com');
insert into customer (first_name,last_name,email) VALUES ('Vanny','Moizer','vmoizercf@chronoengine.com');
insert into customer (first_name,last_name,email) VALUES ('Guillaume','Donneely','gdonneelycg@businesswire.com');
insert into customer (first_name,last_name,email) VALUES ('Donnie','Bissell','dbissellch@feedburner.com');
insert into customer (first_name,last_name,email) VALUES ('Sisile','MacAlees','smacaleesci@tinyurl.com');
insert into customer (first_name,last_name,email) VALUES ('Donelle','Alennikov','dalennikovcj@shareasale.com');
insert into customer (first_name,last_name,email) VALUES ('Claudina','Doerr','cdoerrck@smh.com.au');
insert into customer (first_name,last_name,email) VALUES ('Gasper','Stainer','gstainercl@purevolume.com');
insert into customer (first_name,last_name,email) VALUES ('Alida','Chadney','achadneycm@businessinsider.com');
insert into customer (first_name,last_name,email) VALUES ('Theodore','Kemston','tkemstoncn@51.la');
insert into customer (first_name,last_name,email) VALUES ('Emmerich','Olivetta','eolivettaco@phpbb.com');
insert into customer (first_name,last_name,email) VALUES ('Aurelie','Flintuff','aflintuffcp@google.es');
insert into customer (first_name,last_name,email) VALUES ('Poppy','Manuel','pmanuelcq@google.com.hk');
insert into customer (first_name,last_name,email) VALUES ('Dion','Lapslie','dlapsliecr@washingtonpost.com');
insert into customer (first_name,last_name,email) VALUES ('Sidnee','Saer','ssaercs@blogspot.com');
insert into customer (first_name,last_name,email) VALUES ('Herculie','Goodee','hgoodeect@vkontakte.ru');
insert into customer (first_name,last_name,email) VALUES ('Marcille','Collett','mcollettcu@bing.com');
insert into customer (first_name,last_name,email) VALUES ('Munroe','Verney','mverneycv@a8.net');
insert into customer (first_name,last_name,email) VALUES ('Emelita','Nutkins','enutkinscw@paypal.com');
insert into customer (first_name,last_name,email) VALUES ('Marrissa','Skatcher','mskatchercx@smugmug.com');
insert into customer (first_name,last_name,email) VALUES ('Mark','Driffill','mdriffillcy@wikia.com');
insert into customer (first_name,last_name,email) VALUES ('Ricky','Ritchard','rritchardcz@linkedin.com');
insert into customer (first_name,last_name,email) VALUES ('Isabelita','Bennell','ibennelld0@hc360.com');
insert into customer (first_name,last_name,email) VALUES ('Guinna','Thackwray','gthackwrayd1@a8.net');
insert into customer (first_name,last_name,email) VALUES ('Greer','Kingett','gkingettd2@lycos.com');
insert into customer (first_name,last_name,email) VALUES ('Carin','Stoller','cstollerd3@tinypic.com');
insert into customer (first_name,last_name,email) VALUES ('Rebecka','Southwick','rsouthwickd4@berkeley.edu');
insert into customer (first_name,last_name,email) VALUES ('Trescha','McQuirk','tmcquirkd5@hp.com');
insert into customer (first_name,last_name,email) VALUES ('Kandy','Droogan','kdroogand6@stumbleupon.com');
insert into customer (first_name,last_name,email) VALUES ('Beatrice','Stitle','bstitled7@creativecommons.org');
insert into customer (first_name,last_name,email) VALUES ('Alexandra','Whittock','awhittockd8@blogtalkradio.com');
insert into customer (first_name,last_name,email) VALUES ('Bernete','Koppel','bkoppeld9@youtube.com');
insert into customer (first_name,last_name,email) VALUES ('Nissy','Spellesy','nspellesyda@oaic.gov.au');
insert into customer (first_name,last_name,email) VALUES ('Patrice','Dally','pdallydb@artisteer.com');
insert into customer (first_name,last_name,email) VALUES ('Glynda','Mcasparan','gmcasparandc@cisco.com');
insert into customer (first_name,last_name,email) VALUES ('Benedetto','Sacker','bsackerdd@unblog.fr');
insert into customer (first_name,last_name,email) VALUES ('Dani','Millsap','dmillsapde@storify.com');
insert into customer (first_name,last_name,email) VALUES ('Marjory','Ickovitz','mickovitzdf@spiegel.de');
insert into customer (first_name,last_name,email) VALUES ('Ardelle','Wyper','awyperdg@wisc.edu');
insert into customer (first_name,last_name,email) VALUES ('Freddie','Antonacci','fantonaccidh@meetup.com');
insert into customer (first_name,last_name,email) VALUES ('Worthington','McCaughren','wmccaughrendi@cam.ac.uk');
insert into customer (first_name,last_name,email) VALUES ('Suellen','Cubbit','scubbitdj@boston.com');
insert into customer (first_name,last_name,email) VALUES ('Quent','Legging','qleggingdk@odnoklassniki.ru');
insert into customer (first_name,last_name,email) VALUES ('Bette','Yanyushkin','byanyushkindl@eepurl.com');
insert into customer (first_name,last_name,email) VALUES ('Law','Kelson','lkelsondm@typepad.com');
insert into customer (first_name,last_name,email) VALUES ('Edan','Helbeck','ehelbeckdn@zdnet.com');
insert into customer (first_name,last_name,email) VALUES ('Artemus','Du Pre','adupredo@weather.com');
insert into customer (first_name,last_name,email) VALUES ('Greggory','Furlong','gfurlongdp@sourceforge.net');
insert into customer (first_name,last_name,email) VALUES ('Dannye','Bursnell','dbursnelldq@hubpages.com');
insert into customer (first_name,last_name,email) VALUES ('Gearard','Keiling','gkeilingdr@cafepress.com');
insert into customer (first_name,last_name,email) VALUES ('Lin','Dymoke','ldymokeds@chicagotribune.com');
insert into customer (first_name,last_name,email) VALUES ('Krysta','Keetley','kkeetleydt@netvibes.com');
insert into customer (first_name,last_name,email) VALUES ('Alia','Boughey','abougheydu@hc360.com');
insert into customer (first_name,last_name,email) VALUES ('Clementius','Dankersley','cdankersleydv@google.ru');
insert into customer (first_name,last_name,email) VALUES ('Simeon','Kaley','skaleydw@friendfeed.com');
insert into customer (first_name,last_name,email) VALUES ('Joellyn','Larmet','jlarmetdx@etsy.com');
insert into customer (first_name,last_name,email) VALUES ('Waylin','Likly','wliklydy@cbsnews.com');
insert into customer (first_name,last_name,email) VALUES ('Pavel','MacNeil','pmacneildz@histats.com');
insert into customer (first_name,last_name,email) VALUES ('Dedie','Brownbridge','dbrownbridgee0@i2i.jp');
insert into customer (first_name,last_name,email) VALUES ('Willem','Pirrey','wpirreye1@mashable.com');
insert into customer (first_name,last_name,email) VALUES ('Florella','Barke','fbarkee2@columbia.edu');
insert into customer (first_name,last_name,email) VALUES ('Foster','Bowmaker','fbowmakere3@usda.gov');
insert into customer (first_name,last_name,email) VALUES ('Anatola','Crysell','acryselle4@hatena.ne.jp');
insert into customer (first_name,last_name,email) VALUES ('Kristine','Nelsen','knelsene5@ca.gov');
insert into customer (first_name,last_name,email) VALUES ('Salmon','Signoret','ssignorete6@qq.com');
insert into customer (first_name,last_name,email) VALUES ('Wood','Royle','wroylee7@soup.io');
insert into customer (first_name,last_name,email) VALUES ('Omero','Alderwick','oalderwicke8@amazon.de');
insert into customer (first_name,last_name,email) VALUES ('Cordie','McCrystal','cmccrystale9@youtube.com');
insert into customer (first_name,last_name,email) VALUES ('Laurella','Stobie','lstobieea@php.net');
insert into customer (first_name,last_name,email) VALUES ('Eloisa','Romme','erommeeb@over-blog.com');
insert into customer (first_name,last_name,email) VALUES ('Bess','Van Schafflaer','bvanschafflaerec@earthlink.net');
insert into customer (first_name,last_name,email) VALUES ('Ian','Dron','idroned@is.gd');
insert into customer (first_name,last_name,email) VALUES ('Trescha','Spencers','tspencersee@ezinearticles.com');
insert into customer (first_name,last_name,email) VALUES ('Shelley','Faltin','sfaltinef@about.com');
insert into customer (first_name,last_name,email) VALUES ('Marj','McGuggy','mmcguggyeg@w3.org');
insert into customer (first_name,last_name,email) VALUES ('Curtice','Keating','ckeatingeh@ning.com');
insert into customer (first_name,last_name,email) VALUES ('Judy','Gimblet','jgimbletei@typepad.com');
insert into customer (first_name,last_name,email) VALUES ('Erhard','Lejeune','elejeuneej@eepurl.com');
insert into customer (first_name,last_name,email) VALUES ('Gar','Cornehl','gcornehlek@symantec.com');
insert into customer (first_name,last_name,email) VALUES ('Tabor','McNelly','tmcnellyel@dyndns.org');
insert into customer (first_name,last_name,email) VALUES ('Lay','Btham','lbthamem@abc.net.au');
insert into customer (first_name,last_name,email) VALUES ('Kathryne','De Andreis','kdeandreisen@xinhuanet.com');
insert into customer (first_name,last_name,email) VALUES ('Krissie','OShea','kosheaeo@php.net');
insert into customer (first_name,last_name,email) VALUES ('Mari','Aaronson','maaronsonep@loc.gov');
insert into customer (first_name,last_name,email) VALUES ('Hermie','Bromage','hbromageeq@timesonline.co.uk');
insert into customer (first_name,last_name,email) VALUES ('Nicola','Rawcliffe','nrawcliffeer@mtv.com');
insert into customer (first_name,last_name,email) VALUES ('Charla','Zannotti','czannotties@dailymotion.com');
insert into customer (first_name,last_name,email) VALUES ('Corene','Hogsden','chogsdenet@ebay.co.uk');
insert into customer (first_name,last_name,email) VALUES ('Maximilian','Daid','mdaideu@example.com');
insert into customer (first_name,last_name,email) VALUES ('Brandyn','Gullyes','bgullyesev@google.cn');
insert into customer (first_name,last_name,email) VALUES ('Kimmy','Keyes','kkeyesew@delicious.com');
insert into customer (first_name,last_name,email) VALUES ('Zebadiah','Grosvenor','zgrosvenorex@rambler.ru');
insert into customer (first_name,last_name,email) VALUES ('Flem','Klimshuk','fklimshukey@cbsnews.com');
insert into customer (first_name,last_name,email) VALUES ('Farlay','Getley','fgetleyez@wsj.com');
insert into customer (first_name,last_name,email) VALUES ('Fields','Batting','fbattingf0@youtube.com');
insert into customer (first_name,last_name,email) VALUES ('Merrill','Bootman','mbootmanf1@whitehouse.gov');
insert into customer (first_name,last_name,email) VALUES ('Mikel','Cordie','mcordief2@flickr.com');
insert into customer (first_name,last_name,email) VALUES ('Wallache','Toby','wtobyf3@nba.com');
insert into customer (first_name,last_name,email) VALUES ('Elvyn','Batters','ebattersf4@php.net');
insert into customer (first_name,last_name,email) VALUES ('Dillon','Lemm','dlemmf5@creativecommons.org');
insert into customer (first_name,last_name,email) VALUES ('Andrea','Syne','asynef6@umn.edu');
insert into customer (first_name,last_name,email) VALUES ('Dag','Goracci','dgoraccif7@pbs.org');
insert into customer (first_name,last_name,email) VALUES ('Nat','Tortoise','ntortoisef8@jimdo.com');
insert into customer (first_name,last_name,email) VALUES ('Cullen','Solomonides','csolomonidesf9@uol.com.br');
insert into customer (first_name,last_name,email) VALUES ('Eve','Suggate','esuggatefa@blogspot.com');
insert into customer (first_name,last_name,email) VALUES ('Margot','Parsonson','mparsonsonfb@live.com');
insert into customer (first_name,last_name,email) VALUES ('Tybi','Ormonde','tormondefc@patch.com');
insert into customer (first_name,last_name,email) VALUES ('Sybil','Tollit','stollitfd@irs.gov');
insert into customer (first_name,last_name,email) VALUES ('Melisent','Veltmann','mveltmannfe@huffingtonpost.com');
insert into customer (first_name,last_name,email) VALUES ('Ethe','Life','elifeff@epa.gov');
insert into customer (first_name,last_name,email) VALUES ('Renata','Greenstead','rgreensteadfg@sciencedaily.com');
insert into customer (first_name,last_name,email) VALUES ('Anastasia','Fallowfield','afallowfieldfh@mozilla.com');
insert into customer (first_name,last_name,email) VALUES ('Annette','Hardey','ahardeyfi@examiner.com');
insert into customer (first_name,last_name,email) VALUES ('Johannes','Ploughwright','jploughwrightfj@blogger.com');
insert into customer (first_name,last_name,email) VALUES ('Ynez','Kubasiewicz','ykubasiewiczfk@aol.com');
insert into customer (first_name,last_name,email) VALUES ('My','Bricksey','mbrickseyfl@youtu.be');
insert into customer (first_name,last_name,email) VALUES ('Mabelle','Piche','mpichefm@phpbb.com');
insert into customer (first_name,last_name,email) VALUES ('Barn','Carratt','bcarrattfn@weather.com');
insert into customer (first_name,last_name,email) VALUES ('Sherye','Capes','scapesfo@bbc.co.uk');
insert into customer (first_name,last_name,email) VALUES ('Andre','Philipp','aphilippfp@cpanel.net');
insert into customer (first_name,last_name,email) VALUES ('Arturo','Paudin','apaudinfq@google.es');
insert into customer (first_name,last_name,email) VALUES ('Micky','Kearn','mkearnfr@ted.com');
insert into customer (first_name,last_name,email) VALUES ('Case','Kleinberer','ckleinbererfs@ucoz.ru');
insert into customer (first_name,last_name,email) VALUES ('Cynthy','Thwaites','cthwaitesft@soundcloud.com');
insert into customer (first_name,last_name,email) VALUES ('Gearard','Cowper','gcowperfu@google.ca');
insert into customer (first_name,last_name,email) VALUES ('Donn','Flood','dfloodfv@un.org');
insert into customer (first_name,last_name,email) VALUES ('Shem','Bratcher','sbratcherfw@delicious.com');
insert into customer (first_name,last_name,email) VALUES ('Ulrick','Aulsford','uaulsfordfx@cdc.gov');
insert into customer (first_name,last_name,email) VALUES ('Joby','Goschalk','jgoschalkfy@shutterfly.com');
insert into customer (first_name,last_name,email) VALUES ('Margeaux','Nolot','mnolotfz@narod.ru');
insert into customer (first_name,last_name,email) VALUES ('Neale','Keri','nkerig0@latimes.com');
insert into customer (first_name,last_name,email) VALUES ('Yevette','Teale','ytealeg1@nyu.edu');
insert into customer (first_name,last_name,email) VALUES ('Thibaud','Reddan','treddang2@rediff.com');
insert into customer (first_name,last_name,email) VALUES ('Darbie','Iannuzzelli','diannuzzellig3@cdc.gov');
insert into customer (first_name,last_name,email) VALUES ('Alexei','Hasser','ahasserg4@feedburner.com');
insert into customer (first_name,last_name,email) VALUES ('Idette','Mokes','imokesg5@networksolutions.com');
insert into customer (first_name,last_name,email) VALUES ('Chas','Figge','cfiggeg6@army.mil');
insert into customer (first_name,last_name,email) VALUES ('Bonnee','Cooke','bcookeg7@arizona.edu');
insert into customer (first_name,last_name,email) VALUES ('Sylas','Gilling','sgillingg8@dailymotion.com');
insert into customer (first_name,last_name,email) VALUES ('Hanny','McOwan','hmcowang9@cmu.edu');
insert into customer (first_name,last_name,email) VALUES ('Britte','Pask','bpaskga@chronoengine.com');
insert into customer (first_name,last_name,email) VALUES ('Valencia','Lorens','vlorensgb@elegantthemes.com');
insert into customer (first_name,last_name,email) VALUES ('Rochette','Antrag','rantraggc@unicef.org');
insert into customer (first_name,last_name,email) VALUES ('Mechelle','Dewhurst','mdewhurstgd@un.org');
insert into customer (first_name,last_name,email) VALUES ('Lynn','Ripley','lripleyge@studiopress.com');
insert into customer (first_name,last_name,email) VALUES ('Phillida','Carlon','pcarlongf@exblog.jp');
insert into customer (first_name,last_name,email) VALUES ('Ezmeralda','Scurrell','escurrellgg@ocn.ne.jp');
insert into customer (first_name,last_name,email) VALUES ('Tabitha','Claige','tclaigegh@oakley.com');
insert into customer (first_name,last_name,email) VALUES ('Shelton','Downing','sdowninggi@dropbox.com');
insert into customer (first_name,last_name,email) VALUES ('Bertine','Bech','bbechgj@instagram.com');
insert into customer (first_name,last_name,email) VALUES ('Demetris','Signorelli','dsignorelligk@twitpic.com');
insert into customer (first_name,last_name,email) VALUES ('Benedikta','Poulston','bpoulstongl@wp.com');
insert into customer (first_name,last_name,email) VALUES ('Theobald','Melpuss','tmelpussgm@imageshack.us');
insert into customer (first_name,last_name,email) VALUES ('Missy','Lockett','mlockettgn@netvibes.com');
insert into customer (first_name,last_name,email) VALUES ('Hubie','Nel','hnelgo@eventbrite.com');
insert into customer (first_name,last_name,email) VALUES ('Gabbi','Antonov','gantonovgp@utexas.edu');
insert into customer (first_name,last_name,email) VALUES ('Carly','Allgood','callgoodgq@google.ca');
insert into customer (first_name,last_name,email) VALUES ('Bowie','Jarritt','bjarrittgr@biblegateway.com');
insert into customer (first_name,last_name,email) VALUES ('Calhoun','Drew-Clifton','cdrewcliftongs@t.co');
insert into customer (first_name,last_name,email) VALUES ('Miran','Curtin','mcurtingt@wikimedia.org');
insert into customer (first_name,last_name,email) VALUES ('Charin','Rigler','criglergu@altervista.org');
insert into customer (first_name,last_name,email) VALUES ('Cornela','Nobriga','cnobrigagv@bizjournals.com');
insert into customer (first_name,last_name,email) VALUES ('Tamar','Brunning','tbrunninggw@unblog.fr');
insert into customer (first_name,last_name,email) VALUES ('Celestyn','Petrashkov','cpetrashkovgx@hugedomains.com');
insert into customer (first_name,last_name,email) VALUES ('Rhonda','Chatband','rchatbandgy@businessweek.com');
insert into customer (first_name,last_name,email) VALUES ('Carolynn','Karpov','ckarpovgz@google.com.hk');
insert into customer (first_name,last_name,email) VALUES ('Griff','Torrisi','gtorrisih0@ted.com');
insert into customer (first_name,last_name,email) VALUES ('Meta','Rowswell','mrowswellh1@squarespace.com');
insert into customer (first_name,last_name,email) VALUES ('Lissi','Durrand','ldurrandh2@uiuc.edu');
insert into customer (first_name,last_name,email) VALUES ('Charita','Brand','cbrandh3@tripod.com');
insert into customer (first_name,last_name,email) VALUES ('Arvin','Gooley','agooleyh4@oracle.com');
insert into customer (first_name,last_name,email) VALUES ('Jeffry','Fitzsimons','jfitzsimonsh5@cnet.com');
insert into customer (first_name,last_name,email) VALUES ('Miof mela','Reace','mreaceh6@last.fm');
insert into customer (first_name,last_name,email) VALUES ('Ashely','Hamly','ahamlyh7@baidu.com');
insert into customer (first_name,last_name,email) VALUES ('Stirling','Jako','sjakoh8@skyrock.com');
insert into customer (first_name,last_name,email) VALUES ('Felix','Bloomfield','fbloomfieldh9@auda.org.au');
insert into customer (first_name,last_name,email) VALUES ('Tailor','Brotherheed','tbrotherheedha@nationalgeographic.com');
insert into customer (first_name,last_name,email) VALUES ('Ole','Rahill','orahillhb@umich.edu');
insert into customer (first_name,last_name,email) VALUES ('Lodovico','Padell','lpadellhc@gov.uk');
insert into customer (first_name,last_name,email) VALUES ('Berrie','Troop','btroophd@who.int');
insert into customer (first_name,last_name,email) VALUES ('Diane-marie','Cantrill','dcantrillhe@cloudflare.com');
insert into customer (first_name,last_name,email) VALUES ('Mal','Edon','medonhf@joomla.org');
insert into customer (first_name,last_name,email) VALUES ('Margareta','Dome','mdomehg@slideshare.net');
insert into customer (first_name,last_name,email) VALUES ('Cob','Folling','cfollinghh@163.com');
insert into customer (first_name,last_name,email) VALUES ('Chad','Mc Dermid','cmcdermidhi@t.co');
insert into customer (first_name,last_name,email) VALUES ('Gilberte','Housbie','ghousbiehj@technorati.com');
insert into customer (first_name,last_name,email) VALUES ('Dar','Crutch','dcrutchhk@google.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Judd','Roskilly','jroskillyhl@columbia.edu');
insert into customer (first_name,last_name,email) VALUES ('Orren','Watsam','owatsamhm@sourceforge.net');
insert into customer (first_name,last_name,email) VALUES ('Kissie','Fryers','kfryershn@de.vu');
insert into customer (first_name,last_name,email) VALUES ('Wileen','OCrowley','wocrowleyho@zimbio.com');
insert into customer (first_name,last_name,email) VALUES ('Lilyan','Shippard','lshippardhp@ezinearticles.com');
insert into customer (first_name,last_name,email) VALUES ('Adelaida','Rintoul','arintoulhq@sohu.com');
insert into customer (first_name,last_name,email) VALUES ('Diane','Edgerton','dedgertonhr@domainmarket.com');
insert into customer (first_name,last_name,email) VALUES ('Latisha','Testin','ltestinhs@spiegel.de');
insert into customer (first_name,last_name,email) VALUES ('Esteban','Vasyagin','evasyaginht@msu.edu');
insert into customer (first_name,last_name,email) VALUES ('Jolynn','Oliveras','joliverashu@histats.com');
insert into customer (first_name,last_name,email) VALUES ('Damaris','Kolodziejski','dkolodziejskihv@independent.co.uk');
insert into customer (first_name,last_name,email) VALUES ('Etan','Redihalgh','eredihalghhw@gravatar.com');
insert into customer (first_name,last_name,email) VALUES ('Starr','Iacomi','siacomihx@cisco.com');
insert into customer (first_name,last_name,email) VALUES ('Beth','Croy','bcroyhy@icq.com');
insert into customer (first_name,last_name,email) VALUES ('Garv','Ginnelly','gginnellyhz@cargocollective.com');
insert into customer (first_name,last_name,email) VALUES ('Mikol','Louca','mloucai0@kickstarter.com');
insert into customer (first_name,last_name,email) VALUES ('Marlo','Jennings','mjenningsi1@cnn.com');
insert into customer (first_name,last_name,email) VALUES ('Hoyt','Tieman','htiemani2@blogger.com');
insert into customer (first_name,last_name,email) VALUES ('May','Verney','mverneyi3@forbes.com');
insert into customer (first_name,last_name,email) VALUES ('Peg','Diwell','pdiwelli4@gnu.org');
insert into customer (first_name,last_name,email) VALUES ('Grange','Pell','gpelli5@purevolume.com');
insert into customer (first_name,last_name,email) VALUES ('Kevin','Matusov','kmatusovi6@com.com');
insert into customer (first_name,last_name,email) VALUES ('Julia','Woodburne','jwoodburnei7@lulu.com');
insert into customer (first_name,last_name,email) VALUES ('Lemar','Bovis','lbovisi8@paypal.com');
insert into customer (first_name,last_name,email) VALUES ('Ryley','Matura','rmaturai9@seesaa.net');
insert into customer (first_name,last_name,email) VALUES ('Rorie','Cisar','rcisaria@illinois.edu');
insert into customer (first_name,last_name,email) VALUES ('Bear','De La Haye','bdelahayeib@discovery.com');
insert into customer (first_name,last_name,email) VALUES ('Mikael','Ashwin','mashwinic@google.ru');
insert into customer (first_name,last_name,email) VALUES ('Yurik','Farney','yfarneyid@microsoft.com');
insert into customer (first_name,last_name,email) VALUES ('Jemimah','Lotwich','jlotwichie@dedecms.com');
insert into customer (first_name,last_name,email) VALUES ('Michail','Mattia','mmattiaif@nature.com');
insert into customer (first_name,last_name,email) VALUES ('Lezlie','Dutnall','ldutnallig@ehow.com');
insert into customer (first_name,last_name,email) VALUES ('Zechariah','Bryden','zbrydenih@google.com');
insert into customer (first_name,last_name,email) VALUES ('Josey','MacPaik','jmacpaikii@twitpic.com');
insert into customer (first_name,last_name,email) VALUES ('Cindie','Liggons','cliggonsij@ucoz.ru');
insert into customer (first_name,last_name,email) VALUES ('Evita','Comer','ecomerik@wix.com');
insert into customer (first_name,last_name,email) VALUES ('Mortimer','Edler','medleril@nydailynews.com');
insert into customer (first_name,last_name,email) VALUES ('Sabra','Hendriksen','shendriksenim@dyndns.org');
insert into customer (first_name,last_name,email) VALUES ('Nahum','Semble','nsemblein@g.co');
insert into customer (first_name,last_name,email) VALUES ('Yehudi','Applegarth','yapplegarthio@twitter.com');
insert into customer (first_name,last_name,email) VALUES ('Dev','Janney','djanneyip@nifty.com');
insert into customer (first_name,last_name,email) VALUES ('Chariot','Hamon','chamoniq@booking.com');
insert into customer (first_name,last_name,email) VALUES ('Olivia','Heephy','oheephyir@wisc.edu');
insert into customer (first_name,last_name,email) VALUES ('Reinold','Baudinet','rbaudinetis@guardian.co.uk');
insert into customer (first_name,last_name,email) VALUES ('Paulo','Quiddinton','pquiddintonit@cocolog-nifty.com');
insert into customer (first_name,last_name,email) VALUES ('Quinn','Vasyanin','qvasyaniniu@google.nl');
insert into customer (first_name,last_name,email) VALUES ('Daniele','Tourmell','dtourmelliv@netlog.com');
insert into customer (first_name,last_name,email) VALUES ('Rodge','Rehn','rrehniw@jigsy.com');
insert into customer (first_name,last_name,email) VALUES ('Adler','Nicklen','anicklenix@un.org');
insert into customer (first_name,last_name,email) VALUES ('Oriana','Hellens','ohellensiy@google.it');
insert into customer (first_name,last_name,email) VALUES ('Gipsy','Peatt','gpeattiz@about.me');
insert into customer (first_name,last_name,email) VALUES ('Yankee','Stallion','ystallionj0@i2i.jp');
insert into customer (first_name,last_name,email) VALUES ('Jordain','Kennington','jkenningtonj1@delicious.com');
insert into customer (first_name,last_name,email) VALUES ('Skye','Rainsdon','srainsdonj2@ox.ac.uk');
insert into customer (first_name,last_name,email) VALUES ('Lorilee','Sperry','lsperryj3@pagesperso-orange.fr');
insert into customer (first_name,last_name,email) VALUES ('Meghan','Barbey','mbarbeyj4@buzzfeed.com');
insert into customer (first_name,last_name,email) VALUES ('Jourdan','Matoshin','jmatoshinj5@jiathis.com');
insert into customer (first_name,last_name,email) VALUES ('Lenora','Keirl','lkeirlj6@smh.com.au');
insert into customer (first_name,last_name,email) VALUES ('Ame','Halloway','ahallowayj7@fc2.com');
insert into customer (first_name,last_name,email) VALUES ('Sharity','Ancliff','sancliffj8@fastcompany.com');
insert into customer (first_name,last_name,email) VALUES ('Eba','Andrew','eandrewj9@technorati.com');
insert into customer (first_name,last_name,email) VALUES ('Chlo','de Castelain','cdecastelainja@hp.com');
insert into customer (first_name,last_name,email) VALUES ('Vally','Collister','vcollisterjb@redcross.org');
insert into customer (first_name,last_name,email) VALUES ('Tirrell','Watsam','twatsamjc@weibo.com');
insert into customer (first_name,last_name,email) VALUES ('Lucky','Burvill','lburvilljd@xinhuanet.com');
insert into customer (first_name,last_name,email) VALUES ('Carey','Picheford','cpichefordje@vinaora.com');
insert into customer (first_name,last_name,email) VALUES ('Avictor','Trusler','atruslerjf@dmoz.org');
insert into customer (first_name,last_name,email) VALUES ('Winthrop','Whitticks','wwhitticksjg@yellowbook.com');
insert into customer (first_name,last_name,email) VALUES ('Alma','Robjohns','arobjohnsjh@howstuffworks.com');
insert into customer (first_name,last_name,email) VALUES ('Clarance','Tyhurst','ctyhurstji@bloomberg.com');
insert into customer (first_name,last_name,email) VALUES ('Camella','Gosnall','cgosnalljj@posterous.com');
insert into customer (first_name,last_name,email) VALUES ('Felicia','Kibel','fkibeljk@edublogs.org');
insert into customer (first_name,last_name,email) VALUES ('Phip','Bissatt','pbissattjl@wikispaces.com');
insert into customer (first_name,last_name,email) VALUES ('Jens','Pucker','jpuckerjm@themeforest.net');
insert into customer (first_name,last_name,email) VALUES ('Doug','Farndale','dfarndalejn@go.com');
insert into customer (first_name,last_name,email) VALUES ('Chloris','Draisey','cdraiseyjo@4shared.com');
insert into customer (first_name,last_name,email) VALUES ('Tedda','Chavrin','tchavrinjp@qq.com');
insert into customer (first_name,last_name,email) VALUES ('Liva','Todhunter','ltodhunterjq@joomla.org');
insert into customer (first_name,last_name,email) VALUES ('Marcela','Claesens','mclaesensjr@yolasite.com');
insert into customer (first_name,last_name,email) VALUES ('Marwin','Rawles','mrawlesjs@jalbum.net');
insert into customer (first_name,last_name,email) VALUES ('Sadie','Sallows','ssallowsjt@goo.gl');
insert into customer (first_name,last_name,email) VALUES ('Augustine','Gorse','agorseju@shareasale.com');
insert into customer (first_name,last_name,email) VALUES ('Carmita','Rosso','crossojv@unicef.org');
insert into customer (first_name,last_name,email) VALUES ('Loria','Ancliff','lancliffjw@360.cn');
insert into customer (first_name,last_name,email) VALUES ('Rossy','Lamberts','rlambertsjx@about.com');
insert into customer (first_name,last_name,email) VALUES ('Paula','Greenhalgh','pgreenhalghjy@businessinsider.com');
insert into customer (first_name,last_name,email) VALUES ('Torie','Baynton','tbayntonjz@lulu.com');
insert into customer (first_name,last_name,email) VALUES ('Orlando','Hakking','ohakkingk0@tripadvisor.com');
insert into customer (first_name,last_name,email) VALUES ('Rutter','Brewerton','rbrewertonk1@hhs.gov');
insert into customer (first_name,last_name,email) VALUES ('Huntley','Seide','hseidek2@mayoclinic.com');
insert into customer (first_name,last_name,email) VALUES ('Clemmy','Hoovart','choovartk3@google.pl');
insert into customer (first_name,last_name,email) VALUES ('Madelina','Mollindinia','mmollindiniak4@opensource.org');
insert into customer (first_name,last_name,email) VALUES ('Isaak','Matus','imatusk5@qq.com');
insert into customer (first_name,last_name,email) VALUES ('Agace','Stoop','astoopk6@about.com');
insert into customer (first_name,last_name,email) VALUES ('Conn','Goldsberry','cgoldsberryk7@ucsd.edu');
insert into customer (first_name,last_name,email) VALUES ('Cecily','Dmitrichenko','cdmitrichenkok8@google.ca');
insert into customer (first_name,last_name,email) VALUES ('Tobit','Sabattier','tsabattierk9@oaic.gov.au');
insert into customer (first_name,last_name,email) VALUES ('Harriet','Coskerry','hcoskerryka@squarespace.com');
insert into customer (first_name,last_name,email) VALUES ('Ingemar','Firebrace','ifirebracekb@aboutads.info');
insert into customer (first_name,last_name,email) VALUES ('Shane','Gillespie','sgillespiekc@infoseek.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Fairleigh','Kibbe','fkibbekd@who.int');
insert into customer (first_name,last_name,email) VALUES ('Claribel','Konrad','ckonradke@usda.gov');
insert into customer (first_name,last_name,email) VALUES ('Stepha','Crosgrove','scrosgrovekf@baidu.com');
insert into customer (first_name,last_name,email) VALUES ('Niki','Lascell','nlascellkg@dropbox.com');
insert into customer (first_name,last_name,email) VALUES ('Madelina','Dalziell','mdalziellkh@blogger.com');
insert into customer (first_name,last_name,email) VALUES ('Kira','Lyddyard','klyddyardki@jalbum.net');
insert into customer (first_name,last_name,email) VALUES ('Shalna','Flacknell','sflacknellkj@discovery.com');
insert into customer (first_name,last_name,email) VALUES ('Geno','Maffezzoli','gmaffezzolikk@usgs.gov');
insert into customer (first_name,last_name,email) VALUES ('Debi','Wasselin','dwasselinkl@wufoo.com');
insert into customer (first_name,last_name,email) VALUES ('Gabriela','Gritten','ggrittenkm@a8.net');
insert into customer (first_name,last_name,email) VALUES ('Electra','McDougle','emcdouglekn@yolasite.com');
insert into customer (first_name,last_name,email) VALUES ('Lynette','Bartrop','lbartropko@ezinearticles.com');
insert into customer (first_name,last_name,email) VALUES ('Valida','Corless','vcorlesskp@friendfeed.com');
insert into customer (first_name,last_name,email) VALUES ('Cherlyn','Chrichton','cchrichtonkq@sphinn.com');
insert into customer (first_name,last_name,email) VALUES ('Alysa','Triggs','atriggskr@cargocollective.com');
insert into customer (first_name,last_name,email) VALUES ('Alastair','Lidierth','alidierthks@lycos.com');
insert into customer (first_name,last_name,email) VALUES ('Nealy','Janusz','njanuszkt@ox.ac.uk');
insert into customer (first_name,last_name,email) VALUES ('Annalise','Dymond','adymondku@comsenz.com');
insert into customer (first_name,last_name,email) VALUES ('Morse','Olensby','molensbykv@w3.org');
insert into customer (first_name,last_name,email) VALUES ('Christiano','Fortoun','cfortounkw@nsw.gov.au');
insert into customer (first_name,last_name,email) VALUES ('Serge','Vell','svellkx@tamu.edu');
insert into customer (first_name,last_name,email) VALUES ('Becka','Trelevan','btrelevanky@gravatar.com');
insert into customer (first_name,last_name,email) VALUES ('Kayley','Nabarro','knabarrokz@ucoz.com');
insert into customer (first_name,last_name,email) VALUES ('Jo-ann','Jacobbe','jjacobbel0@wikia.com');
insert into customer (first_name,last_name,email) VALUES ('Clemence','Blackmore','cblackmorel1@printfriendly.com');
insert into customer (first_name,last_name,email) VALUES ('Michal','Imlacke','mimlackel2@mediafire.com');
insert into customer (first_name,last_name,email) VALUES ('Bradford','Grotty','bgrottyl3@paypal.com');
insert into customer (first_name,last_name,email) VALUES ('Gannon','McAvey','gmcaveyl4@webnode.com');
insert into customer (first_name,last_name,email) VALUES ('Gilberta','Rembrandt','grembrandtl5@google.cn');
insert into customer (first_name,last_name,email) VALUES ('Bria','McMurthy','bmcmurthyl6@multiply.com');
insert into customer (first_name,last_name,email) VALUES ('Ulrika','Queyos','uqueyosl7@washington.edu');
insert into customer (first_name,last_name,email) VALUES ('Belia','Cartmale','bcartmalel8@com.com');
insert into customer (first_name,last_name,email) VALUES ('Danie','McIlwraith','dmcilwraithl9@tamu.edu');
insert into customer (first_name,last_name,email) VALUES ('Jaquith','Audas','jaudasla@issuu.com');
insert into customer (first_name,last_name,email) VALUES ('Leeland','Kerslake','lkerslakelb@feedburner.com');
insert into customer (first_name,last_name,email) VALUES ('Shandeigh','Derks','sderkslc@imgur.com');
insert into customer (first_name,last_name,email) VALUES ('Dulcia','Malloy','dmalloyld@nationalgeographic.com');
insert into customer (first_name,last_name,email) VALUES ('Nananne','McFaell','nmcfaellle@wp.com');
insert into customer (first_name,last_name,email) VALUES ('Beauregard','Persitt','bpersittlf@livejournal.com');
insert into customer (first_name,last_name,email) VALUES ('Germana','Nornable','gnornablelg@a8.net');
insert into customer (first_name,last_name,email) VALUES ('Tommi','Lydon','tlydonlh@squarespace.com');
insert into customer (first_name,last_name,email) VALUES ('Wynnie','Minton','wmintonli@pinterest.com');
insert into customer (first_name,last_name,email) VALUES ('Gerta','Denisyuk','gdenisyuklj@huffingtonpost.com');
insert into customer (first_name,last_name,email) VALUES ('Biddie','Szantho','bszantholk@purevolume.com');
insert into customer (first_name,last_name,email) VALUES ('Glynda','Jacmard','gjacmardll@epa.gov');
insert into customer (first_name,last_name,email) VALUES ('Alair','Sommerville','asommervillelm@cmu.edu');
insert into customer (first_name,last_name,email) VALUES ('Hilary','Whorall','hwhorallln@chicagotribune.com');
insert into customer (first_name,last_name,email) VALUES ('Consolata','Ruslen','cruslenlo@nhs.uk');
insert into customer (first_name,last_name,email) VALUES ('Leonie','Bartrop','lbartroplp@deliciousdays.com');
insert into customer (first_name,last_name,email) VALUES ('Gerianna','Philipsohn','gphilipsohnlq@studiopress.com');
insert into customer (first_name,last_name,email) VALUES ('Koo','Huyghe','khuyghelr@patch.com');
insert into customer (first_name,last_name,email) VALUES ('Yurik','Shedd','ysheddls@nifty.com');
insert into customer (first_name,last_name,email) VALUES ('Dionisio','Acaster','dacasterlt@sciencedaily.com');
insert into customer (first_name,last_name,email) VALUES ('Joyann','Blyth','jblythlu@mozilla.com');
insert into customer (first_name,last_name,email) VALUES ('Verine','Rottger','vrottgerlv@gmpg.org');
insert into customer (first_name,last_name,email) VALUES ('Eadie','Heales','ehealeslw@ezinearticles.com');
insert into customer (first_name,last_name,email) VALUES ('Claudette','Haigh','chaighlx@gov.uk');
insert into customer (first_name,last_name,email) VALUES ('Rivi','Joris','rjorisly@google.com.br');
insert into customer (first_name,last_name,email) VALUES ('Neddy','Jann','njannlz@is.gd');
insert into customer (first_name,last_name,email) VALUES ('Ike','Schriren','ischrirenm0@tripod.com');
insert into customer (first_name,last_name,email) VALUES ('Liesa','Bownes','lbownesm1@comsenz.com');
insert into customer (first_name,last_name,email) VALUES ('Bordy','Pollard','bpollardm2@about.com');
insert into customer (first_name,last_name,email) VALUES ('Lexi','Ricca','lriccam3@gmpg.org');
insert into customer (first_name,last_name,email) VALUES ('Gar','Blackburne','gblackburnem4@geocities.com');
insert into customer (first_name,last_name,email) VALUES ('Zuzana','Elington','zelingtonm5@tumblr.com');
insert into customer (first_name,last_name,email) VALUES ('Carolyne','Eagell','ceagellm6@imdb.com');
insert into customer (first_name,last_name,email) VALUES ('Clarke','De Normanville','cdenormanvillem7@com.com');
insert into customer (first_name,last_name,email) VALUES ('Ingunna','Noddles','inoddlesm8@instagram.com');
insert into customer (first_name,last_name,email) VALUES ('Nichol','DHooge','ndhoogem9@exblog.jp');
insert into customer (first_name,last_name,email) VALUES ('Oona','Areles','oarelesma@desdev.cn');
insert into customer (first_name,last_name,email) VALUES ('Leland','Keford','lkefordmb@wordpress.com');
insert into customer (first_name,last_name,email) VALUES ('Phedra','Prosser','pprossermc@ebay.com');
insert into customer (first_name,last_name,email) VALUES ('Alidia','Winstanley','awinstanleymd@google.pl');
insert into customer (first_name,last_name,email) VALUES ('Hedwiga','Boxhill','hboxhillme@youku.com');
insert into customer (first_name,last_name,email) VALUES ('Anna','McNickle','amcnicklemf@irs.gov');
insert into customer (first_name,last_name,email) VALUES ('Astra','Blakely','ablakelymg@accuweather.com');
insert into customer (first_name,last_name,email) VALUES ('Orsola','Bisp','obispmh@state.tx.us');
insert into customer (first_name,last_name,email) VALUES ('Rudy','Billam','rbillammi@cbc.ca');
insert into customer (first_name,last_name,email) VALUES ('Brigg','Duinkerk','bduinkerkmj@fema.gov');
insert into customer (first_name,last_name,email) VALUES ('Yelena','Maddinon','ymaddinonmk@comcast.net');
insert into customer (first_name,last_name,email) VALUES ('Addy','Grouen','agrouenml@cmu.edu');
insert into customer (first_name,last_name,email) VALUES ('Christin','Haddacks','chaddacksmm@wordpress.org');
insert into customer (first_name,last_name,email) VALUES ('Lorens','Obbard','lobbardmn@yahoo.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Seana','Ready','sreadymo@google.pl');
insert into customer (first_name,last_name,email) VALUES ('Karola','Petchell','kpetchellmp@webnode.com');
insert into customer (first_name,last_name,email) VALUES ('Nola','Roden','nrodenmq@youku.com');
insert into customer (first_name,last_name,email) VALUES ('Niles','Gawthorp','ngawthorpmr@japanpost.jp');
insert into customer (first_name,last_name,email) VALUES ('Bogart','Kolodziejski','bkolodziejskims@trellian.com');
insert into customer (first_name,last_name,email) VALUES ('Derward','Tompsett','dtompsettmt@soundcloud.com');
insert into customer (first_name,last_name,email) VALUES ('Teddi','Bergstram','tbergstrammu@purevolume.com');
insert into customer (first_name,last_name,email) VALUES ('Natalie','Bennie','nbenniemv@comcast.net');
insert into customer (first_name,last_name,email) VALUES ('Win','Chill','wchillmw@yelp.com');
insert into customer (first_name,last_name,email) VALUES ('Joseito','Besque','jbesquemx@xinhuanet.com');
insert into customer (first_name,last_name,email) VALUES ('Rubina','Collingham','rcollinghammy@yolasite.com');
insert into customer (first_name,last_name,email) VALUES ('Gladys','Mancktelow','gmancktelowmz@shinystat.com');
insert into customer (first_name,last_name,email) VALUES ('Frank','Giacubbo','fgiacubbon0@census.gov');
insert into customer (first_name,last_name,email) VALUES ('Gretal','Kenzie','gkenzien1@loc.gov');
insert into customer (first_name,last_name,email) VALUES ('Bevin','Dobeson','bdobesonn2@wunderground.com');
insert into customer (first_name,last_name,email) VALUES ('Shirleen','Chadwick','schadwickn3@theglobeandmail.com');
insert into customer (first_name,last_name,email) VALUES ('Cornall','Kingdon','ckingdonn4@photobucket.com');
insert into customer (first_name,last_name,email) VALUES ('Sher','Nice','snicen5@boston.com');
insert into customer (first_name,last_name,email) VALUES ('Junie','Hellmore','jhellmoren6@state.tx.us');
insert into customer (first_name,last_name,email) VALUES ('Rudolf','Chesterfield','rchesterfieldn7@taobao.com');
insert into customer (first_name,last_name,email) VALUES ('Royce','Cardozo','rcardozon8@rediff.com');
insert into customer (first_name,last_name,email) VALUES ('Karoly','Breeder','kbreedern9@about.me');
insert into customer (first_name,last_name,email) VALUES ('Arlyn','Marco','amarcona@businessweek.com');
insert into customer (first_name,last_name,email) VALUES ('Daile','Allington','dallingtonnb@naver.com');
insert into customer (first_name,last_name,email) VALUES ('Syd','Blamires','sblamiresnc@dagondesign.com');
insert into customer (first_name,last_name,email) VALUES ('Allyce','McCusker','amccuskernd@diigo.com');
insert into customer (first_name,last_name,email) VALUES ('Tamera','Huddy','thuddyne@cdc.gov');
insert into customer (first_name,last_name,email) VALUES ('Winni','Hubberstey','whubbersteynf@hud.gov');
insert into customer (first_name,last_name,email) VALUES ('Patsy','Lepope','plepopeng@bloomberg.com');
insert into customer (first_name,last_name,email) VALUES ('Ynes','Crombie','ycrombienh@freewebs.com');
insert into customer (first_name,last_name,email) VALUES ('Bevan','Hearl','bhearlni@rakuten.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Merl','Khomin','mkhominnj@virginia.edu');
insert into customer (first_name,last_name,email) VALUES ('Andy','Di Franceschi','adifranceschink@gov.uk');
insert into customer (first_name,last_name,email) VALUES ('Sophia','Brunone','sbrunonenl@deliciousdays.com');
insert into customer (first_name,last_name,email) VALUES ('Berni','Nisuis','bnisuisnm@home.pl');
insert into customer (first_name,last_name,email) VALUES ('Melva','Ragg','mraggnn@slate.com');
insert into customer (first_name,last_name,email) VALUES ('Courtnay','Lathan','clathanno@addtoany.com');
insert into customer (first_name,last_name,email) VALUES ('Norbie','Harly','nharlynp@flavors.me');
insert into customer (first_name,last_name,email) VALUES ('Bevon','Jancic','bjancicnq@jalbum.net');
insert into customer (first_name,last_name,email) VALUES ('Rosemaria','Pettigrew','rpettigrewnr@hatena.ne.jp');
insert into customer (first_name,last_name,email) VALUES ('Ardith','Gladding','agladdingns@ucsd.edu');
insert into customer (first_name,last_name,email) VALUES ('Mandy','Heustace','mheustacent@nymag.com');
insert into customer (first_name,last_name,email) VALUES ('Cornall','Glancey','cglanceynu@naver.com');
insert into customer (first_name,last_name,email) VALUES ('Bronny','Braunds','bbraundsnv@hugedomains.com');
insert into customer (first_name,last_name,email) VALUES ('Christine','Elcombe','celcombenw@google.cn');
insert into customer (first_name,last_name,email) VALUES ('Deck','Glossup','dglossupnx@washington.edu');
insert into customer (first_name,last_name,email) VALUES ('Ellyn','Schober','eschoberny@sphinn.com');
insert into customer (first_name,last_name,email) VALUES ('Em','Heustace','eheustacenz@acquirethisname.com');
insert into customer (first_name,last_name,email) VALUES ('Langsdon','Jozef','ljozefo0@fastcompany.com');
insert into customer (first_name,last_name,email) VALUES ('Chickie','Snalham','csnalhamo1@redcross.org');
insert into customer (first_name,last_name,email) VALUES ('Ethelred','Broxup','ebroxupo2@qq.com');
insert into customer (first_name,last_name,email) VALUES ('Jacinthe','Angliss','janglisso3@yahoo.com');
insert into customer (first_name,last_name,email) VALUES ('Palm','Langwade','plangwadeo4@theguardian.com');
insert into customer (first_name,last_name,email) VALUES ('Ranna','Reckless','rrecklesso5@independent.co.uk');
insert into customer (first_name,last_name,email) VALUES ('Flossy','Hales','fhaleso6@rambler.ru');
insert into customer (first_name,last_name,email) VALUES ('Delcine','Morden','dmordeno7@wunderground.com');
insert into customer (first_name,last_name,email) VALUES ('Callida','Whitely','cwhitelyo8@diigo.com');
insert into customer (first_name,last_name,email) VALUES ('Wittie','Baggally','wbaggallyo9@cnn.com');
insert into customer (first_name,last_name,email) VALUES ('Romonda','Sammes','rsammesoa@hp.com');
insert into customer (first_name,last_name,email) VALUES ('Cord','Feronet','cferonetob@feedburner.com');
insert into customer (first_name,last_name,email) VALUES ('Melisa','Moyne','mmoyneoc@pbs.org');
insert into customer (first_name,last_name,email) VALUES ('Tabbie','Woolard','twoolardod@delicious.com');
insert into customer (first_name,last_name,email) VALUES ('Carma','Plaskitt','cplaskittoe@cyberchimps.com');
insert into customer (first_name,last_name,email) VALUES ('Earl','Annandale','eannandaleof@wp.com');
insert into customer (first_name,last_name,email) VALUES ('Lorne','Grisewood','lgrisewoodog@webnode.com');
insert into customer (first_name,last_name,email) VALUES ('Rolph','Jochanany','rjochananyoh@loc.gov');
insert into customer (first_name,last_name,email) VALUES ('Vick','Badger','vbadgeroi@vk.com');
insert into customer (first_name,last_name,email) VALUES ('Tanya','Soitoux','tsoitouxoj@bravesites.com');
insert into customer (first_name,last_name,email) VALUES ('Anne-corinne','Engelmann','aengelmannok@reddit.com');
insert into customer (first_name,last_name,email) VALUES ('Antonin','Maccraw','amaccrawol@nba.com');
insert into customer (first_name,last_name,email) VALUES ('Sheena','Dicey','sdiceyom@google.it');
insert into customer (first_name,last_name,email) VALUES ('Tyrus','Labbet','tlabbeton@example.com');
insert into customer (first_name,last_name,email) VALUES ('Mitchel','Bagnal','mbagnaloo@amazonaws.com');
insert into customer (first_name,last_name,email) VALUES ('Darci','Schenfisch','dschenfischop@ucoz.ru');
insert into customer (first_name,last_name,email) VALUES ('Frederico','Goodanew','fgoodanewoq@seesaa.net');
insert into customer (first_name,last_name,email) VALUES ('Stefa','Mowling','smowlingor@cdc.gov');
insert into customer (first_name,last_name,email) VALUES ('Innis','Gaisford','igaisfordos@google.de');
insert into customer (first_name,last_name,email) VALUES ('Brittan','Straker','bstrakerot@skyrock.com');
insert into customer (first_name,last_name,email) VALUES ('Geneva','Emblem','gemblemou@godaddy.com');
insert into customer (first_name,last_name,email) VALUES ('Gunilla','Vassar','gvassarov@joomla.org');
insert into customer (first_name,last_name,email) VALUES ('Bordie','Setch','bsetchow@delicious.com');
insert into customer (first_name,last_name,email) VALUES ('Hastings','Goodliff','hgoodliffox@ibm.com');
insert into customer (first_name,last_name,email) VALUES ('Danna','Kubat','dkubatoy@princeton.edu');
insert into customer (first_name,last_name,email) VALUES ('Tito','Belison','tbelisonoz@ucla.edu');
insert into customer (first_name,last_name,email) VALUES ('Lloyd','Cessford','lcessfordp0@nifty.com');
insert into customer (first_name,last_name,email) VALUES ('Marve','Losseljong','mlosseljongp1@digg.com');
insert into customer (first_name,last_name,email) VALUES ('Merwyn','Raubenheim','mraubenheimp2@wp.com');
insert into customer (first_name,last_name,email) VALUES ('Jessie','Fulton','jfultonp3@imgur.com');
insert into customer (first_name,last_name,email) VALUES ('Rockey','Gabbett','rgabbettp4@psu.edu');
insert into customer (first_name,last_name,email) VALUES ('Fredia','Bascombe','fbascombep5@wiley.com');
insert into customer (first_name,last_name,email) VALUES ('Cordy','Winwright','cwinwrightp6@t-online.de');
insert into customer (first_name,last_name,email) VALUES ('Camella','Dowe','cdowep7@deviantart.com');
insert into customer (first_name,last_name,email) VALUES ('Edmon','Acum','eacump8@mail.ru');
insert into customer (first_name,last_name,email) VALUES ('Ernestine','Kruschov','ekruschovp9@devhub.com');
insert into customer (first_name,last_name,email) VALUES ('Cesare','De Giorgi','cdegiorgipa@vk.com');
insert into customer (first_name,last_name,email) VALUES ('Loretta','Lortzing','llortzingpb@shutterfly.com');
insert into customer (first_name,last_name,email) VALUES ('Adrianne','Castelluzzi','acastelluzzipc@hexun.com');
insert into customer (first_name,last_name,email) VALUES ('Karry','Zelake','kzelakepd@plala.or.jp');
insert into customer (first_name,last_name,email) VALUES ('Rahal','Droogan','rdrooganpe@amazonaws.com');
insert into customer (first_name,last_name,email) VALUES ('Elisa','Bentley','ebentleypf@sciencedirect.com');
insert into customer (first_name,last_name,email) VALUES ('Anitra','Bunnell','abunnellpg@fema.gov');
insert into customer (first_name,last_name,email) VALUES ('Ingra','Bullivent','ibulliventph@1und1.de');
insert into customer (first_name,last_name,email) VALUES ('Chico','Gearty','cgeartypi@github.io');
insert into customer (first_name,last_name,email) VALUES ('Ellery','Tremolieres','etremolierespj@marriott.com');
insert into customer (first_name,last_name,email) VALUES ('Shawn','Trobey','strobeypk@slideshare.net');
insert into customer (first_name,last_name,email) VALUES ('Austin','Freeborn','afreebornpl@wikimedia.org');
insert into customer (first_name,last_name,email) VALUES ('Marilee','Pasque','mpasquepm@goo.ne.jp');
insert into customer (first_name,last_name,email) VALUES ('Heath','Clurow','hclurowpn@reddit.com');
insert into customer (first_name,last_name,email) VALUES ('Caye','Bartlomiej','cbartlomiejpo@google.es');
insert into customer (first_name,last_name,email) VALUES ('Neda','Rollo','nrollopp@vistaprint.com');
insert into customer (first_name,last_name,email) VALUES ('My','Charrington','mcharringtonpq@opensource.org');
insert into customer (first_name,last_name,email) VALUES ('Vivi','MacIntyre','vmacintyrepr@china.com.cn');
insert into customer (first_name,last_name,email) VALUES ('Emlynn','Haylands','ehaylandsps@ustream.tv');
insert into customer (first_name,last_name,email) VALUES ('Beltran','Newarte','bnewartept@independent.co.uk');
insert into customer (first_name,last_name,email) VALUES ('Stephie','Pidgin','spidginpu@sohu.com');
insert into customer (first_name,last_name,email) VALUES ('Kacie','Senten','ksentenpv@rakuten.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Chanda','Fawdry','cfawdrypw@devhub.com');
insert into customer (first_name,last_name,email) VALUES ('Elwin','Dimeloe','edimeloepx@vinaora.com');
insert into customer (first_name,last_name,email) VALUES ('Xena','Rickeard','xrickeardpy@deliciousdays.com');
insert into customer (first_name,last_name,email) VALUES ('Allin','Gelling','agellingpz@yahoo.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Kinny','Causier','kcausierq0@meetup.com');
insert into customer (first_name,last_name,email) VALUES ('Donall','Ferretti','dferrettiq1@pagesperso-orange.fr');
insert into customer (first_name,last_name,email) VALUES ('Gilberta','Mathissen','gmathissenq2@homestead.com');
insert into customer (first_name,last_name,email) VALUES ('Wilfred','Dizlie','wdizlieq3@prnewswire.com');
insert into customer (first_name,last_name,email) VALUES ('Myrtle','Tomasino','mtomasinoq4@gizmodo.com');
insert into customer (first_name,last_name,email) VALUES ('Jacquelynn','Loughlan','jloughlanq5@squidoo.com');
insert into customer (first_name,last_name,email) VALUES ('Cosmo','Borth','cborthq6@gmpg.org');
insert into customer (first_name,last_name,email) VALUES ('Arch','Ledbetter','aledbetterq7@cyberchimps.com');
insert into customer (first_name,last_name,email) VALUES ('Catha','Order','corderq8@clickbank.net');
insert into customer (first_name,last_name,email) VALUES ('Laurence','Frays','lfraysq9@unc.edu');
insert into customer (first_name,last_name,email) VALUES ('Katlin','Sedgemond','ksedgemondqa@xrea.com');
insert into customer (first_name,last_name,email) VALUES ('Mallorie','Tytterton','mtyttertonqb@163.com');
insert into customer (first_name,last_name,email) VALUES ('Falkner','Littlepage','flittlepageqc@soundcloud.com');
insert into customer (first_name,last_name,email) VALUES ('Weylin','Eadington','weadingtonqd@ezinearticles.com');
insert into customer (first_name,last_name,email) VALUES ('Ricky','Neubigging','rneubiggingqe@blog.com');
insert into customer (first_name,last_name,email) VALUES ('Nixie','Easby','neasbyqf@wordpress.com');
insert into customer (first_name,last_name,email) VALUES ('Johnny','Creebo','jcreeboqg@istockphoto.com');
insert into customer (first_name,last_name,email) VALUES ('Tommie','Hartmann','thartmannqh@ibm.com');
insert into customer (first_name,last_name,email) VALUES ('Tobias','MacGillavery','tmacgillaveryqi@wikispaces.com');
insert into customer (first_name,last_name,email) VALUES ('Philly','Dall','pdallqj@xing.com');
insert into customer (first_name,last_name,email) VALUES ('Delmer','Hay','dhayqk@columbia.edu');
insert into customer (first_name,last_name,email) VALUES ('Madelena','Kertess','mkertessql@about.me');
insert into customer (first_name,last_name,email) VALUES ('Corine','Skeete','cskeeteqm@ox.ac.uk');
insert into customer (first_name,last_name,email) VALUES ('Rana','Barrass','rbarrassqn@imgur.com');
insert into customer (first_name,last_name,email) VALUES ('Travis','Brearty','tbreartyqo@unesco.org');
insert into customer (first_name,last_name,email) VALUES ('Felix','Banfill','fbanfillqp@google.com');
insert into customer (first_name,last_name,email) VALUES ('Artemus','Payn','apaynqq@phoca.cz');
insert into customer (first_name,last_name,email) VALUES ('Dion','Brear','dbrearqr@hud.gov');
insert into customer (first_name,last_name,email) VALUES ('Lewie','Bransden','lbransdenqs@psu.edu');
insert into customer (first_name,last_name,email) VALUES ('Christa','Oty','cotyqt@lulu.com');
insert into customer (first_name,last_name,email) VALUES ('Bertram','Jullian','bjullianqu@vkontakte.ru');
insert into customer (first_name,last_name,email) VALUES ('Maynord','Florez','mflorezqv@google.co.jp');
insert into customer (first_name,last_name,email) VALUES ('Cirstoforo','Lehrmann','clehrmannqw@seattletimes.com');
insert into customer (first_name,last_name,email) VALUES ('Malissa','Giocannoni','mgiocannoniqx@reuters.com');
insert into customer (first_name,last_name,email) VALUES ('Minne','Maggiore','mmaggioreqy@woothemes.com');
insert into customer (first_name,last_name,email) VALUES ('Homere','Guerrero','hguerreroqz@smugmug.com');
insert into customer (first_name,last_name,email) VALUES ('Avigdor','Pavlenko','apavlenkor0@bloglines.com');
insert into customer (first_name,last_name,email) VALUES ('Davide','Divers','ddiversr1@mapquest.com');
insert into customer (first_name,last_name,email) VALUES ('Lawrence','Boow','lboowr2@nydailynews.com');
insert into customer (first_name,last_name,email) VALUES ('Kirby','Sanham','ksanhamr3@usa.gov');
insert into customer (first_name,last_name,email) VALUES ('Abie','Callar','acallarr4@deliciousdays.com');
insert into customer (first_name,last_name,email) VALUES ('Melvyn','Caselli','mcasellir5@simplemachines.org');
insert into customer (first_name,last_name,email) VALUES ('Bradan','Osbidston','bosbidstonr6@spiegel.de');
insert into customer (first_name,last_name,email) VALUES ('Cornall','Corssen','ccorssenr7@bloglines.com');
insert into customer (first_name,last_name,email) VALUES ('Johna','Domenicone','jdomeniconer8@slate.com');
insert into customer (first_name,last_name,email) VALUES ('Pammi','Ormonde','pormonder9@weather.com');
insert into customer (first_name,last_name,email) VALUES ('Alica','Mingaud','amingaudra@umich.edu');
insert into customer (first_name,last_name,email) VALUES ('Gayler','Hatcher','ghatcherrb@shutterfly.com');
insert into customer (first_name,last_name,email) VALUES ('Zeb','Enns','zennsrc@nyu.edu');
insert into customer (first_name,last_name,email) VALUES ('Francklyn','Windham','fwindhamrd@simplemachines.org');
insert into customer (first_name,last_name,email) VALUES ('Caryn','MacBean','cmacbeanre@wix.com');
insert into customer (first_name,last_name,email) VALUES ('Rickard','Dignan','rdignanrf@businessinsider.com');
insert into customer (first_name,last_name,email) VALUES ('Linet','Killshaw','lkillshawrg@admin.ch');
insert into customer (first_name,last_name,email) VALUES ('Lonni','Paish','lpaishrh@live.com');
insert into customer (first_name,last_name,email) VALUES ('Linn','Throughton','lthroughtonri@furl.net');
insert into customer (first_name,last_name,email) VALUES ('Morton','McKiddin','mmckiddinrj@shareasale.com');
insert into customer (first_name,last_name,email) VALUES ('Gweneth','Cartman','gcartmanrk@washingtonpost.com');
insert into customer (first_name,last_name,email) VALUES ('Aviva','Pietasch','apietaschrl@whitehouse.gov');
insert into customer (first_name,last_name,email) VALUES ('Abe','Bouldon','abouldonrm@umn.edu');
insert into customer (first_name,last_name,email) VALUES ('Jamie','Belliss','jbellissrn@blogs.com');
insert into customer (first_name,last_name,email) VALUES ('Kelila','Grubbe','kgrubbero@biblegateway.com');
insert into customer (first_name,last_name,email) VALUES ('Fulvia','Doubleday','fdoubledayrp@dot.gov');
insert into customer (first_name,last_name,email) VALUES ('Trever','Guitonneau','tguitonneaurq@ca.gov');
insert into customer (first_name,last_name,email) VALUES ('Emalee','Piolli','epiollirr@theglobeandmail.com');

insert into purchase (store_id, item_id, customer_id, total_quantity, price) values(1,1,1,0,0);

COMMIT;