package com.lithan;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.lithan.entity.user;

public interface UserRepository extends CrudRepository<user,Long> {

	@Query(value = "SELECT c FROM user c WHERE c.FirstName LIKE '%' || :keyword || '%'"
			+ " OR c.LastName LIKE '%' || :keyword || '%'")
	public List<user> search(@Param("keyword") String keyword);
			
	@Query(value = "SELECT c FROM user c WHERE c.EmailAddress = :keyword ")
	public List<user> searchEmailAddress(@Param("keyword") String keyword);
	
}
