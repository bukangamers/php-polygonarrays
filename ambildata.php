<?php
header('Content-Type: application/json');

require ('connect.php');

$sql = "SELECT a.*, 
	`b`.`nama_kecamatan` as `nama_kecamatan`, 
	`c`.`nama_status` as `nama_status`,
	`c`.`warna` as `warna`
	FROM `lokasi_lahan` AS `a`
	JOIN `kecamatan` AS `b` ON a.kecamatan = b.id
	JOIN `status` AS `c` ON a.status = c.id
	ORDER BY `a`.`id`";

$data = mysqli_query($GLOBALS["___mysqli_ston"], $sql);

$json = '{"karawang": {';
$json .= '"lahan":[ ';
while($x = mysqli_fetch_assoc($data)){
	$json .= '{';
	$json .= '"id":"'.$x['id'].'",
		"nama_lokasi":"'.htmlspecialchars($x['nama_lokasi']).'",
		"kecamatan":"'.htmlspecialchars($x['nama_kecamatan']).'",
		"status":"'.$x['nama_status'].'",
		"keterangan":"'.htmlspecialchars($x['keterangan']).'",
		"alamat":"'.htmlspecialchars($x['alamat']).'",
		"polygon":"'.$x['polygon'].'",
		"warna":"'.$x['warna'].'"
	},';
}

$json = substr($json,0,strlen($json)-1);
$json .= ']';
$json .= '}}';

echo $json;

?>
