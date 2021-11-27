<?php

    require "../config/connection.php";

    if ($_SERVER['REQUEST_METHOD'] == "POST") {

        $kd_prd = $_POST['kode_product'];
        $desc = $_POST['product_description'];
        $unit = $_POST['unit'];
        $price = $_POST['unit_price'];
        $tipe = $_POST['type'];

        #code
        $QUERY_UBAHPRODUK = 
        "UPDATE tbl_product SET kode_product = '$kd_prd', product_description = '$desc', unit = '$unit', unit_price = $price, type = '$tipe' WHERE kode_product = '$kd_prd';";

        $EXECUTE_QUERY = mysqli_query($connecting, $QUERY_UBAHPRODUK);

        if ($EXECUTE_QUERY) {
            $kode = "202";
            $info = "Berhasil dimodify";
        } else {
            $kode = "400";
            $info = "Gagal dimodify";
        }

        echo json_encode(array('info'=>$info, 'kode'=>$kode));

        mysqli_close($connecting);
    }
?>