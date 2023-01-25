package com.lithan;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lithan.entity.productshoppingcart;
import com.lithan.entity.user;

@Service
@Transactional
public class ProductShoppingCartService {
    @Autowired
    ProductShoppingCartRepository repo;

    public void save(productshoppingcart productshoppingcart) {
        repo.save(productshoppingcart);
    }

    public List < productshoppingcart > listAll() {
        return (List < productshoppingcart > ) repo.findAll();
    }

    public productshoppingcart get(Long id) {
        return repo.findById(id).get();
    }

    public void delete(Long id) {
        repo.deleteById(id);
    }

    public List < productshoppingcart > search(String keyword) {
        return repo.search(keyword);
    }

}