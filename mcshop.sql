-- Xóa CSDL mcshop (nếu có)
DROP DATABASE IF EXISTS mcshop;
-- Tạo CSDL
CREATE DATABASE mcshop;
-- Sử dụng CSDL
USE mcshop;
-- Insert dữ liệu
INSERT INTO brand VALUES 
(DEFAULT, 'This is Macbook laptop','Macbook'),
(DEFAULT, 'This is Asus laptop','Asus'),
(DEFAULT, 'This is HP laptop','HP'),
(DEFAULT, 'This is Lenovo laptop','Lenovo'),
(DEFAULT, 'This is Acer laptop','Acer'),
(DEFAULT, 'This is Dell laptop','Dell'),
(DEFAULT, 'This is Huawei laptop','Huawei')
;
-- 1
INSERT INTO product VALUES 
(DEFAULT, '10 hours', 'SSD: 256 GB', 'Mac OS', '3.5 GHz', 'Intel Core i5', 'MacBook 1 - MacBook is a term used for a brand of Mac notebook computers that Apple started producing in 2006. The American multinational corporation created MacBook computers when it consolidated its PowerBook and iBook', 'MacBook Air 2020',
30990000,'resources/img/macbook1.jpg','8 GB','13.3 inch', 'Intel Iris Plus Graphics', '1.29 kg', 'Bluetooth v5.0, Wi-Fi 802.11 a/b/g/n/ac', 1),

(DEFAULT, 'Li-Ion 2 cell', 'SSD 512 GB M.2 PCIe', 'Windows 10 Home SL', '3.6 GHz', 'Intel Core i5', 'Asus 1 - Established in 1989, ASUS is a multinational company known for the world’s best motherboards and high-quality personal computers, monitors, graphics cards, routers and other technology solutions.', 'Asus VivoBook X409JA',
15490000,'resources/img/asus1.jpg','8 GB','14 inch', 'Intel UHD Graphics', '1.47 kg', 'Bluetooth v5.0, Wi-Fi 802.11 a/b/g/n/ac', 2),

(DEFAULT, 'Li-Ion 3 cell', 'SSD 512 GB M.2 PCIe', 'Windows 10 Home SL', '3.6 GHz', 'Intel Core i5', 'HP 1 - Our vision is to create technology that makes life better for everyone, everywhere — every person, every organization, and every community around the globe. This motivates us — inspires us — to do what we do. This is our calling. This is a new HP.', 'HP 15s',
16490000,'resources/img/hp1.jpg','8 GB','15.6 inch', 'Intel UHD Graphics', '1.69 kg', 'Bluetooth 4.2, Wi-Fi 802.11 a/b/g/n/ac', 3),

(DEFAULT, 'Li-Ion 2 cell', 'SSD 512 GB M.2 PCIe', 'Windows 10 Home SL', '4.6 GHz', 'Intel Core i7', 'Lenovo 1 - Lenovo is innovating to lead in the PC+ Era. Already the worlds leading PC company, Lenovo is also a leader in smartphones and tablets as it works to become one of the most respected technology companies in the world.', 'Lenovo Ideapad S145',
17190000,'resources/img/lenovo1.jpg','8 GB','15.6 inch', 'NVIDIA GeForce MX110, 2GB', '1.73 kg', 'Bluetooth 4.1, Wi-Fi 802.11 a/b/g/n/ac', 4),

(DEFAULT, 'Li-Ion 4 cell', 'SSD 512 GB M.2 PCIe', 'Windows 10 Home SL', '5.1 GHz', 'Intel Core i7', 'Acer 1 - Acer is organized into two main businesses. They include the New Core Business, which is dedicated to the research, design, marketing, sale, and support of IT products, and the New Value Creation Business, which encompasses its Build Your Own Cloud (BYOC™) and e-Business operations.', 'Acer Predator Triton',
54990000,'resources/img/acer1.jpg','32 GB','15.6 inch', 'NVIDIA® GeForce RTX™ 2070, 8GB-GDDR6', '2.1 kg', 'Wi-Fi 6 - 802.11ax, Bluetooth v5.0', 5),

