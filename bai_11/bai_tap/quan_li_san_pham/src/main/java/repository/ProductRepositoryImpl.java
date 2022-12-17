package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {
    private static final List<Product> productList;

    static {
        productList = new ArrayList<>();
        productList.add(new Product(1, "Sản phẩm 1", 10000, "Đây là sản phẩm 1", "Nhà sản xuất 1"));
        productList.add(new Product(2, "Sản phẩm 2", 50000, "Đây là sản phẩm 2", "Nhà sản xuất 1"));
        productList.add(new Product(3, "Sản phẩm 3", 150000, "Đây là sản phẩm 3", "Nhà sản xuất 3"));
        productList.add(new Product(4, "Sản phẩm 4", 12000, "Đây là sản phẩm 4", "Nhà sản xuất 1"));
        productList.add(new Product(5, "Sản phẩm 5", 35000, "Đây là sản phẩm 5", "Nhà sản xuất 2"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> list = new ArrayList<>();
        for (Product product : productList) {
            if (product.getName().toLowerCase().contains(name.toLowerCase())){
                list.add(product);
            }
        }
        return list;
    }

    @Override
    public boolean add(Product product) {
        return productList.add(product);
    }

    @Override
    public void delete(int id) {
        productList.removeIf(product -> product.getId() == id);
    }

    @Override
    public void update(int id, Product product) {
        productList.set(id, product);
    }

}
