USE `utcdemo`;
INSERT INTO `address`(add_country, add_city)
VALUES (N'Tây Hồ',    N'Hà Nội'),
       (N'Lạng Sơn',    N'Lạng Sơn');
INSERT INTO `guests`(g_first_name, g_last_name, g_idCard, g_credit_card, g_email,g_type,g_password, g_add_id,g_user_name)
VALUES (N'Đỗ',N'Lượng','03216','658751',N'doluong@gmail.com','GUESTS','$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',3,'doluong'),
       (N'TRần',N'Tuấn','89654', '6315726',N'trantuan@gmail.com','GUESTS','$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',4,'trantuan'),
       (N'Ngọc',N'Như','64821', '635179',N'ngocnhu@gmail.com','GUESTS','$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',5,'ngocnhu'),
       (N'Nguyễn',N'Nam','8943289', '465452',N'nguyennam@gmail.com','GUESTS','$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',6,'nguyennam'),
       (N'Văn ',N'Định','68429', '987264',N'vandinh@gmail.com','admin','$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',7,'vandinh'),
       (N'Mạnh',N'Dương','97618', '5316487',N'manhduong@gmail.com','admin','$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',9,'manhduong'),
       (N'Nguyễn ',N'Duyệt','53184', '658463',N'tranluat@gmail.com','admin','$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',10,'theduyet'),
       (N'Xuân',N'Đức','897564', '5658975',N'xuanduc@gmail.com','admin','$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',8,'xuanduc');

INSERT INTO `hotel`(h_name, h_email_address, h_website, h_description, h_roomCount, h_addId)
VALUES (N'Sheraton',           N'sheraton@gmail.com',     N'sheraton.vn',        N'Khách sạn Sheraton Hanoi đi vào hoạt động năm 2003....', 112,9),
       (N'Hotel De La Coupole',   N'delacoupole@gmail.com', N'delacouple.com',   N'Hotel De La Coupole Sapa được tọa lạc tại một vị trí vô cùng đắc địa...', 249,1),
       (N'InterContinental Hà Nội Westlake',              N'intercontinental@gmail.com',   N'intercontinental.vn',      N'Khách sạn InterContinental Hanoital Hanoi Westlake là sự  hàng tìm đến những giá trị...',180,9),
       (N'Paos Sapa Leisure Hotel',              N'paoleisure@gmail.com',   N'paoleisure.vn',      N'Là khách sạn 5 sao đầu tiên của Sapa chỉ vừa mới được khai trương hồi tháng 9/ 2017, Pao’s ...', 224,1),
       (N'Halong Paradise Suites',              N'halongparadies@gmail.com',   N'halongparadies.vn',      N'Khách sạn Halong Paradise Suites tọa lạc trên đảo Tuần Châu, thành phố ...',249,6),
       (N'Vinpearl Hotel Lạng Sơn',              N'vinpeallangson@gmail.com',   N'vinpearllangson.vn',      N'Tọa lạc tại trung tâm Thành phố Lạng Sơn với 21 tầng cao, Vinpearl Hotel .....', 164,10);
      
INSERT INTO `starrate`(sr_image, sr_hId)
VALUES 
       ('image',4),
       ('image',4),
       ('image',5),
       ('image',5),
       ('image',4),
       ('image',4),
       ('image',5),
       ('image',4),
       ('image',3);

INSERT INTO `hotelimage`(hi_image_name, hi_hId)
VALUES ('imgname',1),
('imgname',1),
('imgname',2),
('imgname',3),
('imgname',3),
('imgname',4),
('imgname',5),
('imgname',6),
('imgname',6),
('imgname',6),
('imgname',7),
('imgname',7),
('imgname',7),
('imgname',8),
('imgname',8),
('imgname',2),
('imgname',3),
('imgname',5);

INSERT INTO `roomtype`(rt_name, rt_cost, rt_description)
VALUES (N'Phong cao cap',  360000.00,  'resort');

INSERT INTO `room`(r_number, r_status, r_rtId, r_hId)
VALUES (2,'BOOKING',  1,1),
       (3,'DRUM',     2,2);

INSERT INTO `booking`(b_date, b_durationOfStay, b_checkInDate, b_checkOutDate, b_typePayment, b_totalRoom, b_hId, b_gId, b_totalAmount, b_status)
VALUES ('2021-04-12 00:00:00',3,'2021-04-12 00:00:00','2021-04-15 00:00:00','BAKING',2,1,2,7200000.00,'PAID'),
       ('2022-04-24 00:00:00',2,'2022-04-24 00:00:00','2022-04-26 00:00:00','DIRECT',3,2,1,6340000.00,'UNPAID');

INSERT INTO `roombook`(rb_rId, rb_bId)
VALUES (1,1),
       (2,2);
INSERT INTO `roomratediscount`(rrd_rate, rrd_startMonth, rrd_endMonth, rrd_rtId)
VALUES (5.00,'2020-04-02 00:00:00','2025-04-02 00:00:00',4),
	(4.00,'2020-04-02 00:00:00','2025-04-02 00:00:00',5),
    (4.00,'2020-04-02 00:00:00','2025-04-02 00:00:00',6),
    (4.00,'2020-04-02 00:00:00','2025-04-02 00:00:00',7),
       (5.00,'2021-02-02 00:00:00','2026-02-02 00:00:00',8);

INSERT INTO `hotelservices`(hs_name, hs_cost, hs_hId)
VALUES (N'Bể bơi bốn mùa ',   230000.00,1),
       (N'Đặc sản Tây Bắc',    342700.00,6),
       (N'Đồ ăn sáng',    500700.00,6),
       (N'Đồ ăn sáng',    500700.00,4),
        (N'Đồ ăn sáng',    500700.00,5),
		(N'Đồ ăn sáng',    500700.00,67),
      (N'Đặc sản Tây Bắc',    342700.00,6),
      (N'Khu vui chơi công viên nước',320000.00,3);

INSERT INTO `userservices`
VALUES (1,1),
       (2,2);