(DEFAULT, 'Li-Ion 3 cell', 'SSD 256GB NVMe PCIe', 'Windows 10 Home SL', '4.9 GHz', 'Intel Core i7', 'Dell 1 - Dell is an American multinational computer technology company that develops, sells, repairs, and supports computers and related products and services. Named after its founder, Michael Dell, the company is one of the largest technological corporations in the world, employing more than 165,000 people in the U.S. and around the world (Annual report 2020).', 'Dell Vostro 3590',
20990000,'resources/img/dell1.jpg','8 GB','15.6 inch', 'AMD Radeon 610R5, 2GB', '1.99 kg', 'Bluetooth v5.0, Wi-Fi 802.11 a/b/g/n/ac', 6),

(DEFAULT, 'Li-Ion 3 cell', 'SSD 256GB NVMe PCIe', 'Windows 10 Home SL', '3.7 GHz', 'AMD Ryzen 5', 'Huawei 1 - Huawei is a Chinese information and communications technology (ICT)  company that specializes in telecommunications equipment. The company also offers services and consumer electronics including wearables, mobile broadband modems, smartphones, tablets and PCs.', 'Huawei MateBook D 15',
15490000,'resources/img/huawei1.jpg','8 GB','15.6 inch', 'AMD Radeon Vega 8 Graphics', '1.62 kg', 'Bluetooth v5.0, Wi-Fi 802.11 a/b/g/n/ac', 7),

(DEFAULT, '10 hours', 'SSD 256GB NVMe PCIe', 'Mac OS', '4.1 GHz', 'Intel Core i5', 'MacBook 2 - MacBook is a term used for a brand of Mac notebook computers that Apple started producing in 2006. The American multinational corporation created MacBook computers when it consolidated its PowerBook and iBook lines during its transition to Intel processor-based products.', 'Macbook Pro 2019',
39490000,'resources/img/macbook2.jpg','8 GB','13.3 inch', 'Intel Iris Plus Graphics 655', '1.37 kg', 'Bluetooth 4.2, Wi-Fi 802.11 a/b/g/n/ac', 1),

(DEFAULT, 'Li-Ion 3 cell', 'SSD 512 GB M.2 PCIe', 'Windows 10 Home SL', '4.6 GHz', 'Intel Core i7', 'Asus 2 - Established in 1989, ASUS is a multinational company known for the world’s best motherboards and high-quality personal computers, monitors, graphics cards, routers and other technology solutions. Today, ASUS is designing and building next-generation smart technologies to provide incredible experiences that enhance the lives of people everywhere.', 'Asus ZenBook 30',
34990000,'resources/img/asus2.jpg','8 GB','13.3 inch', 'NVIDIA GeForce MX250 2GB', '1.35 kg', '	Bluetooth v5.0, Wi-Fi 802.11 a/b/g/n/ac', 2),

(DEFAULT, 'Li-Ion 3 cell', 'HDD: 1 TB SATA3', 'Windows 10 Home SL', '2.7 GHz', 'Intel Pentium', 'HP 2 - Our vision is to create technology that makes life better for everyone, everywhere — every person, every organization, and every community around the globe. This motivates us — inspires us — to do what we do. This is our calling. This is a new HP.', 'HP 15s',
7990000,'resources/img/hp2.jpg','4 GB','15.6 inch', 'Intel® UHD Graphics 605', '1.74 kg', 'Bluetooth 4.2, Wi-Fi 802.11 a/b/g/n/ac', 3),

(DEFAULT, 'Li-Ion 3 cell', 'HDD: 1 TB SATA3', 'Windows 10 Home SL', '3.9 GHz', 'Intel Core i3', 'Lenovo 2 - Lenovo is innovating to lead in the PC+ Era. Already the worlds leading PC company, Lenovo is also a leader in smartphones and tablets as it works to become one of the most respected technology companies in the world.', 'Lenovo Ideapad',
9590000,'resources/img/lenovo2.jpg','8 GB','14 inch', 'Intel® UHD Graphics 620', '1.55 kg', 'Bluetooth 4.1, Wi-Fi 802.11 a/b/g/n', 4),

