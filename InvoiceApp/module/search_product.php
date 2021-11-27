<?php

    require "../config/connection.php";

    if ($_SERVER['REQUEST_METHOD'] == "POST") {

        $desc = $_POST['product_description'];

        #code
        $QUERY_SEARCHPRODUKBYNAME = 
        "SELECT kode_product, product_description, unit, unit_price, type FROM tbl_product WHERE product_description LIKE '%$desc%';";

        $EXECUTE_QUERY = mysqli_query($connecting, $QUERY_SEARCHPRODUKBYNAME);

        $result = array();

        if ($EXECUTE_QUERY) {

            while($row = mysqli_fetch_array($EXECUTE_QUERY)) {
                array_push(
                    $result, array (
                        "kode_product"=>$row['kode_product'],
                        "product_description"=>$row['product_description'],
                        "unit"=>$row['unit'],
                        "unit_price"=>$row['unit_price'],
                        "type"=>$row['type']
                    ));
            }

            $kode = "202";
            $info = "Berhasil dicari";

            echo json_encode(array('info'=>$info, 'kode'=>$kode, 'search_product'=>$result));

        }

        mysqli_close($connecting);
    }
?>