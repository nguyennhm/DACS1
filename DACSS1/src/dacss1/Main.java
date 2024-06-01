package dacss1;

import javax.swing.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {
    public static Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(  // truy cập dữ liệu
                    "jdbc:mysql://127.0.0.1:3306/DACS1",
                    "root",
                    "22032005"
            );
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(Main::createAndShowGUI);
    }

    private static void createAndShowGUI() {

        JFrame frame = new JFrame("Main Page Example");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        LOGIN LOGIN = new LOGIN();
//        Book_detail LOGIN = new Book_detail("ABC", 4);
        LOGIN.setTitle("LOGIN");
        LOGIN.setVisible(true);
        LOGIN.pack();
        LOGIN.setLocationRelativeTo(null);
        frame.dispose();

    }
}
