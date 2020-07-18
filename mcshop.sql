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
INSERT INTO product VALUES 
(DEFAULT, '10 hours', 'SSD: 256 GB', 'Mac OS', '3.5 GHz', 'Intel Core i5', 'MacBook 1', 'Apple MacBook Air 2020 i5 1.1GHz/8GB/256GB (Z0YL)',
30990000,'resources/img/macbook1.jpg','8 GB','13.3 inch', 'Intel Iris Plus Graphics', '1.29 kg', 'Bluetooth v5.0, Wi-Fi 802.11 a/b/g/n/ac', 1)
;
INSERT INTO product VALUES 
(DEFAULT, 'Li-Ion 2 cell', 'SSD 512 GB M.2 PCIe', 'Windows 10 Home SL', '3.6 GHz', 'Intel Core i5', 'Asus 1', 'Asus VivoBook X409JA i5 1035G1/8GB/512GB/Win10 (EK052T)',
15490000,'resources/img/asus1.jpg','8 GB','14 inch', 'Intel UHD Graphics', '1.47 kg', 'Bluetooth v5.0, Wi-Fi 802.11 a/b/g/n/ac', 2)
;
INSERT INTO product VALUES 
(DEFAULT, 'Li-Ion 3 cell', 'SSD 512 GB M.2 PCIe', 'Windows 10 Home SL', '3.6 GHz', 'Intel Core i5', 'HP 1', 'HP 15s fq1105TU i5 1035G1/8GB/512GB/Win10 (193P7PA)',
16490000,'resources/img/hp1.jpg','8 GB','15.6 inch', 'Intel UHD Graphics', '1.69 kg', 'Bluetooth 4.2, Wi-Fi 802.11 a/b/g/n/ac', 3)
;
INSERT INTO product VALUES 
(DEFAULT, 'Li-Ion 2 cell', 'SSD 512 GB M.2 PCIe', 'Windows 10 Home SL', '4.6 GHz', 'Intel Core i7', 'Lenovo 1', 'Lenovo Ideapad S145 15IWL i7 8565U/8GB/512GB/2GB MX110/Win10 (81MV00TAVN)',
17190000,'resources/img/lenovo1.jpg','8 GB','15.6 inch', 'NVIDIA GeForce MX110, 2GB', '1.73 kg', 'Bluetooth 4.1, Wi-Fi 802.11 a/b/g/n/ac', 4)
;
INSERT INTO product VALUES 
(DEFAULT, 'Li-Ion 4 cell', 'SSD 512 GB M.2 PCIe', 'Windows 10 Home SL', '5.1 GHz', 'Intel Core i7', 'Acer 1', 'Acer Predator Triton 500 PT515 52 75FR i7 10875H/32GB/512GB/8GB RTX2070/Win10 (NH.Q6YSV.002)',
54990000,'resources/img/acer1.jpg','32 GB','15.6 inch', 'NVIDIA® GeForce RTX™ 2070, 8GB-GDDR6', '2.1 kg', 'Wi-Fi 6 - 802.11ax, Bluetooth v5.0', 5)
;
INSERT INTO product VALUES 
(DEFAULT, 'Li-Ion 3 cell', 'SSD 256GB NVMe PCIe', 'Windows 10 Home SL', '4.9 GHz', 'Intel Core i7', 'Dell 1', 'Dell Vostro 3590 i7 10510U/8GB/256GB/2GB 610R5/Win10 (GRMGK2)',
20990000,'resources/img/dell1.jpg','8 GB','15.6 inch', 'AMD Radeon 610R5, 2GB', '1.99 kg', 'Bluetooth v5.0, Wi-Fi 802.11 a/b/g/n/ac', 6)
;
INSERT INTO product VALUES 
(DEFAULT, 'Li-Ion 3 cell', 'SSD 256GB NVMe PCIe', 'Windows 10 Home SL', '3.7 GHz', 'AMD Ryzen 5', 'Huawei 1', 'Huawei MateBook D 15 R5 3500U 8GB/256GB+1TB/Win10 (Boh-WAQ9R)',
15490000,'resources/img/huawei1.jpg','8 GB','15.6 inch', 'AMD Radeon Vega 8 Graphics', '1.62 kg', 'Bluetooth v5.0, Wi-Fi 802.11 a/b/g/n/ac', 7)
;

-- Insert MacBook
INSERT INTO product VALUES 
(DEFAULT, '10 hours', 'SSD 256GB NVMe PCIe', 'Mac OS', '4.1 GHz', 'Intel Core i5', 'MacBook 2', 'Laptop Apple Macbook Pro 2019 Touch i5 2.4GHz/8GB/256GB (MV962SA/A)',
39490000,'resources/img/macbook2.jpg','8 GB','13.3 inch', 'Intel Iris Plus Graphics 655', '	1.37 kg', 'Bluetooth 4.2, Wi-Fi 802.11 a/b/g/n/ac', 1)
;
-- Insert Asus
INSERT INTO product VALUES 
(DEFAULT, 'Li-Ion 3 cell', 'SSD 512 GB M.2 PCIe', 'Windows 10 Home SL', '4.6 GHz', 'Intel Core i7', 'Asus 2', 'Laptop Asus ZenBook Edition 30 UX334FL i7 8565U/8GB/512GB/2GB MX250/Túi/Chuột/Win10 (A4057T)',
34990000,'resources/img/asus2.jpg','8 GB','13.3 inch', 'NVIDIA GeForce MX250 2GB', '1.35 kg', '	Bluetooth v5.0, Wi-Fi 802.11 a/b/g/n/ac', 2)
;
-- Insert HP
INSERT INTO product VALUES 
(DEFAULT, 'Li-Ion 3 cell', 'HDD: 1 TB SATA3', 'Windows 10 Home SL', '2.7 GHz', 'Intel Pentium', 'HP 2', 'Laptop HP 15s du0058TU N5000/4GB/1TB/Win10 (6ZF55PA)',
7990000,'resources/img/hp2.jpg','4 GB','15.6 inch', 'Intel® UHD Graphics 605', '1.74 kg', 'Bluetooth 4.2, Wi-Fi 802.11 a/b/g/n/ac', 3)
;
-- Insert Lenovo
INSERT INTO product VALUES 
(DEFAULT, 'Li-Ion 3 cell', 'HDD: 1 TB SATA3', 'Windows 10 Home SL', '3.9 GHz', 'Intel Core i3', 'Lenovo 2', 'Laptop Lenovo Ideapad S340 14IWL i3 8145U/8GB/1TB/Win10 (81N70064VN)',
9590000,'resources/img/lenovo2.jpg','8 GB','14 inch', 'Intel® UHD Graphics 620', '1.55 kg', 'Bluetooth 4.1, Wi-Fi 802.11 a/b/g/n', 4)
;
-- Insert Promotion
INSERT INTO promotion VALUES 
(DEFAULT, 0.2, '2020-08-17', 'Khuyen mai cho MacBook', '2020-07-17'),
(DEFAULT, 0.1, '2020-08-17', 'Khuyen mai cho Asus', '2020-07-17'),
(DEFAULT, 0.5, '2020-06-15', 'Khuyen mai cho HP', '2020-05-15')
;
-- Insert Promotion
INSERT INTO promotion_detail VALUES 
(DEFAULT, 1, 1),
(DEFAULT, 8, 1),
(DEFAULT, 2, 2),
(DEFAULT, 9, 2),
(DEFAULT, 3, 3),
(DEFAULT, 10, 3)
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
FROM promotion_detail 
;


