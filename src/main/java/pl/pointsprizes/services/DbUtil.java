package pl.pointsprizes.services;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DbUtil {
//    private static DataSource ds;
//    public static Connection getConn() throws SQLException {
//        return getInstance().getConnection();
//    }
//    private static DataSource getInstance() {
//        if(ds == null) {
//            try {
//                Context initContext = new InitialContext();
//                Context envContext = (Context)initContext.lookup("java:/comp/env/");
//                ds = (DataSource)envContext.lookup("/jdbc/school");
////                Context ctx = new InitialContext();
////                ds = (DataSource)ctx.lookup("java:comp/env/jdbc/points");
//            } catch (NamingException e) {
//                e.printStackTrace();}}
//        return ds;}

    private static DataSource dataSource;
    public static Connection getConnection() throws SQLException {
        return getInstance().getConnection();   }
    private static DataSource getInstance() {
        if (dataSource == null) {
            try {
                Context initContext = new InitialContext();
                Context envContext = (Context)initContext.lookup("java:/comp/env");
                dataSource = (DataSource)envContext.lookup("jdbc/school");
            } catch (NamingException e) { e.printStackTrace(); }
        }
        return dataSource;
    }
}

