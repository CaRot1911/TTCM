USE `utcdemo`;

INSERT INTO `address`(add_country, add_city)
VALUES (N'Sapa',               N'Lào Cai'),
       (N'Y tý ',              N'Lào Cai'),
       (N'Phố cổ Đồng Văn',    N'Hà Giang'),
       (N'Thị TRấn Mèo Vạc',   N'Hà Giang'),
       (N'Thác Dải Yếm',       N'Mộc Châu'),
       (N'Hạ Long',            N'Quảng Ninh'),
       (N'Bán Đảo Sơn Trà',    N'Đà Nẵng'),
       (N'Bãi biển Mỹ Khê',    N'Đà Nẵng');

INSERT INTO `guests`(g_first_name, g_last_name, g_idCard, g_credit_card, g_email,g_type,g_password, g_add_id,g_user_name)
VALUES (N'Hoàng',N'Việt','000012','0321654',N'hoangviet@gmail.com','GUESTS','$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',1,'hoangviet'),
       (N'Thanh',N'Ngân','02335', '3535323',N'thanhngan@gmail.com','GUESTS','$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',2,'thanhngan');

INSERT INTO `hotel`(h_name, h_email_address, h_website, h_description, h_roomCount, h_addId)
VALUES (N'LuxuryHotel',           N'hotel@gmail.com',     N'lxury.vn',        N'Luxury là một trong những khách sạn ...',     12,1),
       (N'Hoàng Kiều Homestay',   N'hoangkieu@gmail.com', N'hoangkieu.com',   N'Hoàng kiều là một trong những homestay ...',  16,2),
       (N'Hải Đăng',              N'haidang@gmail.com',   N'haidang.vn',      N'Có vị trí đắc địa nhìn ra biển Hạ Long ...',  24,6);

INSERT INTO `starrate`(sr_image, sr_hId)
VALUES ('image',1),
       ('image',1),
       ('image',2),
       ('image',3);

INSERT INTO `hotelimage`(hi_image_name, hi_hId)
VALUES ('1',1),
       ('3',1),
       ('2',2),
       ('4',3);

INSERT INTO `roomtype`(rt_name, rt_cost, rt_description)
VALUES (N'luxury',        5300000.00, 'TRAVEL'),
       (N'phòng thường',  260000.00,  'RESORT');

INSERT INTO `roomratediscount`(rrd_rate, rrd_startMonth, rrd_endMonth, rrd_rtId)
VALUES (4.00,'2020-04-02 00:00:00','2025-04-02 00:00:00',1),
       (5.00,'2021-02-02 00:00:00','2026-02-02 00:00:00',2);

INSERT INTO `room`(r_number, r_status, r_rtId, r_hId)
VALUES (2,'BOOKING',  1,1),
       (3,'DRUM',     2,2);

INSERT INTO `booking`(b_date, b_durationOfStay, b_checkInDate, b_checkOutDate, b_typePayment, b_totalRoom, b_hId, b_gId, b_totalAmount, b_status)
VALUES ('2021-04-12 00:00:00',3,'2021-04-12 00:00:00','2021-04-15 00:00:00','BAKING',2,1,2,7200000.00,'PAID'),
       ('2022-04-24 00:00:00',2,'2022-04-24 00:00:00','2022-04-26 00:00:00','DIRECT',3,2,1,6340000.00,'UNPAID');

INSERT INTO `roombook`(rb_rId, rb_bId)
VALUES (1,1),
       (2,2);

INSERT INTO `hotelservices`(hs_name, hs_cost, hs_hId)
VALUES (N'Hoàng Phong',   230000.00,1),
       (N'Hải Đăng',      342700.00,2),
       (N'Hoàng Kiều',    320000.00,3);

INSERT INTO `userservices`
VALUES (1,1),
       (2,2);