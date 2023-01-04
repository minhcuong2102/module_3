package service;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.customer.CustomerRepository;
import repository.customer.ICustomerRepository;

import java.sql.SQLException;
import java.util.List;

public class CustomerService implements ICustomerService{
    private final ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public boolean insertCustomer(Customer customer) throws SQLException {
        return customerRepository.insertCustomer(customer);
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepository.selectAllCustomer();
    }

    @Override
    public List<CustomerType> selectAllCustomerType() {
        return customerRepository.selectAllCustomerType();
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        return customerRepository.updateCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public List<Customer> search(String nameSearch, String customerTypeSearch) {
        return customerRepository.search(nameSearch, customerTypeSearch);
    }

    @Override
    public Customer selectIdCustomer(int id) {
        return customerRepository.selectIdCustomer(id);
    }
}
