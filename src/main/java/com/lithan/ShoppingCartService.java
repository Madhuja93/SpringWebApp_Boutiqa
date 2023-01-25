package com.lithan;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lithan.entity.shoppingcart;

@Service
@Transactional
public class ShoppingCartService {
	@Autowired
	ShoppingCartRepository repo;

	public void save(shoppingcart shoppingcart) {
		repo.save(shoppingcart);
	}

	public List<shoppingcart> listAll() {
		return (List<shoppingcart>) repo.findAll();
	}

	public shoppingcart get(Long id) {
		return repo.findById(id).get();
	}

	public void delete(Long id) {
		repo.deleteById(id);
	}
	
	public List<shoppingcart> search(String keyword) {
		return repo.search(keyword);
	}
	
}