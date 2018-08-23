<?php

//conexion a la base de datos (PDO)
class conexion {

	public static function conectar(){
		try{
			$cn = new PDO("mysql:host=localhost;dbname=scriptweb", "root", "");
		    
		    //echo conectado
		    return $cn;

		} catch (Exception $ex) {
			die($ex->getMessage());
		}
	  
	  }
	
}

//conexion :: conectar;
