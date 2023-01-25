package com.lithan;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lithan.entity.user;

@Service
@Transactional
public class UserService {
	@Autowired
	UserRepository repo;

	public void save(user user) {
		repo.save(user);
	}

	public List<user> listAll() {
		return (List<user>) repo.findAll();
	}

	public user get(Long id) {
		return repo.findById(id).get();
	}

	public void delete(Long id) {
		repo.deleteById(id);
	}
	
	public List<user> search(String keyword) {
		return repo.search(keyword);
		}

	public List<user> searchEmailAddress(String keyword) {
		return repo.searchEmailAddress(keyword);
	}
	
}


