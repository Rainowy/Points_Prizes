package pl.pointsprizes.model;

import pl.pointsprizes.services.DbService;
import pl.pointsprizes.services.DbServicePFP;
import pl.pointsprizes.services.DbUtil;

import java.sql.Connection;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {

//        try {
//            Connection conn = DbUtil.getConnection();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

        try {
            DbService.getConnection("prize_for_points");
            System.out.println("Połączono");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("nie");
        }
    }
}
