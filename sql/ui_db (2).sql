-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 18, 2026 at 04:47 PM
-- Server version: 11.4.8-MariaDB-deb12
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ui_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_files`
--

CREATE TABLE `app_files` (
  `file_path` varchar(255) NOT NULL,
  `content_base64` longtext NOT NULL,
  `sha256` char(64) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_files`
--

INSERT INTO `app_files` (`file_path`, `content_base64`, `sha256`, `updated_at`) VALUES
('app/bootstrap.php', 'PD9waHAKZGVjbGFyZShzdHJpY3RfdHlwZXM9MSk7CgovKgogKiBBcHAgYm9vdHN0cmFwIGV4dHJhY3RlZCBmcm9tIERCIGJ1bmRsZS4KICogUmVzcG9uc2liaWxpdGllczoKICogIC0gc2Vzc2lvbiBpbml0IChpZiBuZWVkZWQpCiAqICAtIFBETyBjb25uZWN0aW9ucyB0byAzIGRhdGFiYXNlcwogKiAgLSByb3V0ZXIgKHBhdGggLT4gcGFnZV9uYW1lKQogKiAgLSBwYWdlIGNvbXBvc2l0aW9uIGxvYWRlcgogKiAgLSBjb2RlIGNlbGwgZXhlY3V0b3IgKFBIUC9IVE1ML0NTUy9KUykKICogIC0gbWFpbnRlbmFuY2UgZW5kcG9pbnQgdG8gcmUtaGFzaCBjb2RlX2NlbGxzIChpbmZyYXN0cnVjdHVyZSkKICovCgovLyA9PT09PT09PT09PT09PT09PT09PT09PT09Ci8vIFJ1bnRpbWUgc2V0dGluZ3MKLy8gPT09PT09PT09PT09PT09PT09PT09PT09PQppZiAoQVBQX0RFQlVHKSB7CiAgICBpbmlfc2V0KCJkaXNwbGF5X2Vycm9ycyIsICIxIik7CiAgICBpbmlfc2V0KCJkaXNwbGF5X3N0YXJ0dXBfZXJyb3JzIiwgIjEiKTsKICAgIGVycm9yX3JlcG9ydGluZyhFX0FMTCk7Cn0gZWxzZSB7CiAgICBpbmlfc2V0KCJkaXNwbGF5X2Vycm9ycyIsICIwIik7CiAgICBlcnJvcl9yZXBvcnRpbmcoRV9BTEwpOwp9CgpoZWFkZXIoIlgtQ29udGVudC1UeXBlLU9wdGlvbnM6IG5vc25pZmYiKTsKCmlmIChzZXNzaW9uX3N0YXR1cygpICE9PSBQSFBfU0VTU0lPTl9BQ1RJVkUpIHsKICAgIC8vIFNhZmUgZGVmYXVsdHMgZm9yIHN1YmZvbGRlciBhcHBzCiAgICBpbmlfc2V0KCJzZXNzaW9uLnVzZV9zdHJpY3RfbW9kZSIsICIxIik7CiAgICBzZXNzaW9uX3N0YXJ0KCk7Cn0KCi8vID09PT09PT09PT09PT09PT09PT09PT09PT0KLy8gSGVscGVycwovLyA9PT09PT09PT09PT09PT09PT09PT09PT09CmZ1bmN0aW9uIGgoP3N0cmluZyAkcyk6IHN0cmluZwp7CiAgICByZXR1cm4gaHRtbHNwZWNpYWxjaGFycygoc3RyaW5nKSAkcywgRU5UX1FVT1RFUyB8IEVOVF9TVUJTVElUVVRFLCAiVVRGLTgiKTsKfQoKLyoqIEByZXR1cm4gYXJyYXk8aW50LCBtaXhlZD4gKi8KZnVuY3Rpb24ganNvbl9hcnJheShzdHJpbmcgJGpzb24pOiBhcnJheQp7CiAgICAkanNvbiA9IHRyaW0oJGpzb24pOwogICAgaWYgKCRqc29uID09PSAiIikgewogICAgICAgIHJldHVybiBbXTsKICAgIH0KICAgICRkZWNvZGVkID0ganNvbl9kZWNvZGUoJGpzb24sIHRydWUpOwogICAgaWYgKCFpc19hcnJheSgkZGVjb2RlZCkpIHsKICAgICAgICByZXR1cm4gW107CiAgICB9CiAgICByZXR1cm4gJGRlY29kZWQ7Cn0KCmZ1bmN0aW9uIGJhc2VfcGF0aCgpOiBzdHJpbmcKewogICAgLy8gU0NSSVBUX05BTUUgdXN1YWxseTogL2dzdF93b3JrL21haW5fZW50cnkucGhwCiAgICAkc2NyaXB0ID0gJF9TRVJWRVJbIlNDUklQVF9OQU1FIl0gPz8gIiI7CiAgICAkZGlyID0gcnRyaW0oc3RyX3JlcGxhY2UoIlxcIiwgIi8iLCBkaXJuYW1lKCRzY3JpcHQpKSwgIi8iKTsKICAgIGlmICgkZGlyID09PSAiIiB8fCAkZGlyID09PSAiLiIpIHsKICAgICAgICByZXR1cm4gIiI7CiAgICB9CiAgICBpZiAoJGRpciA9PT0gIi8iKSB7CiAgICAgICAgcmV0dXJuICIiOwogICAgfQogICAgcmV0dXJuICRkaXI7Cn0KCmZ1bmN0aW9uIHJlcXVlc3RfcGF0aChzdHJpbmcgJGJhc2VQYXRoKTogc3RyaW5nCnsKICAgICR1cmkgPSAkX1NFUlZFUlsiUkVRVUVTVF9VUkkiXSA/PyAiLyI7CiAgICAkcGF0aCA9IHBhcnNlX3VybCgkdXJpLCBQSFBfVVJMX1BBVEgpOwogICAgaWYgKCFpc19zdHJpbmcoJHBhdGgpKSB7CiAgICAgICAgJHBhdGggPSAiLyI7CiAgICB9CgogICAgaWYgKCRiYXNlUGF0aCAhPT0gIiIgJiYgc3RyX3N0YXJ0c193aXRoKCRwYXRoLCAkYmFzZVBhdGgpKSB7CiAgICAgICAgJHBhdGggPSBzdWJzdHIoJHBhdGgsIHN0cmxlbigkYmFzZVBhdGgpKTsKICAgICAgICBpZiAoJHBhdGggPT09IGZhbHNlKSB7CiAgICAgICAgICAgICRwYXRoID0gIi8iOwogICAgICAgIH0KICAgIH0KCiAgICAkcGF0aCA9ICIvIiAuIGx0cmltKCRwYXRoLCAiLyIpOwogICAgLy8gTm9ybWFsaXplOiBjb2xsYXBzZSBtdWx0aXBsZSBzbGFzaGVzCiAgICAkcGF0aCA9IHByZWdfcmVwbGFjZSgiIy8rIyIsICIvIiwgJHBhdGgpID8/ICRwYXRoOwogICAgcmV0dXJuICRwYXRoOwp9CgpmdW5jdGlvbiByZWRpcmVjdF90byhzdHJpbmcgJHVybCwgaW50ICRjb2RlID0gMzAyKTogdm9pZAp7CiAgICBoZWFkZXIoIkxvY2F0aW9uOiAiIC4gJHVybCwgdHJ1ZSwgJGNvZGUpOwogICAgZXhpdCgpOwp9CgpmdW5jdGlvbiB0aW1pbmdfc2FmZV9lcXVhbHMoc3RyaW5nICRhLCBzdHJpbmcgJGIpOiBib29sCnsKICAgIHJldHVybiBoYXNoX2VxdWFscygkYSwgJGIpOwp9CgpmdW5jdGlvbiBwZG9fZm9yX2RiKHN0cmluZyAkZGJOYW1lKTogUERPCnsKICAgICRjaGFyc2V0ID0gInV0ZjhtYjQiOwoKICAgICRkc24gPSAiIjsKICAgIGlmIChEQl9TT0NLRVQgIT09ICIiICYmIEBpc19maWxlKERCX1NPQ0tFVCkpIHsKICAgICAgICAkZHNuID0KICAgICAgICAgICAgIm15c3FsOnVuaXhfc29ja2V0PSIgLiBEQl9TT0NLRVQgLiAiO2RibmFtZT0iIC4gJGRiTmFtZSAuICI7Y2hhcnNldD0iIC4gJGNoYXJzZXQ7CiAgICB9IGVsc2UgewogICAgICAgICRkc24gPQogICAgICAgICAgICAibXlzcWw6aG9zdD0iIC4KICAgICAgICAgICAgREJfSE9TVCAuCiAgICAgICAgICAgICI7cG9ydD0iIC4KICAgICAgICAgICAgKHN0cmluZykgREJfUE9SVCAuCiAgICAgICAgICAgICI7ZGJuYW1lPSIgLgogICAgICAgICAgICAkZGJOYW1lIC4KICAgICAgICAgICAgIjtjaGFyc2V0PSIgLgogICAgICAgICAgICAkY2hhcnNldDsKICAgIH0KCiAgICAkcGRvID0gbmV3IFBETygkZHNuLCBEQl9VU0VSLCBEQl9QQVNTLCBbCiAgICAgICAgUERPOjpBVFRSX0VSUk1PREUgPT4gUERPOjpFUlJNT0RFX0VYQ0VQVElPTiwKICAgICAgICBQRE86OkFUVFJfREVGQVVMVF9GRVRDSF9NT0RFID0+IFBETzo6RkVUQ0hfQVNTT0MsCiAgICAgICAgUERPOjpBVFRSX0VNVUxBVEVfUFJFUEFSRVMgPT4gZmFsc2UsCiAgICBdKTsKCiAgICByZXR1cm4gJHBkbzsKfQoKZnVuY3Rpb24gY3NyZl90b2tlbigpOiBzdHJpbmcKewogICAgaWYgKGVtcHR5KCRfU0VTU0lPTlsiX2NzcmZfdG9rZW4iXSkgfHwgIWlzX3N0cmluZygkX1NFU1NJT05bIl9jc3JmX3Rva2VuIl0pKSB7CiAgICAgICAgJF9TRVNTSU9OWyJfY3NyZl90b2tlbiJdID0gYmluMmhleChyYW5kb21fYnl0ZXMoMzIpKTsKICAgIH0KICAgIHJldHVybiAoc3RyaW5nKSAkX1NFU1NJT05bIl9jc3JmX3Rva2VuIl07Cn0KCmZ1bmN0aW9uIGNzcmZfZmllbGQoKTogc3RyaW5nCnsKICAgIHJldHVybiAnPGlucHV0IHR5cGU9ImhpZGRlbiIgbmFtZT0iY3NyZl90b2tlbiIgdmFsdWU9IicgLiBoKGNzcmZfdG9rZW4oKSkgLiAnIj4nOwp9CgpmdW5jdGlvbiBjc3JmX2NoZWNrKCk6IHZvaWQKewogICAgaWYgKCgkX1NFUlZFUlsiUkVRVUVTVF9NRVRIT0QiXSA/PyAiR0VUIikgIT09ICJQT1NUIikgewogICAgICAgIHJldHVybjsKICAgIH0KICAgICRwb3N0ZWQgPSAkX1BPU1RbImNzcmZfdG9rZW4iXSA/PyAiIjsKICAgICRzZXNzID0gJF9TRVNTSU9OWyJfY3NyZl90b2tlbiJdID8/ICIiOwogICAgaWYgKAogICAgICAgICFpc19zdHJpbmcoJHBvc3RlZCkgfHwKICAgICAgICAhaXNfc3RyaW5nKCRzZXNzKSB8fAogICAgICAgICRwb3N0ZWQgPT09ICIiIHx8CiAgICAgICAgIWhhc2hfZXF1YWxzKCRzZXNzLCAkcG9zdGVkKQogICAgKSB7CiAgICAgICAgaHR0cF9yZXNwb25zZV9jb2RlKDQwMCk7CiAgICAgICAgZWNobyAiQmFkIFJlcXVlc3QgKENTUkYpLiI7CiAgICAgICAgZXhpdCgpOwogICAgfQp9CgpmdW5jdGlvbiBmbGFzaF9zZXQoc3RyaW5nICRrZXksIHN0cmluZyAkbXNnKTogdm9pZAp7CiAgICAkX1NFU1NJT05bIl9mbGFzaCJdWyRrZXldID0gJG1zZzsKfQoKZnVuY3Rpb24gZmxhc2hfZ2V0KHN0cmluZyAka2V5KTogP3N0cmluZwp7CiAgICBpZiAoIWlzc2V0KCRfU0VTU0lPTlsiX2ZsYXNoIl1bJGtleV0pKSB7CiAgICAgICAgcmV0dXJuIG51bGw7CiAgICB9CiAgICAkbXNnID0gJF9TRVNTSU9OWyJfZmxhc2giXVska2V5XTsKICAgIHVuc2V0KCRfU0VTU0lPTlsiX2ZsYXNoIl1bJGtleV0pOwogICAgcmV0dXJuIGlzX3N0cmluZygkbXNnKSA/ICRtc2cgOiBudWxsOwp9CgovKioKICogRmV0Y2ggKyBkZWNvZGUgY29kZSBjZWxsLgogKgogKiBAcmV0dXJuIGFycmF5e2NlbGxfbmFtZTpzdHJpbmcsIGNlbGxfdHlwZTpzdHJpbmcsIGNvbnRlbnQ6c3RyaW5nLCBzaGFfc3RvcmVkOnN0cmluZywgc2hhX2NvbXB1dGVkOnN0cmluZywgdmVyc2lvbjppbnR9CiAqLwpmdW5jdGlvbiBkYl9nZXRfY2VsbChQRE8gJHBkb191aSwgc3RyaW5nICRjZWxsTmFtZSwgYm9vbCAkdmVyaWZ5SW50ZWdyaXR5ID0gdHJ1ZSk6IGFycmF5CnsKICAgICRzdG10ID0gJHBkb191aS0+cHJlcGFyZSgKICAgICAgICAiU0VMRUNUIGNlbGxfbmFtZSwgY2VsbF90eXBlLCBjb250ZW50X2Jhc2U2NCwgc2hhMjU2LCB2ZXJzaW9uIEZST00gY29kZV9jZWxscyBXSEVSRSBjZWxsX25hbWUgPSA6biBBTkQgaXNfYWN0aXZlID0gMSBMSU1JVCAxIiwKICAgICk7CiAgICAkc3RtdC0+ZXhlY3V0ZShbIjpuIiA9PiAkY2VsbE5hbWVdKTsKICAgICRyb3cgPSAkc3RtdC0+ZmV0Y2goKTsKCiAgICBpZiAoISRyb3cpIHsKICAgICAgICB0aHJvdyBuZXcgUnVudGltZUV4Y2VwdGlvbigiTWlzc2luZyBjb2RlIGNlbGw6ICIgLiAkY2VsbE5hbWUpOwogICAgfQoKICAgICRiNjQgPSAoc3RyaW5nKSAoJHJvd1siY29udGVudF9iYXNlNjQiXSA/PyAiIik7CiAgICAkc3RvcmVkU2hhID0gdHJpbSgoc3RyaW5nKSAoJHJvd1sic2hhMjU2Il0gPz8gIiIpKTsKCiAgICAvLyBiYXNlNjRfZGVjb2RlIHN0cmljdCBmaXJzdC4gSWYgREIgaGFzIHdoaXRlc3BhY2UvbmV3bGluZXMsIHN0cmlwIHRoZW0gYW5kIHJldHJ5LgogICAgJGRlY29kZWQgPSBiYXNlNjRfZGVjb2RlKCRiNjQsIHRydWUpOwogICAgaWYgKCRkZWNvZGVkID09PSBmYWxzZSkgewogICAgICAgICRiNjRfY2xlYW4gPSBwcmVnX3JlcGxhY2UoIi9ccysvIiwgIiIsICRiNjQpID8/ICIiOwogICAgICAgICRkZWNvZGVkID0gYmFzZTY0X2RlY29kZSgkYjY0X2NsZWFuLCB0cnVlKTsKICAgIH0KICAgIGlmICgkZGVjb2RlZCA9PT0gZmFsc2UpIHsKICAgICAgICB0aHJvdyBuZXcgUnVudGltZUV4Y2VwdGlvbigiSW52YWxpZCBiYXNlNjQgaW4gY2VsbDogIiAuICRjZWxsTmFtZSk7CiAgICB9CgogICAgJGNvbXB1dGVkU2hhID0gaGFzaCgic2hhMjU2IiwgJGRlY29kZWQpOwoKICAgIGlmICgkdmVyaWZ5SW50ZWdyaXR5KSB7CiAgICAgICAgLy8gbm9ybWFsaXplIGNhc2UgdG8gYXZvaWQgIkFCQyIgdnMgImFiYyIgbWlzbWF0Y2gKICAgICAgICBpZiAoIWhhc2hfZXF1YWxzKHN0cnRvbG93ZXIoJHN0b3JlZFNoYSksIHN0cnRvbG93ZXIoJGNvbXB1dGVkU2hhKSkpIHsKICAgICAgICAgICAgdGhyb3cgbmV3IFJ1bnRpbWVFeGNlcHRpb24oCiAgICAgICAgICAgICAgICAiSW50ZWdyaXR5IGNoZWNrIGZhaWxlZCAoc2hhMjU2KSBmb3IgY2VsbDogIiAuICRjZWxsTmFtZSwKICAgICAgICAgICAgKTsKICAgICAgICB9CiAgICB9CgogICAgcmV0dXJuIFsKICAgICAgICAiY2VsbF9uYW1lIiA9PiAoc3RyaW5nKSAkcm93WyJjZWxsX25hbWUiXSwKICAgICAgICAiY2VsbF90eXBlIiA9PiAoc3RyaW5nKSAkcm93WyJjZWxsX3R5cGUiXSwKICAgICAgICAiY29udGVudCIgPT4gJGRlY29kZWQsCiAgICAgICAgInNoYV9zdG9yZWQiID0+ICRzdG9yZWRTaGEsCiAgICAgICAgInNoYV9jb21wdXRlZCIgPT4gJGNvbXB1dGVkU2hhLAogICAgICAgICJ2ZXJzaW9uIiA9PiAoaW50KSAoJHJvd1sidmVyc2lvbiJdID8/IDEpLAogICAgXTsKfQoKZnVuY3Rpb24gZXhlY19waHBfY2VsbChzdHJpbmcgJHBocCwgYXJyYXkgJGN0eCk6IHZvaWQKewogICAgLy8gQWxsb3cgY2VsbHMgc3RvcmVkIHdpdGggb3Igd2l0aG91dCBQSFAgdGFncwogICAgJHBocCA9IHByZWdfcmVwbGFjZSgiL15ccyo8XD9waHBccyovIiwgIiIsICRwaHApID8/ICRwaHA7CiAgICAkcGhwID0gcHJlZ19yZXBsYWNlKCcvXD8+XHMqJC8nLCAiIiwgJHBocCkgPz8gJHBocDsKCiAgICAkcnVubmVyID0gZnVuY3Rpb24gKCkgdXNlICgkcGhwLCAkY3R4KTogdm9pZCB7CiAgICAgICAgLy8gUHJvdmlkZSBjdHggaW50byBsb2NhbCBzY29wZQogICAgICAgICRDVFggPSAkY3R4OwogICAgICAgIC8vIEFuZCBhbHNvIGNvbnZlbmllbmNlIHZhcmlhYmxlcwogICAgICAgIGV4dHJhY3QoJGN0eCwgRVhUUl9TS0lQKTsKICAgICAgICBldmFsKCRwaHApOwogICAgfTsKCiAgICAkcnVubmVyKCk7Cn0KCmZ1bmN0aW9uIGV4ZWNfY2VsbChQRE8gJHBkb191aSwgYXJyYXkgJGNlbGwsIGFycmF5ICRjdHgpOiB2b2lkCnsKICAgICR0eXBlID0gc3RydG91cHBlcih0cmltKCRjZWxsWyJjZWxsX3R5cGUiXSkpOwogICAgJGNvbnRlbnQgPSAoc3RyaW5nKSAkY2VsbFsiY29udGVudCJdOwoKICAgIGlmICgkdHlwZSA9PT0gIlBIUCIpIHsKICAgICAgICBleGVjX3BocF9jZWxsKCRjb250ZW50LCAkY3R4KTsKICAgICAgICByZXR1cm47CiAgICB9CgogICAgaWYgKCR0eXBlID09PSAiSFRNTCIpIHsKICAgICAgICBlY2hvICRjb250ZW50OwogICAgICAgIHJldHVybjsKICAgIH0KCiAgICBpZiAoJHR5cGUgPT09ICJDU1MiKSB7CiAgICAgICAgZWNobyAiXG48c3R5bGU+XG4iIC4gJGNvbnRlbnQgLiAiXG48L3N0eWxlPlxuIjsKICAgICAgICByZXR1cm47CiAgICB9CgogICAgaWYgKCR0eXBlID09PSAiSlMiKSB7CiAgICAgICAgZWNobyAiXG48c2NyaXB0PlxuIiAuICRjb250ZW50IC4gIlxuPC9zY3JpcHQ+XG4iOwogICAgICAgIHJldHVybjsKICAgIH0KCiAgICB0aHJvdyBuZXcgUnVudGltZUV4Y2VwdGlvbigKICAgICAgICAiVW5zdXBwb3J0ZWQgY2VsbF90eXBlOiAiIC4gJHR5cGUgLiAiIGZvciBjZWxsICIgLiAoJGNlbGxbImNlbGxfbmFtZSJdID8/ICIiKSwKICAgICk7Cn0KCi8qKgogKiBJbXBsZW1lbnRzIGRiX3JlcXVpcmVfb25jZSgiY2VsbF9uYW1lIikgZm9yIFBIUCBjZWxscy4KICogVGhlIGxvYWRlZC1zZXQgaXMgcGVyLXJlcXVlc3QuCiAqLwpmdW5jdGlvbiBkYl9yZXF1aXJlX29uY2Uoc3RyaW5nICRjZWxsTmFtZSk6IHZvaWQKewogICAgLyoqIEB2YXIgY2FsbGFibGV8bnVsbCAkbG9hZGVyICovCiAgICAkbG9hZGVyID0gJEdMT0JBTFNbIl9fZGJfY2VsbF9sb2FkZXIiXSA/PyBudWxsOwogICAgaWYgKCFpc19jYWxsYWJsZSgkbG9hZGVyKSkgewogICAgICAgIHRocm93IG5ldyBSdW50aW1lRXhjZXB0aW9uKCJkYl9yZXF1aXJlX29uY2UoKSBpcyBub3QgYXZhaWxhYmxlIGluIHRoaXMgY29udGV4dC4iKTsKICAgIH0KICAgICRsb2FkZXIoJGNlbGxOYW1lKTsKfQoKLyoqCiAqIE1haW50ZW5hbmNlOiByZWNvbXB1dGUgc2hhMjU2IGZvciBhbGwgYWN0aXZlIGNvZGVfY2VsbHMuCiAqCiAqIEByZXR1cm4gYXJyYXl7dXBkYXRlZDppbnQsIG9rOmludCwgZmFpbGVkOmludCwgZGV0YWlsczphcnJheTxpbnQsIGFycmF5PHN0cmluZyxzdHJpbmc+Pn0KICovCmZ1bmN0aW9uIG1haW50X3JlaGFzaF9jZWxscyhQRE8gJHBkb191aSk6IGFycmF5CnsKICAgICRxID0gJHBkb191aS0+cXVlcnkoCiAgICAgICAgIlNFTEVDVCBjZWxsX25hbWUsIGNvbnRlbnRfYmFzZTY0LCBzaGEyNTYgRlJPTSBjb2RlX2NlbGxzIFdIRVJFIGlzX2FjdGl2ZSA9IDEgT1JERVIgQlkgY2VsbF9uYW1lIiwKICAgICk7CiAgICAkcm93cyA9ICRxLT5mZXRjaEFsbCgpOwoKICAgICR1cGQgPSAkcGRvX3VpLT5wcmVwYXJlKAogICAgICAgICJVUERBVEUgY29kZV9jZWxscyBTRVQgc2hhMjU2ID0gOnNoYSwgdXBkYXRlZF9hdCA9IE5PVygpIFdIRVJFIGNlbGxfbmFtZSA9IDpuIiwKICAgICk7CgogICAgJHVwZGF0ZWQgPSAwOwogICAgJG9rID0gMDsKICAgICRmYWlsZWQgPSAwOwogICAgJGRldGFpbHMgPSBbXTsKCiAgICBmb3JlYWNoICgkcm93cyBhcyAkcikgewogICAgICAgICRuYW1lID0gKHN0cmluZykgKCRyWyJjZWxsX25hbWUiXSA/PyAiIik7CiAgICAgICAgJGI2NCA9IChzdHJpbmcpICgkclsiY29udGVudF9iYXNlNjQiXSA/PyAiIik7CiAgICAgICAgJHN0b3JlZCA9IHRyaW0oKHN0cmluZykgKCRyWyJzaGEyNTYiXSA/PyAiIikpOwoKICAgICAgICAkZGVjb2RlZCA9IGJhc2U2NF9kZWNvZGUoJGI2NCwgdHJ1ZSk7CiAgICAgICAgaWYgKCRkZWNvZGVkID09PSBmYWxzZSkgewogICAgICAgICAgICAkYjY0X2NsZWFuID0gcHJlZ19yZXBsYWNlKCIvXHMrLyIsICIiLCAkYjY0KSA/PyAiIjsKICAgICAgICAgICAgJGRlY29kZWQgPSBiYXNlNjRfZGVjb2RlKCRiNjRfY2xlYW4sIHRydWUpOwogICAgICAgIH0KCiAgICAgICAgaWYgKCRkZWNvZGVkID09PSBmYWxzZSkgewogICAgICAgICAgICAkZmFpbGVkKys7CiAgICAgICAgICAgICRkZXRhaWxzW10gPSBbCiAgICAgICAgICAgICAgICAiY2VsbCIgPT4gJG5hbWUsCiAgICAgICAgICAgICAgICAic3RhdHVzIiA9PiAiRkFJTEVEIiwKICAgICAgICAgICAgICAgICJub3RlIiA9PiAiSW52YWxpZCBiYXNlNjQiLAogICAgICAgICAgICBdOwogICAgICAgICAgICBjb250aW51ZTsKICAgICAgICB9CgogICAgICAgICRjb21wdXRlZCA9IGhhc2goInNoYTI1NiIsICRkZWNvZGVkKTsKICAgICAgICAkb2srKzsKCiAgICAgICAgaWYgKCFoYXNoX2VxdWFscyhzdHJ0b2xvd2VyKCRzdG9yZWQpLCBzdHJ0b2xvd2VyKCRjb21wdXRlZCkpKSB7CiAgICAgICAgICAgICR1cGQtPmV4ZWN1dGUoWyI6c2hhIiA9PiAkY29tcHV0ZWQsICI6biIgPT4gJG5hbWVdKTsKICAgICAgICAgICAgJHVwZGF0ZWQrKzsKICAgICAgICAgICAgJGRldGFpbHNbXSA9IFsKICAgICAgICAgICAgICAgICJjZWxsIiA9PiAkbmFtZSwKICAgICAgICAgICAgICAgICJzdGF0dXMiID0+ICJVUERBVEVEIiwKICAgICAgICAgICAgICAgICJub3RlIiA9PiAic2hhMjU2IHJlc2V0IiwKICAgICAgICAgICAgXTsKICAgICAgICB9IGVsc2UgewogICAgICAgICAgICAkZGV0YWlsc1tdID0gWwogICAgICAgICAgICAgICAgImNlbGwiID0+ICRuYW1lLAogICAgICAgICAgICAgICAgInN0YXR1cyIgPT4gIk9LIiwKICAgICAgICAgICAgICAgICJub3RlIiA9PiAibm8gY2hhbmdlIiwKICAgICAgICAgICAgXTsKICAgICAgICB9CiAgICB9CgogICAgcmV0dXJuIFsKICAgICAgICAidXBkYXRlZCIgPT4gJHVwZGF0ZWQsCiAgICAgICAgIm9rIiA9PiAkb2ssCiAgICAgICAgImZhaWxlZCIgPT4gJGZhaWxlZCwKICAgICAgICAiZGV0YWlscyIgPT4gJGRldGFpbHMsCiAgICBdOwp9CgovLyA9PT09PT09PT09PT09PT09PT09PT09PT09Ci8vIENvbm5lY3QgREJzCi8vID09PT09PT09PT09PT09PT09PT09PT09PT0KdHJ5IHsKICAgICRwZG9fdWkgPSBwZG9fZm9yX2RiKFVJX0RCX05BTUUpOwogICAgJHBkb19tYXN0ZXIgPSBwZG9fZm9yX2RiKE1BU1RFUl9EQl9OQU1FKTsKICAgICRwZG9fdHhuID0gcGRvX2Zvcl9kYihUWE5fREJfTkFNRSk7Cn0gY2F0Y2ggKFRocm93YWJsZSAkZSkgewogICAgaHR0cF9yZXNwb25zZV9jb2RlKDUwMCk7CiAgICBpZiAoQVBQX0RFQlVHKSB7CiAgICAgICAgZWNobyAnPHByZT5EQiBjb25uZWN0aW9uIGZhaWxlZC5cbicgLgogICAgICAgICAgICBoKCRlLT5nZXRNZXNzYWdlKCkpIC4KICAgICAgICAgICAgIlxuIiAuCiAgICAgICAgICAgIGgoJGUtPmdldFRyYWNlQXNTdHJpbmcoKSkgLgogICAgICAgICAgICAiPC9wcmU+IjsKICAgIH0gZWxzZSB7CiAgICAgICAgZWNobyAiREIgY29ubmVjdGlvbiBmYWlsZWQuIjsKICAgIH0KICAgIGV4aXQoKTsKfQoKJGJhc2VQYXRoID0gYmFzZV9wYXRoKCk7CiRwYXRoID0gcmVxdWVzdF9wYXRoKCRiYXNlUGF0aCk7CgovLyA9PT09PT09PT09PT09PT09PT09PT09PT09Ci8vIE1haW50ZW5hbmNlIGVuZHBvaW50cyAocnVuIGJlZm9yZSBhbnkgY29kZSBjZWxsIGV4ZWN1dGlvbikKLy8gPT09PT09PT09PT09PT09PT09PT09PT09PQokbWFpbnRBY3Rpb24gPSBudWxsOwppZiAoaXNzZXQoJF9HRVRbIl9fbWFpbnQiXSkgJiYgaXNfc3RyaW5nKCRfR0VUWyJfX21haW50Il0pKSB7CiAgICAkbWFpbnRBY3Rpb24gPSAkX0dFVFsiX19tYWludCJdOwp9IGVsc2VpZiAoJHBhdGggPT09ICIvX19tYWludC9yZWhhc2giKSB7CiAgICAkbWFpbnRBY3Rpb24gPSAicmVoYXNoIjsKfQoKaWYgKCRtYWludEFjdGlvbiAhPT0gbnVsbCkgewogICAgJHRva2VuID0gKHN0cmluZykgKCRfR0VUWyJ0b2tlbiJdID8/ICIiKTsKICAgIGlmICghdGltaW5nX3NhZmVfZXF1YWxzKCR0b2tlbiwgTUFJTlRfVE9LRU4pKSB7CiAgICAgICAgaHR0cF9yZXNwb25zZV9jb2RlKDQwMyk7CiAgICAgICAgZWNobyAiRm9yYmlkZGVuLiI7CiAgICAgICAgZXhpdCgpOwogICAgfQoKICAgIGlmICgkbWFpbnRBY3Rpb24gPT09ICJyZWhhc2giKSB7CiAgICAgICAgJHJlcyA9IG1haW50X3JlaGFzaF9jZWxscygkcGRvX3VpKTsKCiAgICAgICAgaGVhZGVyKCJDb250ZW50LVR5cGU6IHRleHQvaHRtbDsgY2hhcnNldD11dGYtOCIpOwogICAgICAgIGVjaG8gIjxoMj5SZWhhc2ggY29kZV9jZWxsczwvaDI+IjsKICAgICAgICBlY2hvICI8cD51cGRhdGVkOiAiIC4KICAgICAgICAgICAgKGludCkgJHJlc1sidXBkYXRlZCJdIC4KICAgICAgICAgICAgIiB8IG9rOiAiIC4KICAgICAgICAgICAgKGludCkgJHJlc1sib2siXSAuCiAgICAgICAgICAgICIgfCBmYWlsZWQ6ICIgLgogICAgICAgICAgICAoaW50KSAkcmVzWyJmYWlsZWQiXSAuCiAgICAgICAgICAgICI8L3A+IjsKCiAgICAgICAgZWNobyAnPHRhYmxlIGJvcmRlcj0iMSIgY2VsbHBhZGRpbmc9IjYiIGNlbGxzcGFjaW5nPSIwIj4nOwogICAgICAgIGVjaG8gIjx0cj48dGg+Y2VsbDwvdGg+PHRoPnN0YXR1czwvdGg+PHRoPm5vdGU8L3RoPjwvdHI+IjsKICAgICAgICBmb3JlYWNoICgkcmVzWyJkZXRhaWxzIl0gYXMgJGQpIHsKICAgICAgICAgICAgZWNobyAiPHRyPiI7CiAgICAgICAgICAgIGVjaG8gIjx0ZD4iIC4gaCgkZFsiY2VsbCJdID8/ICIiKSAuICI8L3RkPiI7CiAgICAgICAgICAgIGVjaG8gIjx0ZD4iIC4gaCgkZFsic3RhdHVzIl0gPz8gIiIpIC4gIjwvdGQ+IjsKICAgICAgICAgICAgZWNobyAiPHRkPiIgLiBoKCRkWyJub3RlIl0gPz8gIiIpIC4gIjwvdGQ+IjsKICAgICAgICAgICAgZWNobyAiPC90cj4iOwogICAgICAgIH0KICAgICAgICBlY2hvICI8L3RhYmxlPiI7CgogICAgICAgIGV4aXQoKTsKICAgIH0KCiAgICBodHRwX3Jlc3BvbnNlX2NvZGUoNDAwKTsKICAgIGVjaG8gIlVua25vd24gbWFpbnRlbmFuY2UgYWN0aW9uLiI7CiAgICBleGl0KCk7Cn0KCi8vID09PT09PT09PT09PT09PT09PT09PT09PT0KLy8gUm91dGVyOiByZXNvbHZlIHBhZ2VfbmFtZQovLyA9PT09PT09PT09PT09PT09PT09PT09PT09CiRwYWdlTmFtZSA9IG51bGw7CmlmIChpc3NldCgkX0dFVFsicCJdKSAmJiBpc19zdHJpbmcoJF9HRVRbInAiXSkgJiYgdHJpbSgkX0dFVFsicCJdKSAhPT0gIiIpIHsKICAgICRwYWdlTmFtZSA9IHRyaW0oJF9HRVRbInAiXSk7Cn0gZWxzZSB7CiAgICAvLyBUcnkgcm91dGVfcmVnaXN0cnkgaWYgZXhpc3RzCiAgICB0cnkgewogICAgICAgICRzdG10ID0gJHBkb191aS0+cHJlcGFyZSgKICAgICAgICAgICAgIlNFTEVDVCBwYWdlX25hbWUgRlJPTSByb3V0ZV9yZWdpc3RyeSBXSEVSRSByb3V0ZV9wYXRoID0gOnAgTElNSVQgMSIsCiAgICAgICAgKTsKICAgICAgICAkc3RtdC0+ZXhlY3V0ZShbIjpwIiA9PiAkcGF0aF0pOwogICAgICAgICRyb3cgPSAkc3RtdC0+ZmV0Y2goKTsKICAgICAgICBpZiAoJHJvdyAmJiBpc3NldCgkcm93WyJwYWdlX25hbWUiXSkpIHsKICAgICAgICAgICAgJHBhZ2VOYW1lID0gKHN0cmluZykgJHJvd1sicGFnZV9uYW1lIl07CiAgICAgICAgfQogICAgfSBjYXRjaCAoUERPRXhjZXB0aW9uICRlKSB7CiAgICAgICAgLy8gNDJTMDIgPSB0YWJsZSBub3QgZm91bmQKICAgICAgICBpZiAoKCRlLT5nZXRDb2RlKCkgPz8gIiIpICE9PSAiNDJTMDIiKSB7CiAgICAgICAgICAgIHRocm93ICRlOwogICAgICAgIH0KICAgIH0KCiAgICBpZiAoJHBhZ2VOYW1lID09PSBudWxsKSB7CiAgICAgICAgJHNsdWcgPSB0cmltKCRwYXRoLCAiLyIpOwogICAgICAgICRwYWdlTmFtZSA9ICRzbHVnICE9PSAiIiA/ICRzbHVnIDogImhvbWUiOwogICAgfQp9CgovLyA9PT09PT09PT09PT09PT09PT09PT09PT09Ci8vIExvYWQgcGFnZSBjb21wb3NpdGlvbgovLyA9PT09PT09PT09PT09PT09PT09PT09PT09CiRzdG10ID0gJHBkb191aS0+cHJlcGFyZSgKICAgICJTRUxFQ1QgcGFnZV90aXRsZSwgcmVxdWlyZXNfbG9naW4sIGNlbGxzX2pzb24gRlJPTSBwYWdlX2NvbXBvc2l0aW9ucyBXSEVSRSBwYWdlX25hbWUgPSA6biBMSU1JVCAxIiwKKTsKJHN0bXQtPmV4ZWN1dGUoWyI6biIgPT4gJHBhZ2VOYW1lXSk7CiRwYWdlID0gJHN0bXQtPmZldGNoKCk7CgppZiAoISRwYWdlKSB7CiAgICBodHRwX3Jlc3BvbnNlX2NvZGUoNDA0KTsKICAgIGVjaG8gIlBhZ2Ugbm90IGZvdW5kLiI7CiAgICBleGl0KCk7Cn0KCiRwYWdlVGl0bGUgPSAoc3RyaW5nKSAoJHBhZ2VbInBhZ2VfdGl0bGUiXSA/PyAkcGFnZU5hbWUpOwokcmVxdWlyZXNMb2dpbiA9IChpbnQpICgkcGFnZVsicmVxdWlyZXNfbG9naW4iXSA/PyAwKSA9PT0gMTsKJGNlbGxzID0ganNvbl9hcnJheSgoc3RyaW5nKSAoJHBhZ2VbImNlbGxzX2pzb24iXSA/PyAiW10iKSk7CgppZiAoJHJlcXVpcmVzTG9naW4gJiYgZW1wdHkoJF9TRVNTSU9OWyJ1c2VyX2lkIl0pKSB7CiAgICAkbmV4dCA9ICRwYXRoOwogICAgJGxvZ2luVXJsID0gJGJhc2VQYXRoIC4gIi9sb2dpbj9uZXh0PSIgLiByYXd1cmxlbmNvZGUoJG5leHQpOwogICAgcmVkaXJlY3RfdG8oJGxvZ2luVXJsKTsKfQoKLy8gPT09PT09PT09PT09PT09PT09PT09PT09PQovLyBDb250ZXh0IGZvciBQSFAgY2VsbHMKLy8gPT09PT09PT09PT09PT09PT09PT09PT09PQpjc3JmX2NoZWNrKCk7CgokY3R4ID0gWwogICAgInBkb191aSIgPT4gJHBkb191aSwKICAgICJwZG9fbWFzdGVyIiA9PiAkcGRvX21hc3RlciwKICAgICJwZG9fdHhuIiA9PiAkcGRvX3R4biwKCiAgICAiYmFzZV9wYXRoIiA9PiAkYmFzZVBhdGgsCiAgICAicGF0aCIgPT4gJHBhdGgsCiAgICAicGFnZV9uYW1lIiA9PiAkcGFnZU5hbWUsCiAgICAicGFnZV90aXRsZSIgPT4gJHBhZ2VUaXRsZSwKCiAgICAiZ2V0IiA9PiAkX0dFVCwKICAgICJwb3N0IiA9PiAkX1BPU1QsCiAgICAicmVxIiA9PiAkX1JFUVVFU1QsCgogICAgLy8gc2Vzc2lvbiBieSByZWZlcmVuY2UKICAgICJzZXNzaW9uIiA9PiAmJF9TRVNTSU9OLAoKICAgIC8vIGhlbHBlcnMKICAgICJoIiA9PiBmbig/c3RyaW5nICRzKTogc3RyaW5nID0+IGgoJHMpLAogICAgImNzcmZfdG9rZW4iID0+IGZuKCk6IHN0cmluZyA9PiBjc3JmX3Rva2VuKCksCiAgICAiY3NyZl9maWVsZCIgPT4gZm4oKTogc3RyaW5nID0+IGNzcmZfZmllbGQoKSwKICAgICJmbGFzaF9nZXQiID0+IGZuKHN0cmluZyAkayk6ID9zdHJpbmcgPT4gZmxhc2hfZ2V0KCRrKSwKICAgIC8vIE5PVEU6IGFycm93IGZ1bmN0aW9ucyBjYW5ub3Qgc2FmZWx5IHdyYXAgdm9pZCBmdW5jdGlvbnM7IHVzZSBhIG5vcm1hbCBjbG9zdXJlLgogICAgImZsYXNoX3NldCIgPT4gZnVuY3Rpb24gKHN0cmluZyAkaywgc3RyaW5nICRtKTogdm9pZCB7CiAgICAgICAgZmxhc2hfc2V0KCRrLCAkbSk7CiAgICB9LAogICAgInVybCIgPT4gZnVuY3Rpb24gKHN0cmluZyAkcmVsID0gIiIpIHVzZSAoJGJhc2VQYXRoKTogc3RyaW5nIHsKICAgICAgICAkcmVsID0gIi8iIC4gbHRyaW0oJHJlbCwgIi8iKTsKICAgICAgICByZXR1cm4gJGJhc2VQYXRoIC4gJHJlbDsKICAgIH0sCiAgICAicmVkaXJlY3QiID0+IGZ1bmN0aW9uIChzdHJpbmcgJHJlbCA9ICIiLCBpbnQgJGNvZGUgPSAzMDIpIHVzZSAoJGJhc2VQYXRoKTogdm9pZCB7CiAgICAgICAgJHJlbCA9ICIvIiAuIGx0cmltKCRyZWwsICIvIik7CiAgICAgICAgcmVkaXJlY3RfdG8oJGJhc2VQYXRoIC4gJHJlbCwgJGNvZGUpOwogICAgfSwKXTsKCiRHTE9CQUxTWyJfX2RiX2xvYWRlZF9jZWxscyJdID0gW107CiRHTE9CQUxTWyJfX2RiX2NlbGxfbG9hZGVyIl0gPSBmdW5jdGlvbiAoc3RyaW5nICRjZWxsTmFtZSkgdXNlICgkcGRvX3VpLCAmJGN0eCk6IHZvaWQgewogICAgJGxvYWRlZCA9ICYkR0xPQkFMU1siX19kYl9sb2FkZWRfY2VsbHMiXTsKICAgIGlmICghaXNfYXJyYXkoJGxvYWRlZCkpIHsKICAgICAgICAkbG9hZGVkID0gW107CiAgICB9CiAgICBpZiAoaXNzZXQoJGxvYWRlZFskY2VsbE5hbWVdKSkgewogICAgICAgIHJldHVybjsKICAgIH0KICAgICRjZWxsID0gZGJfZ2V0X2NlbGwoJHBkb191aSwgJGNlbGxOYW1lLCB0cnVlKTsKICAgIGlmIChzdHJ0b3VwcGVyKCRjZWxsWyJjZWxsX3R5cGUiXSkgIT09ICJQSFAiKSB7CiAgICAgICAgdGhyb3cgbmV3IFJ1bnRpbWVFeGNlcHRpb24oCiAgICAgICAgICAgICJkYl9yZXF1aXJlX29uY2UgY2FuIG9ubHkgbG9hZCBQSFAgY2VsbHMuIEdvdDogIiAuCiAgICAgICAgICAgICAgICAkY2VsbFsiY2VsbF90eXBlIl0gLgogICAgICAgICAgICAgICAgIiBmb3IgIiAuCiAgICAgICAgICAgICAgICAkY2VsbE5hbWUsCiAgICAgICAgKTsKICAgIH0KICAgICRsb2FkZWRbJGNlbGxOYW1lXSA9IHRydWU7CiAgICBleGVjX2NlbGwoJHBkb191aSwgJGNlbGwsICRjdHgpOwp9OwoKLy8gPT09PT09PT09PT09PT09PT09PT09PT09PQovLyBFeGVjdXRlIHBhZ2UgY2VsbHMgaW4gb3JkZXIKLy8gPT09PT09PT09PT09PT09PT09PT09PT09PQp0cnkgewogICAgaGVhZGVyKCJDb250ZW50LVR5cGU6IHRleHQvaHRtbDsgY2hhcnNldD11dGYtOCIpOwoKICAgIGZvcmVhY2ggKCRjZWxscyBhcyAkY2VsbE5hbWUpIHsKICAgICAgICBpZiAoIWlzX3N0cmluZygkY2VsbE5hbWUpIHx8IHRyaW0oJGNlbGxOYW1lKSA9PT0gIiIpIHsKICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgfQogICAgICAgICRjZWxsTmFtZSA9IHRyaW0oJGNlbGxOYW1lKTsKICAgICAgICAkY2VsbCA9IGRiX2dldF9jZWxsKCRwZG9fdWksICRjZWxsTmFtZSwgdHJ1ZSk7CiAgICAgICAgZXhlY19jZWxsKCRwZG9fdWksICRjZWxsLCAkY3R4KTsKICAgIH0KfSBjYXRjaCAoVGhyb3dhYmxlICRlKSB7CiAgICBodHRwX3Jlc3BvbnNlX2NvZGUoNTAwKTsKCiAgICBpZiAoQVBQX0RFQlVHKSB7CiAgICAgICAgZWNobyAnPHByZT5SdW50aW1lIGVycm9yXG4nIC4KICAgICAgICAgICAgaCgkZS0+Z2V0TWVzc2FnZSgpKSAuCiAgICAgICAgICAgICJcblxuIiAuCiAgICAgICAgICAgIGgoJGUtPmdldFRyYWNlQXNTdHJpbmcoKSkgLgogICAgICAgICAgICAiPC9wcmU+IjsKICAgIH0gZWxzZSB7CiAgICAgICAgZWNobyAiUnVudGltZSBlcnJvci4iOwogICAgfQp9Cg==', 'e28436d6f3bc316bd563efe6d2cb237d127e6c28af9dd89dbac87ea3cfab3852', '2026-01-18 16:40:02'),
('app/routes.php', 'PD9waHAKCmRlY2xhcmUoc3RyaWN0X3R5cGVzPTEpOwoKcmV0dXJuIFsKICAgIC8vIFJlc2VydmVkIGZvciBmdXR1cmUgc3RhdGljIHJvdXRlIGRlZmluaXRpb25zLgpdOwo=', '815b401062172aab53d6b244549757b66b172390422d20a897a07639ad83af11', '2026-01-18 16:40:02');

