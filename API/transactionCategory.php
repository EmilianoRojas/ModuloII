<?php
include "config.php";
include "utils.php";


$dbConn =  connect($db);


if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
  header('Access-Control-Allow-Origin: *');
  header('Access-Control-Allow-Methods: POST, GET, DELETE, PUT, PATCH, OPTIONS');
  header('Access-Control-Allow-Headers: token, Content-Type');
  header('Access-Control-Max-Age: 1728000');
  header('Content-Length: 0');
  header('Content-Type: application/json');
  die();
}

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

/*
  listar todos las transacciones o solo una transaccion
 */
if ($_SERVER['REQUEST_METHOD'] == 'GET')
{
      //Mostrar lista de transacciones
      $sql = $dbConn->prepare("SELECT t.amount, t.description,t.ID, c.name as category, c.ID as id_category FROM transaction t INNER JOIN category c ON t.id_category = c.ID");
      $sql->execute();
      $sql->setFetchMode(PDO::FETCH_ASSOC);
      header("HTTP/1.1 200 OK");
      echo json_encode( $sql->fetchAll()  );
      exit();
}




//En caso de que ninguna de las opciones anteriores se haya ejecutado
header("HTTP/1.1 400 Bad Request");

?>