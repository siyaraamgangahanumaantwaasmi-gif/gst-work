-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 18, 2026 at 12:25 PM
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
-- Table structure for table `code_cells`
--

CREATE TABLE `code_cells` (
  `cell_name` varchar(120) NOT NULL,
  `cell_type` enum('PHP','HTML','CSS','JS') NOT NULL,
  `content_base64` longtext NOT NULL,
  `sha256` char(64) NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `code_cells`
--

INSERT INTO `code_cells` (`cell_name`, `cell_type`, `content_base64`, `sha256`, `version`, `updated_at`, `is_active`) VALUES
('core_bootstrap', 'PHP', 'ICAgICAgaWYgKCFmdW5jdGlvbl9leGlzdHMoJ2RiX2FsbCcpKSB7CiAgICAgIGZ1bmN0aW9uIGRiX2FsbChQRE8gJHBkbywgc3RyaW5nICRzcWwsIGFycmF5ICRwYXJhbXMgPSBbXSk6IGFycmF5IHsKICAgICAgICAkc3QgPSAkcGRvLT5wcmVwYXJlKCRzcWwpOwogICAgICAgICRzdC0+ZXhlY3V0ZSgkcGFyYW1zKTsKICAgICAgICByZXR1cm4gJHN0LT5mZXRjaEFsbCgpOwogICAgICB9CiAgICAgIGZ1bmN0aW9uIGRiX29uZShQRE8gJHBkbywgc3RyaW5nICRzcWwsIGFycmF5ICRwYXJhbXMgPSBbXSk6ID9hcnJheSB7CiAgICAgICAgJHN0ID0gJHBkby0+cHJlcGFyZSgkc3FsKTsKICAgICAgICAkc3QtPmV4ZWN1dGUoJHBhcmFtcyk7CiAgICAgICAgJHJvdyA9ICRzdC0+ZmV0Y2goKTsKICAgICAgICByZXR1cm4gJHJvdyA/ICRyb3cgOiBudWxsOwogICAgICB9CiAgICAgIGZ1bmN0aW9uIGRiX3ZhbChQRE8gJHBkbywgc3RyaW5nICRzcWwsIGFycmF5ICRwYXJhbXMgPSBbXSk6IG1peGVkIHsKICAgICAgICAkc3QgPSAkcGRvLT5wcmVwYXJlKCRzcWwpOwogICAgICAgICRzdC0+ZXhlY3V0ZSgkcGFyYW1zKTsKICAgICAgICByZXR1cm4gJHN0LT5mZXRjaENvbHVtbigpOwogICAgICB9CiAgICAgIGZ1bmN0aW9uIGRiX2V4ZWMoUERPICRwZG8sIHN0cmluZyAkc3FsLCBhcnJheSAkcGFyYW1zID0gW10pOiBpbnQgewogICAgICAgICRzdCA9ICRwZG8tPnByZXBhcmUoJHNxbCk7CiAgICAgICAgJHN0LT5leGVjdXRlKCRwYXJhbXMpOwogICAgICAgIHJldHVybiAkc3Qtcm93Q291bnQoKTsKICAgICAgfQogICAgfQoKICAgIGZ1bmN0aW9uIGN0eF90ZW5hbnRfaWQoYXJyYXkgJGN0eCk6IGludCB7IHJldHVybiAoaW50KSgkY3R4Wyd0ZW5hbnRfaWQnXSA/PyAxKTsgfQogICAgZnVuY3Rpb24gY3R4X3VzZXJuYW1lKGFycmF5ICRjdHgpOiBzdHJpbmcgeyByZXR1cm4gKHN0cmluZykoJGN0eFsnYXV0aF91c2VyJ11bJ3VzZXJuYW1lJ10gPz8gJycpOyB9CgogICAgLy8gLS0tLSBVSQogICAgICBmdW5jdGlvbiBnc3RfdHlwZV9sYWJlbChzdHJpbmcgJHQpOiBzdHJpbmcgeyByZXR1cm4gJHQ9PT0nQ0dTVF9TR1NUJz8nQ0dTVCtTR1NUJzokdDsgfQogICAgZnVuY3Rpb24gcmVuZGVyX2Vycm9ycyhhcnJheSAkZXJyb3JzKTogdm9pZCB7CiAgICAgIGlmICghJGVycm9ycykgcmV0dXJuOwogICAgICBlY2hvICc8ZGl2IGNsYXNzPSJib3ggZXJyIj48c3Ryb25nPlBsZWFzZSBmaXg6PC9zdHJvbmc+PHVsPic7CiAgICAgIGZvcmVhY2ggKCRlcnJvcnMgYXMgJGUpIGVjaG8gJzxsaT4nLihoKCRlKSkuJzwvbGk+JzsKICAgICAgZWNobyAnPC91bD48L2Rpdj4nOwogICAgfQogICAgZnVuY3Rpb24gc2VsKHN0cmluZyAkbmFtZSwgYXJyYXkgJG9wdHMsID9zdHJpbmcgJHNlbCk6IHN0cmluZyB7CiAgICAgICRvdXQgPSAnPHNlbGVjdCBuYW1lPSInLihoKCRuYW1lKSkuJyI+JzsKICAgICAgZm9yZWFjaCAoJG9wdHMgYXMgJGs9PiR2KSB7CiAgICAgICAgJHNlbF9hdCA9ICgoc3RyaW5nKSRzZWwgPT09IChzdHJpbmcpJGspID8gJyBzZWxlY3RlZCcgOiAnJzsKICAgICAgICAkb3V0IC49ICc8b3B0aW9uIHZhbHVlPSInLihoKChzdHJpbmcpJGspKS4nIicgJy4kc2VsX2F0Lic+Jy4oaCgoc3RyaW5nKSR2KSkuJzwvb3B0aW9uPic7CiAgICAgIH0KICAgICAgJ291dCAuPSAnPC9zZWxlY3Q+JzsKICAgICAgcmV0dXJuICRvdXQ7CiAgICB9CgogICAgZnVuY3Rpb24gZ2V0X3NldHRpbmcoYXJyYXkgJGN0eCwgc3RyaW5nICRrZXksIHN0cmluZyAkZGVmID0gJycpOiBzdHJpbmcgewogICAgICAkc3QgPSAkY3R4WydwZG9fdWknXS0+cHJlcGFyZSgiU0VMRUNUIHNldHRpbmdfdmFsdWUgRlJPTSBzZXR0aW5ncyBXSEVSRSB0ZW5hbnRfaWQ9PyBBTkQgc2V0dGluZ19rZXk9PyIpOwogICAgICAkc3QtPmV4ZWN1dGUoW2N0eF90ZW5hbnRfaWQoJGN0eCksICRrZXldKTsKICAgICAgJHYgPSAkc3QtPmZldGNoQ29sdW1uKCk7CiAgICAgIHJldHVybiAkdiAhPT0gZmFsc2UgPyAoc3RyaW5nKSR2IDogJGRlZjsKICAgIH0KICAgIGZ1bmN0aW9uIHNldF9zZXR0aW5nKGFycmF5ICRjdHgsIHN0cmluZyAka2V5LCBzdHJpbmcgJHZhbCk6IHZvaWQgewogICAgICBkYl9leGVjKCRjdHhbJ3Bkb191aSddLCAiUkVQTEFDRSBJTlRPIHNldHRpbmdzKHRlbmFudF9pZCxzZXR0aW5nX2tleSxzZXR0aW5nX3ZhbHVlKSBWQUxVRVMgKD8sPyw/KSIgLCBbY3R4X3RlbmFudF9pZCgkY3R4KSwgJGtleSwgJHZhbF0pOwogICAgfQoKICAgIC8vIC0tLS0gQXV0aAogICAgZnVuY3Rpb24gYXV0aF9sb2dpbihhcnJheSAkY3R4LCBzdHJpbmcgJHVzZXJuYW1lLCBzdHJpbmcgJHBhc3MpOiBib29sIHsKICAgICAgJHJvdyA9IGRiX29uZSgkY3R4WydwZG9fdWknXSwgIlNFTEVDVCB1c2VyX2lkLHRlbmFudF9pZCx1c2VybmFtZSxwYXNzd29yZF9oYXNoLGRpc3BsYXlfbmFtZSxyb2xlIEZST00gdXNlcnMgV0hFUkUgdXNlcm5hbWU9PyBBTkQgaXNfYWN0aXZlPTEiLCBbJHVzZXJuYW1lXSk7CiAgICAgIGlmICghJHJvdykgcmV0dXJuIGZhbHNlOwogICAgICBpZiAoIXBhc3N3b3JkX3ZlcmlmeSgkcGFzcywgJHJvd1sncGFzc3dvcmRfaGFzaCddKSkJIHJldHVybiBmYWxzZTsKICAgICAgJGN0eFsnc2Vzc2lvbiddWyd1c2VyX2lkJ10gPSAoaW50KSRyb3dbJ3VzZXJfaWQnXTsKICAgICAgJGN0eFsnc2Vzc2lvbiddWyd0ZW5hbnRfaWQnXSA9IChpbnQpJHJvd1sndGVuYW50X2lkJ107CiAgICAgIGRiX2V4ZWMoJGN0eFsncGRvX3VpJ10sICJVUEREQVRFIHVzZXJzIFNFVCBsYXN0X2xvZ2luX2F0PU5PVygpIFdIRVJFIHVzZXJfaWQ9PyIsIFsoaW50KSRyb3dbJ3VzZXJfaWQnXV0pOwogICAgICByZXR1cm4gdHJ1ZTsKICAgIH0KICAgIGZ1bmN0aW9uIGF1dGhfbG9nb3V0KGFycmF5ICRjdHgpOiB2b2lkIHsKICAgICAgJGN0eFsnc2Vzc2lvbiddID0gW107CiAgICAgIGlmIChpbmlfZ2V0KCJzZXNzaW9uLnVzZV9jb29raWVzIikpIHsKICAgICAgICAkcCA9IHNlc3Npb25fZ2V0X2Nvb2tpZV9wYXJhbXMoKTsKICAgICAgICBzZXRjb29raWUoc2Vzc2lvbl9uYW1lKCksICcnLCB0aW1lKCktNDIwMDAsICRwWydwYXRoJ10sICRwWydkb21haW4nXSwgJHBbJ3NlY3VyZSddLCAkcFsnaHR0cG9ubHknXSk7CiAgICAgIH0KICAgICAgc2Vzc2lvbl9kZXN0cm95KCk7CiAgICB9CgogICAgLy8gLS0tLSBNYXN0ZXJzOiBQYXJ0eSAoQTIpCiAgICBmdW5jdGlvbiBwYXJ0eV9zYXZlKGFycmF5ICRjdHgsIGFycmF5ICRkLCBhcnJheSAmJGVycm9ycyk6IGludCB7CiAgICAgICR0aWQgPSBjdHhfdGVuYW50X2lkKCRjdHgpOwogICAgICAkcG0gPSAkY3R4WydwZG9fbWFzdGVyJ107CiAgICAgICRkWydjdXN0b21lcl9jb2RlJ10gPSB0cmltKCRkWydjdXN0b21lcl9jb2RlJ10pOwogICAgICAkZFsnY3VzdG9tZXJfbmFtZSddID0gdHJpbSgkZFsnY3VzdG9tZXJfbmFtZSddKTsKICAgICAgJGdzdGluID0gc3RydG91cHBlcih0cmltKCRkWydnc3RpbiddKSk7CiAgICAgICRwYW4gPSBzdHJ0b3VwcGVyKHRyaW0oJGRbJ3BhbiddKSk7CiAgICAgICRzdGF0ZSA9IHN0cnRvdXBwZXIodHJpbSgkZFsnc3RhdGVfY29kZSddKSk7CiAgICAgIGlmICgkZFsnY3VzdG9tZXJfY29kZSddPT09JycpICRlcnJvcnNbXT0iQ3VzdG9tZXIgQ29kZSByZXF1aXJlZC4iOwogICAgICBpZiAoJGRbJ2N1c3RvbWVyX25hbWUnXT09PScnKSBlcnJvcnNbXT0iQ3VzdG9tZXIgTmFtZSByZXF1aXJlZC4iOwogICAgICBpZiAoJGdzdGluIT09JycgJiYgIXZhbGlkYXRlX2dzdGluKCRnc3RpbikpICRlcnJvcnNbXT0iR1NUSU4gbXVzdCBiZSAxNSBjaGFycyAoYWxwaGFudW1lcmljKS4iOwogICAgICBpZiAoJHBhbj09PScnKSB7IC8vog==', 'b93ab58ad7a4bb669e5d2f7352618834e0f127469605a02aa30ee7436e9a7774', 2, '2026-01-17 18:57:27', 1),
('core_css', 'CSS', 'Ym9keXtmb250LWZhbWlseTpzeXN0ZW0tdWksLWFwcGxlLXN5c3RlbSxTZWdvZSBVSSxSb2JvdG8sQXJpYWwsc2Fucy1zZXJpZjtjb2xvcjojMTExO21hcmdpbjowO2JhY2tncm91bmQ6I2Y2ZjhmYzt9CmEge2NvbG9yOiMwNjY2Y2M7dGV4dC1kZWNvcmF0aW9uOm5vbmV9CmEuYnRue2NvbG9yOiNmZmZ9Ci5jb250YWluZXJ7bWF4LXdpZHRoOjEyMDBweDttYXJnaW46MCA4cHggMjRweDtwYWRkaW5nOjB9Ci5oZWFkZXJ7YmFja2dyb3VuZDojMTgyMjMwO2NvbG9yOiNmZmY7cGFkZGluZzoxMHB4IDEycHg7fQouaGVhZGVyIG5hdiBhIHttYXJnaW4tcmlnaHQ6MTJweDtjb2xvcjojZmZmO29wYWNpdHk6MC45fQouaGVhZGVyIG5hdiBhOmhvdmVye29wYWNpdHk6MX0KLmJveHtiYWNrZ3JvdW5kOiNmZmY7Ym9yZGVyOjFweCBzb2xpZCAjZGRkO2JvcmRlci1yYWRpdXM6OHB4O3BhZGRpbmc6MTJweDttYXJnaW46MTJweCAwO2JveC1zaGFkb3c6MCAxcHggMnB4IHJnYmEoMCwwLDAsMC4wNSk7fQoucm93e2Rpc3BsYXk6ZmxleDtnYXA6MTJweDtmbGV4LXdyYXA6d3JhcDt9Ci5jb2w7LmNvbC0ye2ZsZXg6MTt9Ci5jb2wtMnttaW4td2lkdGg6MzIwcHh9CmlucHV0LHNlbGVjdCx0ZXh0YXJlYXt3aWR0aDoxMDAlO3BhZGRpbmc6OHB4O2JvcmRlcjoxcHggc29saWQgI2NjYztib3JkZXItcmFkaXVzOjZweDtiYWNrZ3JvdW5kOiNmZmY7fQpsYWJlbHtkaXNwbGF5OmJsb2NrO2ZvbnQtc2l6ZToxM3B4O2NvbG9yOiMzMzM7bWFyZ2luLWJvdHRvbToxMHB4O30Kc21hbGx7Y29sb3I6IzY2Njt9Ci5idG57ZGlzcGxheTppbmxpbmUtYmxvY2s7cGFkZGluZzo4cHggMTJweDtib3JkZXItcmFkaXVzOjZweDtib3JkZXI6MXB4IHNvbGlkICMyYTU2OWM7YmFja2dyb3VuZDojMmE1NjljO2NvbG9yOiNmZmY7Y3Vyc29yOnBvaW50ZXI7Zm9udC1zaXplOjE0cHg7fQouYnRuLnNlY29uZGFyeXtiYWNrZ3JvdW5kOiM0NDQ7Ym9yZGVyLWNvbG9yOiM0NDQ7fQouYnRuLmRhbmdlcntiYWNrZ3JvdW5kOiNiMzI2MWU7Ym9yZGVyLWNvbG9yOiNiMzI2MWU7fQouYnRuOnN1Ym1pdHt9Ci50YWJ7d2lkdGg6MTAwJTtib3JkZXItY29sbGFwc2U6Y29sbGFwc2U7Zm9udC1zaXplOjEzcHg7fQoudGFiIHRoLC50YWIgdGR7Ym9yZGVyOiAxcHggc29saWQgI2RkZDtwYWRkaW5nOjZweCA4cHg7dmVydGljYWwtYWxpZ246dG9wfQoudGFiIHRoe2JhY2tncm91bmQ6I2YwZjJmNTt0ZXh0LWFsaWduOmxlZnR9Ci5udW17dGV4dC1hbGlnbjpyaWdodDt3aGl0ZS1zcGFjZTpub3dyYXB9Ci5mbGFzaHtuYXJnICAgaW46MTBweCAwO3BhZGRpbmc6OHB4IDEycHg7Ym9yZGVyLXJhZGl1czo2cHg7Ym9yZGVyOjFweCBzb2xpZCAjY2NjO2JhY2tncm91bmQ6I2ZmZmZlYTt9Ci5lcnJ7Ym9yZGVyLWNvbG9yOiNiMzI2MWU7YmFja2dyb3VuZDojZmZlZWVlfQouZm9vdGVye3BhZGRpbmc6MjBweCAxMnB4O2NvbG9yOiM2NjY7Zm9udC1zaXplOjEycHg7fQouYmFkZ2V7ZGlzcGxheTppbmxpbmUtYmxvY2s7cGFkZGluZzoxcHggNnB4O2JvcmRlci1yYWRpdXM6MTBweDtmb250LXNpemU6MTJweDtiYWNrZ3JvdW5kOiNlZWU7fQouaW5saW5lZm9ybXtkaXNwbGF5OmlubGluZTt9Ci5tdXRlZHtjb2xvcjojODg4O2ZvbnQtc2l6ZToxMnB4O30K', '11ec0219b7c908fb484a87edf9e812dfd4aa27e981e0236a3662503665306363', 2, '2026-01-17 18:57:27', 1),
('core_js', 'JS', 'ZG9jdW1lbnQuYWRkRXZlbnRMaXN0ZW5lcignY2hhbmdlJywgZnVuY3Rpb24oZSkgewogIGNvbnN0IHQgPSBlLnRhcmdldDsKICBpZiAoIXQpIHJldHVybjsKICBpZiAodC5tYXRjaGVzICYmIHQubWF0Y2hlcygnc2VsZWN0W25hbWU9Iml0ZW1faWRzW10iXScpKSB7CiAgICBjb25zdCBvcHQgPSB0LnNlbGVjdGVkT3B0aW9uc1swXTsKICAgIGlmICghb3B0KSByZXR1cm47CiAgICBjb25zdCBwcmljZSA9IG9wdC5nZXRBdHRyaWJ1dGUoJ2RhdGEtcHJpY2UnKTsKICAgIGNvbnN0IHRyID0gdC5jbG9zZXN0KCdycicpOwogICAgaWYgKHRyKSB7CiAgICAgIGNvbnN0IHAgPSB0ci5xdWVyeVNlbGVjdG9yKCdpbnB1dFtuYW1lPSJwcmljZXNbXSIpOwogICAgICBpZiAocCAmJiBwLnZhbHVlID09PSAnJyAmJiBwcmljZSAhPT0gbnVsbCkgewogICAgICAgIHAudmFsdWUgPSBwcmljZTsKICAgICAgfQogICAgfQogIH0KfSk7Cg==', 'd00fb85479644d9d5aacd81654b254a53c0009074d3acfbfc082995d02fa9cce', 2, '2026-01-17 18:57:27', 1),
('layout_footer', 'PHP', 'ICAgICAgZWNobyAnPC9kaXY+JzsKICAgICAgZWNobyAnPGRpdiBjbGFzcz0iZm9vdGVyIj5Db3B5cmlnaHQgJiMxaTY5OyBPcGVyYXRpb25zLWZpcnN0IEFjY291bnRpbmcgKERCIGRyaXZlbik8L2Rpdj4nOwogICAgICBlY2hvICI8L2JvZHk+PC9odG1sPiI7Cg==', '3b40e368df7d82bfa4dc230fb57177b459c3ff47a4eccd7bc0a0c0759d404e9c', 2, '2026-01-17 18:57:27', 1),
('layout_head', 'PHP', 'ICAgICAgJGNoYXJzZXQgPSAndXRmLTgnOwogICAgICAkdGl0bGUgPSAkY3R4WydwYWdlX3RpdGxlJ10gPz8gJ09wZXJhdGlvbnMgQWNjb3VudGluZyc7CiAgICAgIGhlYWRlcignQ29udGVudC1UeXBlOiB0ZXh0L2h0bWw7IGNoYXJzZXQ9JyAuICRjaGFyc2V0KTsKICAgICAgZWNobyAiPCFkb2N0eXBlIGh0bWw+PGh0bWwgbGFuZz1cImVuXCI+PGhlYWQ+PG1ldGEgY2hhcnNldD1cInV0Zi04XCI+PG1ldGEgbmFtZT1cInZpZXdwb3J0XCIgY29udGVudD1cIndpZHRoPWRldmljZS13aWR0aCwgaW5pdGlhbC1zY2FsZT0xXCI+PG1ldGEgaHR0cC1lcXVpdj1cIlgtVUEtQ29tcGF0aWJsZVwiIGNvbnRlbnQ9XCI9ZWRnZVwiPiI7CiAgICAgIGVjaG8gIjx0aXRsZT4iIC4gaCgkdGl0bGUpIC4gIjwvdGl0bGU+IjsKICAgICAgZWNobyAiPC9oZWFkPjxib2R5PiI7Cg==', 'f853cdd5e49d4b7ca7ef9c22f46d2af33f09ff2888f976d1116ea2d431479644', 2, '2026-01-17 17:28:30', 1),
('layout_header', 'PHP', 'ICAgICAgJGZsYXNoID0gZmxhc2hfYWxsKCk7CiAgICAgIGVjaG8gJzxkaXYgY2xhc3M9ImhlYWRlciI+PGI+T3BlcmF0aW9ucyBBY2NvdW50aW5nPC9iPiA8c3BhbiBjbGFzcz0iYmFkZ2UiPkRCT0xZLSBET1ZFTjwvc3Bhbj4nOwogICAgICBlY2hvICc8bmF2IHN0eWxlPSJtYXJnaW4tdG9wOjZweDsiPic7CiAgICAgIGlmICghZW1wdHkoJGN0eFsnYXV0aF91c2VyJ10pKSB7CiAgICAgICAgZWNobyAnPGEgaHJlZj0iJy5oKHUoJy8nKSkuJyI+RGFzaGJvYXJkPC9hPic7CiAgICAgICAgZWNobyAnPGEgaHJlZj0iJy5oKHUoJy9tYXN0ZXJzL3BhcnR5JykpLiciPj5QYXJ0eSBNYXN0ZXI8L2E+JzsKICAgICAgICBlY2hvICc8YSBocmVmPSInLihoKHUoJy9tYXN0ZXJzL2l0ZW0nKSkpLiciPkl0ZW0gTWFzdGVyPC9hPic7CiAgICAgICAgZWNobyAnPGEgaHJlZj0iJy5oKHUoJy9tYXN0ZXJzL2hzbi1yYXRlLWhpc3RvcnknKSkpLiciPkhTTi9TQUMgKyBSYXRlPC9hPic7CiAgICAgICAgZWNobyAnPGEgaHJlZj0iJy5oKHUoJy9zYWxlcy9pbnZvaWNlL2xpc3QnKSkpLiciPlNhbGVzIEludm9pY2VzPC9hPic7CiAgICAgICAgZWNobyAnPGEgaHJlZj0iJy5oKHUoJy9zZXR0aW5ncycpKSkuJyI+U2V0dGluZ3M8L2E+JzsKICAgICAgICBlY2hvICc8YSBocmVmPSInLihoKHUoJy9sb2dvdXQnKSkpLiciPlN1ZC1vdXQ8L2E+JzsKICAgICAgICBlY2hvICc8c3BhbiBjbGFzcz0ibXV0ZWQiIHN0eWxlPSJtYXJnaW4tbGVmdDoxMHB4OyI+VXNlcjogJy5oKCRjdHhbJ2F1dGhfdXNlciddWyd1c2VybmFtZSddKS4nPC9zcGFuPic7CiAgICAgIH0gZWxzZSB7CiAgICAgICAgZWNobyAnPGEgaHJlZj0iJy5oKHUoJy9sb2dpbicpKS4nIj5Mb2dpbjwvYT4nOwogICAgICB9CiAgICAgIGVjaG8gJzwvbmF2PjwvZGl2Pic7CgogICAgICBlY2hvICc8ZGl2IGNsYXNzPSJjb250YWluZXIiPic7CiAgICAgIGZvcmVhY2ggKCRmbGFzaCBhcyAkaz0+JG0pIHsKICAgICAgICAkY2xzID0gKGluX2FycmF5KCRrLFsnZXJyb3InLCdkYW5nZXInXSx0cnVlKSkgPyAnYm94IGVycicgOiAnYm94IGZsYXNoJzsKICAgICAgICBlY2hvICc8ZGl2IGNsYXNzPSInLihoKCRjbHMpKS4nIj4nLihoKCRtKSkuJzwvZGl2Pic7CiAgICAgIH0K', '62dc90d0a01ea71a0e5267b33978fd4beb899cd1e95fb8716d4a8809eb4d2e7c', 2, '2026-01-17 18:57:27', 1),
('page_dispatch', 'PHP', 'ICAgICAgYXBwX2Rpc3BhdGNoKCRjdHgpOwo=', '0703dffbaae4799e4efc0bc1fb44bba1acc9e65f861ee04e7617e0e280cfe50f', 2, '2026-01-17 18:57:27', 1);

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
  `password_hash` varchar(255) NOT NULL,
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

INSERT INTO `users` (`user_id`, `tenant_id`, `username`, `password_hash`, `display_name`, `role`, `is_active`, `last_login_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', '$2y$10$KL9/Atunw7pXj8brbQs1F.0EqOVQMvl6xHjTlKGUsD5idK8uokXGS', 'Administrator', 'ADMIN', 1, NULL, '2026-01-17 12:59:50', '2026-01-17 12:59:50');

--
-- Indexes for dumped tables
--

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
