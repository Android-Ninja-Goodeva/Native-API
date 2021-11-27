<?php

    require "../config/connection.php";

    if ($_SERVER['REQUEST_METHOD'] == "POST") {

        $kd_prd = $_POST['kode_product'];
        $desc = $_POST['product_description'];
        $unit = $_POST['unit'];
        $price = $_POST['unit_price'];
        $tipe = $_POST['type'];

        #code
        $QUERY_TAMBAHPRODUK = 
        "INSERT INTO tbl_product (kode_product, product_description, unit, unit_price, type) VALUES ('$kd_prd',	'$desc', '$unit', $price,'$tipe')";

        $EXECUTE_QUERY = mysqli_query($connecting, $QUERY_TAMBAHPRODUK);

        if ($EXECUTE_QUERY) {
            $kode = "201";
            $info = "Berhasil ditambahkan";
        } else {
            $kode = "400";
            $info = "Gagal ditambahkan";
        }

        echo json_encode(array('info'=>$info, 'kode'=>$kode));

        mysqli_close($connecting);
    }
?>