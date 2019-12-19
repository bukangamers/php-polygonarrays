-- Adminer 4.2.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `kecamatan`;
CREATE TABLE `kecamatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kecamatan` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `kecamatan` (`id`, `nama_kecamatan`, `latitude`, `longitude`) VALUES
(1,	'Banyusari',	'-6.307024',	'107.539073'),
(2,	'Batujaya',	'-6.049053',	'107.184049'),
(3,	'Ciampel',	'-6.419054',	'107.332086'),
(4,	'Cibuaya',	'-6.010564',	'107.328385'),
(5,	'Cikampek',	'-6.395705',	'107.437959'),
(6,	'Cilamaya Kulon',	'-6.211067',	'107.514957'),
(7,	'Cilamaya Wetan',	'-6.225596',	'107.572377'),
(8,	'Cilebar',	'-6.140040',	'107.411135'),
(9,	'Jatisari',	'-6.366683',	'107.528444'),
(10,	'Jayakerta',	'-6.097253',	'107.291675'),
(11,	'Karawang Barat',	'-6.301698',	'107.297413'),
(12,	'Karawang Timur',	'-6.306578',	'107.319616'),
(13,	'Klari',	'-6.366086',	'107.369129'),
(14,	'Kotabaru',	'-6.396697',	'107.481372'),
(15,	'Kutawaluya',	'-6.172189',	'107.343227'),
(16,	'Lemahabang',	'-6.292975',	'107.450643'),
(17,	'Majalaya',	'-6.301870',	'107.366882'),
(18,	'Pakisjaya',	'-5.995522',	'107.123966'),
(19,	'Pangkalan',	'-6.472040',	'107.217360'),
(20,	'Pedes',	'-6.082454',	'107.380069'),
(21,	'Purwasari',	'-6.369279',	'107.408983'),
(22,	'Rawamerta',	'-6.233683',	'107.350623'),
(23,	'Rengasdengklok',	'-6.180117',	'107.294079'),
(24,	'Tegalwaru',	'-6.520172',	'107.214830'),
(25,	'Talagasari',	'-6.273107',	'107.415015'),
(26,	'Telukjambe Barat',	'-6.344718',	'107.250664'),
(27,	'Telukjambe Timur',	'-6.332977',	'107.292487'),
(28,	'Tempuran',	'-6.189918',	'107.449963'),
(29,	'Tirtajaya',	'-6.030887',	'107.242450'),
(34,	'Tirtamulya',	'-6.349326',	'107.459571');

DROP TABLE IF EXISTS `lokasi_lahan`;
CREATE TABLE `lokasi_lahan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lokasi` varchar(255) NOT NULL,
  `kecamatan` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `status` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `polygon` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kecamatan` (`kecamatan`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `lokasi_lahan` (`id`, `nama_lokasi`, `kecamatan`, `alamat`, `status`, `keterangan`, `polygon`) VALUES
(7,	'dasd',	5,	'sadasdas',	1,	'zasdadasdasd',	'-6.3425969648362726,107.41058349609375 -6.3811535277603815,107.41024017333984 -6.3814947233552575,107.46894836425781 -6.325194384589051,107.45590209960938'),
(9,	'dadabf',	11,	'sdasdasd',	3,	'sadasdasd',	'-6.25182414305255,107.2983169555664 -6.271618064314864,107.2818374633789 -6.294823773446234,107.30827331542969 -6.26411011355174,107.34912872314453'),
(10,	'zcdzxczxczxc',	1,	'asfasfa',	2,	'czxczxczxczxc',	'-6.278443380278814,107.50740051269531 -6.301307536442828,107.50534057617188 -6.319393394223435,107.56473541259766 -6.265133931381416,107.57366180419922'),
(11,	'yuiyiyiyiyiu',	11,	'sdgsdgsdgsdgsdg',	3,	'assasdasdasd',	'-6.257839185538634,107.31552600860596 -6.262318427517906,107.31295108795166 -6.2672668787420385,107.31415271759033 -6.265944452405504,107.3196029663086 -6.265987111371907,107.32222080230713 -6.261849175397744,107.32363700866699 -6.257412589061297,107.32325077056885');

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_status` varchar(100) NOT NULL,
  `warna` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `status` (`id`, `nama_status`, `warna`) VALUES
(1,	'Panen',	'#008000'),
(2,	'Gagal Panen',	'#FF0000'),
(3,	'Tanam',	'#FFFF00');

-- 2015-08-24 21:59:05