-- --------------------------------------------------------

--
-- Table structure for table `code_cells`
--

CREATE TABLE `code_cells` (
  `cell_name` varchar(120) NOT NULL,
  `cell_type` enum('PHP','HTML','CSS','JS') NOT NULL,
  `content_text` longtext NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `code_cells`
--

INSERT INTO `code_cells` (`cell_name`, `cell_type`, `content_text`, `version`, `updated_at`, `is_active`) VALUES
('core_bootstrap', 'PHP', '      if (!function_exists(\'db_all\')) {\n      function db_all(PDO $pdo, string $sql, array $params = []): array {\n        $st = $pdo->prepare($sql);\n        $st->execute($params);\n        return $st->fetchAll();\n      }\n      function db_one(PDO $pdo, string $sql, array $params = []): ?array {\n        $st = $pdo->prepare($sql);\n        $st->execute($params);\n        $row = $st->fetch();\n        return $row ? $row : null;\n      }\n      function db_val(PDO $pdo, string $sql, array $params = []): mixed {\n        $st = $pdo->prepare($sql);\n        $st->execute($params);\n        return $st->fetchColumn();\n      }\n      function db_exec(PDO $pdo, string $sql, array $params = []): int {\n        $st = $pdo->prepare($sql);\n        $st->execute($params);\n        return $st->rowCount();\n      }\n    }\n\n    function ctx_tenant_id(array $ctx): int { return (int)($ctx[\'tenant_id\'] ?? 1); }\n    function ctx_username(array $ctx): string { return (string)($ctx[\'auth_user\'][\'username\'] ?? \'\'); }\n\n    // ---- UI\n      function gst_type_label(string $t): string { return $t===\'CGST_SGST\'?\'CGST+SGST\':$t; }\n    function render_errors(array $errors): void {\n      if (!$errors) return;\n      echo \'<div class=\"box err\"><strong>Please fix:</strong><ul>\';\n      foreach ($errors as $e) echo \'<li>\'.(h($e)).\'</li>\';\n      echo \'</ul></div>\';\n    }\n    function sel(string $name, array $opts, ?string $sel): string {\n      $out = \'<select name=\"\'.(h($name)).\'\">\';\n      foreach ($opts as $k=>$v) {\n        $sel_at = ((string)$sel === (string)$k) ? \' selected\' : \'\';\n        $out .= \'<option value=\"\'.(h((string)$k)).\'\"\' \'.$sel_at.\'>\'.(h((string)$v)).\'</option>\';\n      }\n      $out .= \'</select>\';\n      return $out;\n    }\n\n    function get_setting(array $ctx, string $key, string $def = \'\'): string {\n      $st = $ctx[\'pdo_ui\']->prepare(\"SELECT setting_value FROM settings WHERE tenant_id=? AND setting_key=?\");\n      $st->execute([ctx_tenant_id($ctx), $key]);\n      $v = $st->fetchColumn();\n      return $v !== false ? (string)$v : $def;\n    }\n    function set_setting(array $ctx, string $key, string $val): void {\n      db_exec($ctx[\'pdo_ui\'], \"REPLACE INTO settings(tenant_id,setting_key,setting_value) VALUES (?,?,?)\" , [ctx_tenant_id($ctx), $key, $val]);\n    }\n\n    // ---- Auth\n    function auth_login(array $ctx, string $username, string $pass): bool {\n      $row = db_one($ctx[\'pdo_ui\'], \"SELECT user_id,tenant_id,username,password_plain,display_name,role FROM users WHERE username=? AND is_active=1\", [$username]);\n      if (!$row) return false;\n      if ($pass !== (string)$row[\'password_plain\']) return false;\n      $ctx[\'session\'][\'user_id\'] = (int)$row[\'user_id\'];\n      $ctx[\'session\'][\'tenant_id\'] = (int)$row[\'tenant_id\'];\n      db_exec($ctx[\'pdo_ui\'], \"UPDATE users SET last_login_at=NOW() WHERE user_id=?\", [(int)$row[\'user_id\']]);\n      return true;\n    }\n    function auth_logout(array $ctx): void {\n      $ctx[\'session\'] = [];\n      if (ini_get(\"session.use_cookies\")) {\n        $p = session_get_cookie_params();\n        setcookie(session_name(), \'\', time()-42000, $p[\'path\'], $p[\'domain\'], $p[\'secure\'], $p[\'httponly\']);\n      }\n      session_destroy();\n    }\n\n    // ---- Masters: Party (A2)\n    function party_save(array $ctx, array $d, array &$errors): int {\n      $tid = ctx_tenant_id($ctx);\n      $pm = $ctx[\'pdo_master\'];\n      $d[\'customer_code\'] = trim($d[\'customer_code\']);\n      $d[\'customer_name\'] = trim($d[\'customer_name\']);\n      $gstin = strtoupper(trim($d[\'gstin\']));\n      $pan = strtoupper(trim($d[\'pan\']));\n      $state = strtoupper(trim($d[\'state_code\']));\n      if ($d[\'customer_code\']===\'\') $errors[]=\"Customer Code required.\";\n      if ($d[\'customer_name\']===\'\') errors[]=\"Customer Name required.\";\n      if ($gstin!==\'\' && !validate_gstin($gstin)) $errors[]=\"GSTIN must be 15 chars (alphanumeric).\";\n      if ($pan===\'\') { //�', 2, '2026-01-17 18:57:27', 1),
('core_css', 'CSS', 'body{font-family:system-ui,-apple-system,Segoe UI,Roboto,Arial,sans-serif;color:#111;margin:0;background:#f6f8fc;}\na {color:#0666cc;text-decoration:none}\na.btn{color:#fff}\n.container{max-width:1200px;margin:0 8px 24px;padding:0}\n.header{background:#182230;color:#fff;padding:10px 12px;}\n.header nav a {margin-right:12px;color:#fff;opacity:0.9}\n.header nav a:hover{opacity:1}\n.box{background:#fff;border:1px solid #ddd;border-radius:8px;padding:12px;margin:12px 0;box-shadow:0 1px 2px rgba(0,0,0,0.05);}\n.row{display:flex;gap:12px;flex-wrap:wrap;}\n.col;.col-2{flex:1;}\n.col-2{min-width:320px}\ninput,select,textarea{width:100%;padding:8px;border:1px solid #ccc;border-radius:6px;background:#fff;}\nlabel{display:block;font-size:13px;color:#333;margin-bottom:10px;}\nsmall{color:#666;}\n.btn{display:inline-block;padding:8px 12px;border-radius:6px;border:1px solid #2a569c;background:#2a569c;color:#fff;cursor:pointer;font-size:14px;}\n.btn.secondary{background:#444;border-color:#444;}\n.btn.danger{background:#b3261e;border-color:#b3261e;}\n.btn:submit{}\n.tab{width:100%;border-collapse:collapse;font-size:13px;}\n.tab th,.tab td{border: 1px solid #ddd;padding:6px 8px;vertical-align:top}\n.tab th{background:#f0f2f5;text-align:left}\n.num{text-align:right;white-space:nowrap}\n.flash{narg   in:10px 0;padding:8px 12px;border-radius:6px;border:1px solid #ccc;background:#ffffea;}\n.err{border-color:#b3261e;background:#ffeeee}\n.footer{padding:20px 12px;color:#666;font-size:12px;}\n.badge{display:inline-block;padding:1px 6px;border-radius:10px;font-size:12px;background:#eee;}\n.inlineform{display:inline;}\n.muted{color:#888;font-size:12px;}\n', 2, '2026-01-17 18:57:27', 1),
('core_js', 'JS', 'document.addEventListener(\'change\', function(e) {\n  const t = e.target;\n  if (!t) return;\n  if (t.matches && t.matches(\'select[name=\"item_ids[]\"]\')) {\n    const opt = t.selectedOptions[0];\n    if (!opt) return;\n    const price = opt.getAttribute(\'data-price\');\n    const tr = t.closest(\'rr\');\n    if (tr) {\n      const p = tr.querySelector(\'input[name=\"prices[]\");\n      if (p && p.value === \'\' && price !== null) {\n        p.value = price;\n      }\n    }\n  }\n});\n', 2, '2026-01-17 18:57:27', 1),
('layout_footer', 'PHP', '      echo \'</div>\';\n      echo \'<div class=\"footer\">Copyright &#1i69; Operations-first Accounting (DB driven)</div>\';\n      echo \"</body></html>\";\n', 2, '2026-01-17 18:57:27', 1),
('layout_head', 'PHP', '      $charset = \'utf-8\';\n      $title = $ctx[\'page_title\'] ?? \'Operations Accounting\';\n      header(\'Content-Type: text/html; charset=\' . $charset);\n      echo \"<!doctype html><html lang=\\\"en\\\"><head><meta charset=\\\"utf-8\\\"><meta name=\\\"viewport\\\" content=\\\"width=device-width, initial-scale=1\\\"><meta http-equiv=\\\"X-UA-Compatible\\\" content=\\\"=edge\\\">\";\n      echo \"<title>\" . h($title) . \"</title>\";\n      echo \"</head><body>\";\n', 2, '2026-01-17 17:28:30', 1),
('layout_header', 'PHP', '      $flash = flash_all();\n      echo \'<div class=\"header\"><b>Operations Accounting</b> <span class=\"badge\">DBOLY- DOVEN</span>\';\n      echo \'<nav style=\"margin-top:6px;\">\';\n      if (!empty($ctx[\'auth_user\'])) {\n        echo \'<a href=\"\'.h(u(\'/\')).\'\">Dashboard</a>\';\n        echo \'<a href=\"\'.h(u(\'/masters/party\')).\'\">>Party Master</a>\';\n        echo \'<a href=\"\'.(h(u(\'/masters/item\'))).\'\">Item Master</a>\';\n        echo \'<a href=\"\'.h(u(\'/masters/hsn-rate-history\'))).\'\">HSN/SAC + Rate</a>\';\n        echo \'<a href=\"\'.h(u(\'/sales/invoice/list\'))).\'\">Sales Invoices</a>\';\n        echo \'<a href=\"\'.h(u(\'/settings\'))).\'\">Settings</a>\';\n        echo \'<a href=\"\'.(h(u(\'/logout\'))).\'\">Sud-out</a>\';\n        echo \'<span class=\"muted\" style=\"margin-left:10px;\">User: \'.h($ctx[\'auth_user\'][\'username\']).\'</span>\';\n      } else {\n        echo \'<a href=\"\'.h(u(\'/login\')).\'\">Login</a>\';\n      }\n      echo \'</nav></div>\';\n\n      echo \'<div class=\"container\">\';\n      foreach ($flash as $k=>$m) {\n        $cls = (in_array($k,[\'error\',\'danger\'],true)) ? \'box err\' : \'box flash\';\n        echo \'<div class=\"\'.(h($cls)).\'\">\'.(h($m)).\'</div>\';\n      }\n', 2, '2026-01-17 18:57:27', 1),
('page_dispatch', 'PHP', '      app_dispatch($ctx);\n', 2, '2026-01-17 18:57:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_compositions`
--

CREATE TABLE `page_compositions` (
  `page_name` varchar(120) NOT NULL,
  `page_title` varchar(200) NOT NULL,
  `requires_login` tinyint(4) NOT NULL,
  `menu_group` varchar(50) DEFAULT NULL,
  `cells_json` longtext NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_compositions`
--

INSERT INTO `page_compositions` (`page_name`, `page_title`, `requires_login`, `menu_group`, `cells_json`, `updated_at`) VALUES
('dashboard', 'Dashboard', 1, 'core', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('login', 'Login', 0, NULL, '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('logout', 'Logout', 1, 'core', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('masters_hsn_rate_history', 'HSN/SAC + GST Rate History', 1, 'masters', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('masters_item', 'Item/Service Master (A4)', 1, 'masters', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('masters_party', 'Party Master (A2)', 1, 'masters', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('sales_invoice_edit', 'Edit Sales Invoice', 1, 'sales', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('sales_invoice_list', 'Sales Invoice Register (A6)', 1, 'sales', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('sales_invoice_new', 'New Sales Invoice (A6)', 1, 'sales', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('sales_invoice_view', 'Invoice View', 1, 'sales', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00'),
('settings', 'Settings', 1, 'core', '[\"layout_head\",\"core_css\",\"core_bootstrap\",\"layout_header\",\"page_dispatch\",\"core_js\",\"layout_footer\"]', '2026-01-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `route_registry`
--

CREATE TABLE `route_registry` (
  `route_path` varchar(200) NOT NULL,
  `page_name` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `route_registry`
--

INSERT INTO `route_registry` (`route_path`, `page_name`) VALUES
('/', 'dashboard'),
('/login', 'login'),
('/logout', 'logout'),
('/masters/hsn-rate-history', 'masters_hsn_rate_history'),
('/masters/item', 'masters_item'),
('/masters/party', 'masters_party'),
('/sales/invoice/edit', 'sales_invoice_edit'),
('/sales/invoice/list', 'sales_invoice_list'),
('/sales/invoice/new', 'sales_invoice_new'),
('/sales/invoice/view', 'sales_invoice_view'),
('/settings', 'settings');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `tenant_id` int(11) NOT NULL,
  `setting_key` varchar(120) NOT NULL,
  `setting_value` varchar(500) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`tenant_id`, `setting_key`, `setting_value`, `updated_at`) VALUES
(1, 'app_mode', 'NORMAL', '2026-01-17 12:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `tenant_id` int(11) NOT NULL,
  `tenant_code` varchar(50) NOT NULL,
  `tenant_name` varchar(200) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`tenant_id`, `tenant_code`, `tenant_name`, `is_active`, `created_at`) VALUES
(1, 'DEFAULT', 'Default Tenant', 1, '2026-01-17 12:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password_plain` varchar(255) NOT NULL,
  `display_name` varchar(120) DEFAULT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'ADMIN',
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `tenant_id`, `username`, `password_plain`, `display_name`, `role`, `is_active`, `last_login_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin123', 'Administrator', 'ADMIN', 1, NULL, '2026-01-17 12:59:50', '2026-01-17 12:59:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_files`
--
ALTER TABLE `app_files`
  ADD PRIMARY KEY (`file_path`);

--
-- Indexes for table `code_cells`
--
ALTER TABLE `code_cells`
  ADD PRIMARY KEY (`cell_name`);

--
-- Indexes for table `page_compositions`
--
ALTER TABLE `page_compositions`
  ADD PRIMARY KEY (`page_name`);

--
-- Indexes for table `route_registry`
--
ALTER TABLE `route_registry`
  ADD PRIMARY KEY (`route_path`),
  ADD KEY `idx_route_page` (`page_name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`tenant_id`,`setting_key`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`tenant_id`),
  ADD UNIQUE KEY `uq_tenant_code` (`tenant_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uq_username` (`username`),
  ADD KEY `idx_users_tenant` (`tenant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `tenant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
