-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 29, 2024 lúc 11:19 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duy`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblbaiviet`
--

CREATE TABLE `tblbaiviet` (
  `Mabaiviet` int(11) NOT NULL,
  `Noidung` text NOT NULL,
  `Machude` int(11) NOT NULL,
  `Ngaytao` date NOT NULL,
  `Teptin` varchar(255) DEFAULT NULL,
  `Username` varchar(50) NOT NULL,
  `Trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblbaiviet`
--

INSERT INTO `tblbaiviet` (`Mabaiviet`, `Noidung`, `Machude`, `Ngaytao`, `Teptin`, `Username`, `Trangthai`) VALUES
(8, 'Anh chị cho em hỏi làm sao để học tập hiệu quả hơn?', 1, '2024-12-29', NULL, 'duy', 0),
(9, 'Anh chị cho em hỏi làm thế nào để xác định ngành nghề phù hợp với bản thân?', 2, '2024-12-29', NULL, 'duy', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblbinhluan`
--

CREATE TABLE `tblbinhluan` (
  `Mabinhluan` int(11) NOT NULL,
  `Noidung` text NOT NULL,
  `Mabaiviet` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Ngaytao` date NOT NULL,
  `Trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblchude`
--

CREATE TABLE `tblchude` (
  `Machude` int(11) NOT NULL,
  `Tenchude` text NOT NULL,
  `Trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblchude`
--

INSERT INTO `tblchude` (`Machude`, `Tenchude`, `Trangthai`) VALUES
(1, 'Phương pháp học tập hiệu quả', 0),
(2, 'Hướng nghiệp và phát triển kỹ năng', 0),
(3, 'Sức khỏe thể chất và tinh thần', 0),
(4, 'Hoạt động ngoại khóa và giao lưu', 0),
(5, 'Đời sống và trải nghiệm sinh viên', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcontact`
--

CREATE TABLE `tblcontact` (
  `id` int(11) NOT NULL,
  `Tennguoigui` varchar(100) NOT NULL,
  `Noidung` text NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Ngaygui` date NOT NULL,
  `Trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblcontact`
--

INSERT INTO `tblcontact` (`id`, `Tennguoigui`, `Noidung`, `Email`, `Ngaygui`, `Trangthai`) VALUES
(4, 'Lê Hà Duy', 'Kiểm tra và sửa lỗi của website kỹ lưỡng vào ', 'lehaduy2004@gmail.com', '2024-12-29', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblslideshow`
--

CREATE TABLE `tblslideshow` (
  `Id` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `ImageUrl` varchar(255) NOT NULL,
  `Status` int(11) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tblslideshow`
--

INSERT INTO `tblslideshow` (`Id`, `Title`, `Description`, `ImageUrl`, `Status`, `username`) VALUES
(7, '', '', 'images/101banner-facebook-scaled.jpg', 0, ''),
(8, '', '', 'images/745banner 2.jpg', 0, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbluser`
--

CREATE TABLE `tbluser` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `gender` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbluser`
--

INSERT INTO `tbluser` (`username`, `password`, `fullname`, `gender`, `email`, `avatar`, `role`, `status`) VALUES
('duy', '5dc6da3adfe8ccf1287a98c0a8f74496', 'le ha duy', 0, 'lehaduy2004@gmail.com', '175906369_800292980906077_319272073812101204_n.jpg', 1, 0),
('hduy', '4399ff68d9fb07881ccb591b6d7701a2', 'Ha Duy', 0, 'lehaduyyy2004@gmail.com', '', 0, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tblbaiviet`
--
ALTER TABLE `tblbaiviet`
  ADD PRIMARY KEY (`Mabaiviet`);

--
-- Chỉ mục cho bảng `tblbinhluan`
--
ALTER TABLE `tblbinhluan`
  ADD PRIMARY KEY (`Mabinhluan`);

--
-- Chỉ mục cho bảng `tblchude`
--
ALTER TABLE `tblchude`
  ADD PRIMARY KEY (`Machude`);

--
-- Chỉ mục cho bảng `tblcontact`
--
ALTER TABLE `tblcontact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblslideshow`
--
ALTER TABLE `tblslideshow`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tblbaiviet`
--
ALTER TABLE `tblbaiviet`
  MODIFY `Mabaiviet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `tblbinhluan`
--
ALTER TABLE `tblbinhluan`
  MODIFY `Mabinhluan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tblchude`
--
ALTER TABLE `tblchude`
  MODIFY `Machude` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tblcontact`
--
ALTER TABLE `tblcontact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tblslideshow`
--
ALTER TABLE `tblslideshow`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
