<?php

    $HOST = "localhost"; // server web, 127.0.0.1
    $USER = "root";
    $KEY = "";
    $DB = "db_invoice";

    $connecting = mysqli_connect($HOST, $USER, $KEY, $DB);

    // Comment CTRL + /
    // if ($connecting) {
    //     echo "Berhasil terhubung ke server";
    // } else {
    //     echo "Gagal terhubung ke server";
    // }

?>