package service.customer;

import model.customer.Customer;
import model.customer.CustomerType;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    boolean insertCustomer(Customer customer) throws SQLException;
    List<Customer> selectAllCustomer();
    List<CustomerType> selectAllCustomerType();
    boolean updateCustomer(Customer customer) throws SQLException;
    boolean deleteCustomer(int id) throws SQLException;
    List<Customer> search(String nameSearch, String addressSearch, String phoneNumberSearch);
    Customer selectIdCustomer(int id);
}
