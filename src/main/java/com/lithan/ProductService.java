package com.lithan;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lithan.entity.product;

@Service
@Transactional
public class ProductService {
	@Autowired
	ProductRepository repo;

	public void save(product product) {
		repo.save(product);
	}

	public List<product> listAll() {
		return (List<product>) repo.findAll();
	}

	public product get(Long id) {
		return repo.findById(id).get();
	}

	public void delete(Long id) {
		repo.deleteById(id);
	}
	
	public List<product> search(String keyword) {
		return repo.search(keyword);
	}

	
}