package repository;

import model.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findAll();
    Product findById(int id);
    List<Product> findByName(String name);
    boolean add(Product product);
    void delete(int id);
    void update(int id, Product product);
}