(DEFAULT, 'Li-Ion 4 cell', 'SSD 512 GB M.2 PCIe', 'Windows 10 Home SL', '5.1 GHz', 'Intel Core i7', 'Acer 2 - Acer is organized into two main businesses. They include the New Core Business, which is dedicated to the research, design, marketing, sale, and support of IT products, and the New Value Creation Business, which encompasses its Build Your Own Cloud (BYOC™) and e-Business operations.', 'Acer Aspire A515',
17990000,'resources/img/acer2.jpg','32 GB','15.6 inch', 'NVIDIA® GeForce RTX™ 2070, 8GB-GDDR6', '2.1 kg', 'Wi-Fi 6 - 802.11ax, Bluetooth v5.0', 5),

(DEFAULT, 'Li-Ion 3 cell', 'SSD 256GB NVMe PCIe', 'Windows 10 Home SL', '4.9 GHz', 'Intel Core i7', 'Dell 2 - Dell is an American multinational computer technology company that develops, sells, repairs, and supports computers and related products and services. Named after its founder, Michael Dell, the company is one of the largest technological corporations in the world, employing more than 165,000 people in the U.S. and around the world (Annual report 2020).', 'Dell Inspiron 3580',
23990000,'resources/img/dell2.jpg','8 GB','15.6 inch', 'AMD Radeon 610R5, 2GB', '1.99 kg', 'Bluetooth v5.0, Wi-Fi 802.11 a/b/g/n/ac', 6),

(DEFAULT, 'Li-Ion 3 cell', 'SSD 256GB NVMe PCIe', 'Windows 10 Home SL', '3.7 GHz', 'AMD Ryzen 5', 'Huawei 2 - Huawei is a Chinese information and communications technology (ICT)  company that specializes in telecommunications equipment. The company also offers services and consumer electronics including wearables, mobile broadband modems, smartphones, tablets and PCs.', 'Huawei MateBook X',
30490000,'resources/img/huawei2.jpg','8 GB','15.6 inch', 'AMD Radeon Vega 8 Graphics', '1.62 kg', 'Bluetooth v5.0, Wi-Fi 802.11 a/b/g/n/ac', 7),

(DEFAULT, '10 hours', 'SSD 256GB NVMe PCIe', 'Mac OS', '4.1 GHz', 'Intel Core i7', 'MacBook 3 - MacBook is a term used for a brand of Mac notebook computers that Apple started producing in 2006. The American multinational corporation created MacBook computers when it consolidated its PowerBook and iBook lines during its transition to Intel processor-based products.', 'MacBook Touch 2020',
47990000,'resources/img/macbook3.jpg','8 GB','14 inch', 'Intel Iris Plus Graphics 655', '1.37 kg', 'Bluetooth 4.2, Wi-Fi 802.11 a/b/g/n/ac', 1)
;

-- Insert product_image
INSERT INTO product_image VALUES
(DEFAULT, 'resources/img/macbook3-1.jpg', 1,NULL),
(DEFAULT, 'resources/img/macbook3-2.jpg', 1,NULL),
(DEFAULT, 'resources/img/macbook3-3.jpg', 1,NULL),
(DEFAULT, 'resources/img/macbook3-4.jpg', 1,NULL),

(DEFAULT, 'resources/img/asus1-1.jpg', 2,NULL),
(DEFAULT, 'resources/img/asus1-2.jpg', 2,NULL),
(DEFAULT, 'resources/img/asus1-3.jpg', 2,NULL),
(DEFAULT, 'resources/img/asus1-4.jpg', 2,NULL),

(DEFAULT, 'resources/img/hp1-1.jpg', 3,NULL),
(DEFAULT, 'resources/img/hp1-2.jpg', 3,NULL),
(DEFAULT, 'resources/img/hp1-3.jpg', 3,NULL),
(DEFAULT, 'resources/img/hp1-4.jpg', 3,NULL),

