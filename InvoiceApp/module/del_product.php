<?php

    require "../config/connection.php";

    if ($_SERVER['REQUEST_METHOD'] == "POST") {

        $kd_prd = $_POST['kode_product'];

        #code
        $QUERY_REMOVEPRODUK = 
        "DELETE FROM tbl_product WHERE kode_product = '$kd_prd';";

        $EXECUTE_QUERY = mysqli_query($connecting, $QUERY_REMOVEPRODUK);

        if ($EXECUTE_QUERY) {
            $kode = "201";
            $info = "Berhasil dihapus";
        } else {
            $kode = "400";
            $info = "Gagal gagal";
        }

        echo json_encode(array('info'=>$info, 'kode'=>$kode));

        mysqli_close($connecting);
    }
?>