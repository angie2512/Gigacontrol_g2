package com.example.gigacontrol_g2.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class BaseDao{

    public Connection getConnection() throws SQLException {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }
        String user = "root";
        //contraseña de la instancia de la BD de google cloud
        //String pass = "gigacontrol2022";
        String pass="root";
        String database = "gigacontrol";
        //IP : de la BD
        String url = "jdbc:mysql://localhost:3306/" + database;
        //String url = "jdbc:mysql://34.28.132.192:3306/" + database;
        return DriverManager.getConnection(url, user, pass);
    }

}