(DEFAULT, 'resources/img/lenovo1-1.jpg', 4,NULL),
(DEFAULT, 'resources/img/lenovo1-2.jpg', 4,NULL),
(DEFAULT, 'resources/img/lenovo1-3.jpg', 4,NULL),
(DEFAULT, 'resources/img/lenovo1-4.jpg', 4,NULL),

(DEFAULT, 'resources/img/acer1-1.jpg', 5,NULL),
(DEFAULT, 'resources/img/acer1-2.jpg', 5,NULL),
(DEFAULT, 'resources/img/acer1-3.jpg', 5,NULL),
(DEFAULT, 'resources/img/acer1-4.jpg', 5,NULL),

(DEFAULT, 'resources/img/dell1-1.jpg', 6,NULL),
(DEFAULT, 'resources/img/dell1-2.jpg', 6,NULL),
(DEFAULT, 'resources/img/dell1-3.jpg', 6,NULL),
(DEFAULT, 'resources/img/dell1-4.jpg', 6,NULL),

(DEFAULT, 'resources/img/huawei1-1.jpg', 7,NULL),
(DEFAULT, 'resources/img/huawei1-2.jpg', 7,NULL),
(DEFAULT, 'resources/img/huawei1-3.jpg', 7,NULL),
(DEFAULT, 'resources/img/huawei1-4.jpg', 7,NULL),

(DEFAULT, 'resources/img/macbook3-1.jpg', 8,NULL),
(DEFAULT, 'resources/img/macbook3-2.jpg', 8,NULL),
(DEFAULT, 'resources/img/macbook3-3.jpg', 8,NULL),
(DEFAULT, 'resources/img/macbook3-4.jpg', 8,NULL),

(DEFAULT, 'resources/img/asus1-1.jpg', 9,NULL),
(DEFAULT, 'resources/img/asus1-2.jpg', 9,NULL),
(DEFAULT, 'resources/img/asus1-3.jpg', 9,NULL),
(DEFAULT, 'resources/img/asus1-4.jpg', 9,NULL),

(DEFAULT, 'resources/img/hp1-1.jpg', 10,NULL),
(DEFAULT, 'resources/img/hp1-2.jpg', 10,NULL),
(DEFAULT, 'resources/img/hp1-3.jpg', 10,NULL),
(DEFAULT, 'resources/img/hp1-4.jpg', 10,NULL),

(DEFAULT, 'resources/img/lenovo1-1.jpg', 11,NULL),
(DEFAULT, 'resources/img/lenovo1-2.jpg', 11,NULL),
(DEFAULT, 'resources/img/lenovo1-3.jpg', 11,NULL),
(DEFAULT, 'resources/img/lenovo1-4.jpg', 11,NULL),

(DEFAULT, 'resources/img/acer1-1.jpg', 12,NULL),
(DEFAULT, 'resources/img/acer1-2.jpg', 12,NULL),
(DEFAULT, 'resources/img/acer1-3.jpg', 12,NULL),
(DEFAULT, 'resources/img/acer1-4.jpg', 12,NULL),

(DEFAULT, 'resources/img/dell1-1.jpg', 13,NULL),
(DEFAULT, 'resources/img/dell1-2.jpg', 13,NULL),
(DEFAULT, 'resources/img/dell1-3.jpg', 13,NULL),
(DEFAULT, 'resources/img/dell1-4.jpg', 13,NULL),

(DEFAULT, 'resources/img/huawei1-1.jpg', 14,NULL),
(DEFAULT, 'resources/img/huawei1-2.jpg', 14,NULL),
(DEFAULT, 'resources/img/huawei1-3.jpg', 14,NULL),
(DEFAULT, 'resources/img/huawei1-4.jpg', 14,NULL),

