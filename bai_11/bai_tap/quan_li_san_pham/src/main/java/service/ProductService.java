package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    Product findById(int id);
    List<Product> findByName(String name);
    boolean add(Product product);
    void delete(int id);
    void update(int id, Product product);
}
