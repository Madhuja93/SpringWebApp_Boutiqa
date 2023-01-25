package com.lithan;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.lithan.entity.shoppingcart;
import com.lithan.entity.user;

public interface ShoppingCartRepository extends CrudRepository<shoppingcart,Long> {

	@Query(value = "SELECT c FROM user c WHERE c.FirstName LIKE '%' || :keyword || '%'"
			+ " OR c.LastName LIKE '%' || :keyword || '%'")
			public List<shoppingcart> search(@Param("keyword") String keyword);
	
}
