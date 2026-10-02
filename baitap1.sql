USE QuanLyBanHang;

-- Bước 1: Thêm dữ liệu vào bảng Customer
INSERT INTO Customer (cID, Name, cAge)
VALUES
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);


-- Bước 2: Thêm dữ liệu vào bảng Order
INSERT INTO `Order` (oID, cID, oDate, oTotalPrice)
VALUES
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);


-- Bước 3: Thêm dữ liệu vào bảng Product
INSERT INTO Product (pID, pName, pPrice)
VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);


-- Bước 4: Thêm dữ liệu vào bảng OrderDetail
INSERT INTO OrderDetail (oID, pID, odQTY)
VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(2, 3, 8),
(2, 5, 4),
(3, 1, 1),
(3, 3, 3);


-- Bước 5: Hiển thị mã hóa đơn, ngày mua và tổng tiền
SELECT oID, oDate, oTotalPrice
FROM `Order`;


-- Bước 6: Hiển thị khách hàng đã mua hàng và sản phẩm được mua
SELECT DISTINCT c.Name, p.pName
FROM Customer c
JOIN `Order` o ON c.cID = o.cID
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON od.pID = p.pID;


-- Bước 7: Hiển thị tên khách hàng chưa mua bất kỳ sản phẩm nào
SELECT c.Name
FROM Customer c
LEFT JOIN `Order` o ON c.cID = o.cID
LEFT JOIN OrderDetail od ON o.oID = od.oID
WHERE od.oID IS NULL;


-- Bước 8: Hiển thị mã hóa đơn, ngày bán và tổng giá trị từng hóa đơn
SELECT o.oID, o.oDate,
       SUM(od.odQTY * p.pPrice) AS oPrice
FROM `Order` o
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;