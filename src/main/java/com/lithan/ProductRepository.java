package com.lithan;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.lithan.entity.product;

public interface ProductRepository extends CrudRepository<product,Long> {

	@Query(value = "SELECT c FROM product c WHERE c.P_Name LIKE '%' || :keyword || '%'"
			+ " OR c.ProductDetail LIKE '%' || :keyword || '%'"
			+ " OR c.P_Category LIKE '%' || :keyword || '%'" )
	public List<product> search(@Param("keyword") String keyword);
			
}
