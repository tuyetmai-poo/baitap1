USE QuanLySinhVien;

-- 1. Hiển thị sinh viên có tên bắt đầu bằng chữ 'h'
SELECT *
FROM Student
WHERE StudentName LIKE 'h%';

-- 2. Hiển thị thông tin lớp học có thời gian bắt đầu vào tháng 12
SELECT *
FROM Class
WHERE MONTH(StartDate) = 12;

-- 3. Hiển thị môn học có Credit từ 3 đến 5
SELECT *
FROM Subject
WHERE Credit BETWEEN 3 AND 5;

-- 4. Thay đổi ClassID của sinh viên tên Hung thành 2
UPDATE Student
SET ClassID = 2
WHERE StudentName = 'Hung';

-- 5. Hiển thị tên sinh viên, tên môn học và điểm thi
-- Sắp xếp điểm giảm dần, nếu trùng điểm thì tên tăng dần
SELECT S.StudentName, Sub.SubName, M.Mark
FROM Student S
JOIN Mark M ON S.StudentID = M.StudentID
JOIN Subject Sub ON M.SubID = Sub.SubID
ORDER BY M.Mark DESC, S.StudentName ASC;