<?php

    require "../config/connection.php";

    if ($_SERVER['REQUEST_METHOD'] == "GET") {
        
        #code
        $QUERY_SHOWINVOICES = 
        "SELECT tbl_invoice.no_invoice, tbl_invoice.invoice_date, tbl_invoice.payment_term, tbl_invoice.due_date, tbl_invoice.salesmen, tbl_invoice.currency, tbl_customer.customer, tbl_management.nama_manager FROM tbl_invoice JOIN tbl_customer ON tbl_customer.kode_customer = tbl_invoice.kode_customer JOIN tbl_management ON tbl_management.kode_manager = tbl_invoice.kode_manager;";

        $EXECUTE_QUERY = mysqli_query($connecting, $QUERY_SHOWINVOICES);

        $result = array();

        $kode = "202";
        $info = "Berhasil ditampilkan";

        while($row = mysqli_fetch_array($EXECUTE_QUERY)) {
            array_push(
                $result, array (
                    "no_invoice"=>$row['no_invoice'],
                    "invoice_date"=>$row['invoice_date'],
                    "payment_term"=>$row['payment_term'],
                    "due_date"=>$row['due_date'],
                    "salesmen"=>$row['salesmen'],
                    "currency"=>$row['currency'],
                    "customer"=>$row['customer'],
                    "nama_manager"=>$row['nama_manager']
                ));
        }

        echo json_encode(array('info'=>$info, 'kode'=>$kode, 'data_invoice'=>$result));

        mysqli_close($connecting);
    }

?>