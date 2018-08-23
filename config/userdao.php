<?php

include 'conexion.php';
include '../models/user.php';

class userdao extends conexion
{
	protected static $cnx;

	private static function getconexion()
	{
		self::$cnx = conexion::conectar();

	}

	private static function desconectar()
	{
		self::$cnx = null;
	}


//Metodo para validar login
public static function login ($user)
{

	$query = ("SELECT id_user, nombre_user, correo_user, pass_user, created_user, updated_user 
		       FROM user
		       WHERE correo_user = :correo_user");

	           self::getConexion();

	           $correo_user = $user->getCorreo_user();

	           $resultado = self::$cnx->prepare($query);
	           $resultado->bindParam(":correo_user", $correo_user);

	           $resultado->execute();
	           $row = $resultado->fetch(PDO::FETCH_ASSOC);


	           if(password_verify('daniela', $row['pass_user']) ){
	           	return true;
	           }else{
	           	echo "Password o email invalido";
	           }

	          }
	      }

