package repository.customer;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.BaseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_ALL_CUSTOMER = "select c.*, ct.name as ct_name from customer c join customer_type ct on c.customer_type_id = ct.id";
    private final String INSERT_CUSTOMER = "call insert_customer(?, ?, ?, ?, ?, ?, ?, ?)";
    private final String SELECT_ALL_CUSTOMER_TYPE = "select * from customer_type";
    private final String DELETE_CUSTOMER = "call delete_customer(?)";
    private final String UPDATE_CUSTOMER = "update customer set customer_type_id = ?, name = ?, date_of_birth = ?, gender = ?, id_card = ?, phone_number = ?, email = ?, address = ? where id = ?";
    private final String SELECT_USER_BY_ID = "select c.*, ct.name as ct_name from customer c join customer_type ct on c.customer_type_id = ct.id where c.id = ?";
    private final String SEARCH_CUSTOMER = "select c.*, ct.name as ct_name from customer c join customer_type ct on c.customer_type_id = ct.id where c.name like ? and c.address  like ? and c.phone_number like ?";

    @Override
    public boolean insertCustomer(Customer customer) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(INSERT_CUSTOMER);
            callableStatement.setInt(1, customer.getCustomerType().getCustomerTypeId());
            callableStatement.setString(2, customer.getName());
            callableStatement.setString(3, customer.getDateOfBirth());
            callableStatement.setBoolean(4, customer.isGender());
            callableStatement.setString(5, customer.getIdCard());
            callableStatement.setString(6, customer.getPhoneNumber());
            callableStatement.setString(7, customer.getEmail());
            callableStatement.setString(8, customer.getAddress());

            return callableStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int customerTypeId = resultSet.getInt("customer_type_id");
                String customerTypeName = resultSet.getString("ct_name");
                CustomerType customerType = new CustomerType(customerTypeId, customerTypeName);
                String name = resultSet.getString("name");
                String date = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String customerPhone = resultSet.getString("phone_number");
                String customerEmail = resultSet.getString("email");
                String customerAddress = resultSet.getString("address");
                Customer customer = new Customer(id, customerType, name, date, gender, idCard, customerPhone, customerEmail, customerAddress);
                customerList.add(customer);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public List<CustomerType> selectAllCustomerType() {
        List<CustomerType> customerTypes = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int customer_type_id = resultSet.getInt("id");
                String customer_type_name = resultSet.getNString("name");
                CustomerType customerType = new CustomerType(customer_type_id, customer_type_name);
                customerTypes.add(customerType);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypes;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setInt(1, customer.getCustomerType().getCustomerTypeId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDateOfBirth());
            preparedStatement.setBoolean(4, customer.isGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhoneNumber());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, customer.getId());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_CUSTOMER);
            callableStatement.setInt(1, id);
            return callableStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Customer> search(String nameSearch, String addressSearch, String phoneNumberSearch) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER);
            preparedStatement.setString(1, "%" + nameSearch + "%");
            preparedStatement.setString(2, "%" + addressSearch + "%");
            preparedStatement.setString(3, "%" + phoneNumberSearch + "%");


            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int customerTypeId = resultSet.getInt("customer_type_id");
                String customerTypeName = resultSet.getString("ct_name");
                CustomerType customerType = new CustomerType(customerTypeId, customerTypeName);
                String name = resultSet.getString("name");
                String date = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String customerPhone = resultSet.getString("phone_number");
                String customerEmail = resultSet.getString("email");
                String customerAddress = resultSet.getString("address");
                Customer customer = new Customer(id, customerType, name, date, gender, idCard, customerPhone, customerEmail, customerAddress);
                customerList.add(customer);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customerList;
    }

    @Override
    public Customer selectIdCustomer(int id) {
        Customer customer = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int customerTypeId = resultSet.getInt("customer_type_id");
                String customerTypeName = resultSet.getString("ct_name");
                CustomerType customerType = new CustomerType(customerTypeId, customerTypeName);
                String name = resultSet.getString("name");
                String date = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String customerPhone = resultSet.getString("phone_number");
                String customerEmail = resultSet.getString("email");
                String customerAddress = resultSet.getString("address");
                customer = new Customer(id, customerType, name, date, gender, idCard, customerPhone, customerEmail, customerAddress);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }
}