(DEFAULT, 'resources/img/macbook3-1.jpg', 15,NULL),
(DEFAULT, 'resources/img/macbook3-2.jpg', 15,NULL),
(DEFAULT, 'resources/img/macbook3-3.jpg', 15,NULL),
(DEFAULT, 'resources/img/macbook3-4.jpg', 15,NULL)
;
-- Insert Promotion
INSERT INTO promotion VALUES 
(DEFAULT, 0.2, '2020-08-17', 'Khuyen mai cho MacBook', '2020-07-17'),
(DEFAULT, 0.1, '2020-08-17', 'Khuyen mai cho Asus', '2020-07-17'),
(DEFAULT, 0.5, '2020-06-15', 'Khuyen mai cho HP', '2020-05-15')
;
-- Insert Promotion Detail
INSERT INTO promotion_detail VALUES 
(DEFAULT, 1, 1),
(DEFAULT, 8, 1),
(DEFAULT, 15, 1),
(DEFAULT, 2, 2),
(DEFAULT, 9, 2),
(DEFAULT, 3, 3),
(DEFAULT, 10, 3)
;

-- Insert Promotion image
INSERT INTO product_image VALUES
(DEFAULT, 'resources/img/macbook-pm1.jpg', NULL, 1),
(DEFAULT, 'resources/img/macbook-pm2.jpg', NULL, 1),
(DEFAULT, 'resources/img/asus-pm1.jpg', NULL, 2),
(DEFAULT, 'resources/img/asus-pm2.jpg', NULL, 2),
(DEFAULT, 'resources/img/hp-pm1.jpg', NULL, 3),
(DEFAULT, 'resources/img/hp-pm2.jpg', NULL, 3)
;

-- Trả về số product_image có khuyến mãi trong time này.
SELECT COUNT(*)
FROM product_image pi
INNER JOIN promotion p
ON pi.promotion_id = p.id
WHERE CURTIME() 
BETWEEN p.start_date
AND p.end_date
;
-- Trả về list product_image có khuyến mãi trong time này.
SELECT *
FROM product_image pi
INNER JOIN promotion p
ON pi.promotion_id = p.id
WHERE CURTIME() 
BETWEEN p.start_date
AND p.end_date
;


SELECT pd.id, pd.product_id, pd.promotion_id
FROM promotion p
INNER JOIN promotion_detail pd
ON p.id = pd.product_id
WHERE pd.product_id = 1 
AND CURTIME() 
BETWEEN p.start_date
AND p.end_date
;

SELECT pd.id, pd.product_id, pd.promotion_id
FROM promotion p
INNER JOIN promotion_detail pd
ON p.id = pd.promotion_id
WHERE CURTIME() 
BETWEEN p.start_date
AND p.end_date
;
SELECT *
FROM product
WHERE id NOT IN (
SELECT pd.product_id
FROM promotion p
INNER JOIN promotion_detail pd
ON p.id = pd.promotion_id
WHERE CURTIME() 
BETWEEN p.start_date
AND p.end_date
)
;
-- Search product by Name
SELECT *
FROM product
WHERE product_name LIKE '%book%'
;

-- Find product hot
SELECT p.battery, p.brandId, p.hard_drive_capacity, p.operating_system, p.id, p.processor_speed, p.processor_type, p.product_description,
p.product_name, p.product_price, p.product_url_image, p.ram_memory, p.screen_size, p.video_graphics_adaptor, p.weight, p.wireless_technology
FROM orders_detail o
INNER JOIN product p
ON o.product_id = p.id
GROUP BY o.product_id
ORDER BY o.quantity*COUNT(*) 
DESC
LIMIT 5
;

SELECT *, COUNT(*), quantity*COUNT(*)
FROM orders_detail 
GROUP BY product_id
ORDER BY quantity*COUNT(*)
DESC
;

-- Find Account by email , pass
SELECT *
FROM account
WHERE email = 'yinyang1011@gmail.com' 
AND password = '123456'
;
-- Tim san pham theo Account Id
SELECT * 
FROM orders
WHERE account_id = 10
;



