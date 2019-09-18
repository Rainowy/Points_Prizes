package pl.pointsprizes.services;

import org.apache.commons.dbutils.DbUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbService {

    private static String dbUrl;
    //private static String dbName = "prize_for_points";
    private static String dbUser = "prize";
    private static String dbPass = "sabaka";

    public static void initParams(String dbName) {
        dbUrl = "jdbc:mysql://192.168.1.108:3307/" + dbName + "?useSSL=false&characterEncoding=utf8&useLegacyDatetimeCode=false&serverTimezone=UTC&useOldAliasMetadataBehavior=true";
    }

    public static Connection getConnection(String dbName) throws SQLException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        initParams(dbName);

        return DriverManager.getConnection(dbUrl, dbUser, dbPass);
    }

    public static void executeQuery(String query, String[] params, String dbName)  {

        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = getConnection(dbName);

            st = conn.prepareStatement(query);

            setParams(params, st);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(st);
            DbUtils.closeQuietly(conn);
        }
    }

    public static int executeInsert(String query, String[] params, String dbName) {

        int newId = 0;
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = getConnection(dbName);

            String[] generatedKeys = {"ID"};

            st = conn.prepareStatement(query, generatedKeys);

            setParams(params, st);

            st.executeUpdate();

            rs = st.getGeneratedKeys();

            if (rs.next()) {
                newId = rs.getInt(1);
                return newId;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(st);
            DbUtils.closeQuietly(conn);
        }
        return newId;
    }
//        else {
//            throw new Exception("No new Id");
//        }

    public static List<String[]> getData(String query, String[] params, String dbName) {

        List<String[]> result = null;
        ResultSet rs = null;
        PreparedStatement st = null;
        Connection conn = null;
        try {
            conn = getConnection(dbName);

            st = conn.prepareStatement(query);

            setParams(params, st);

            rs = st.executeQuery();

            ResultSetMetaData metaData = rs.getMetaData();

            result = new ArrayList<>();

            while (rs.next()) {
                String[] row = new String[metaData.getColumnCount()];
                for (int i = 1; i <= metaData.getColumnCount(); i++) {   //iterujemy przez ilość kolumn
                    String columnName = metaData.getColumnName(i);      //pobieramy nazwę konkretnej kolumny
                    row[i - 1] = rs.getString(columnName);                //wstawiamy do tablicy wartość pobraną z konkretnej kolumny na podstawie jej nazwy
                }
                result.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(st);
            DbUtils.closeQuietly(conn);
        }
        return result;
    }

    private static void setParams(String[] params, PreparedStatement st) throws SQLException {
        if (params != null) {
            int paramNumber = 1;
            for (String param : params) {
                st.setString(paramNumber, param);
                paramNumber++;
            }
        }
    }
}
