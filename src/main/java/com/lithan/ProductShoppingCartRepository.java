package com.lithan;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.lithan.entity.productshoppingcart;
import com.lithan.entity.user;

public interface ProductShoppingCartRepository extends CrudRepository < productshoppingcart, Long > {

    @Query(value = "SELECT c FROM user c WHERE c.FirstName LIKE '%' || :keyword || '%'" +
        " OR c.LastName LIKE '%' || :keyword || '%'")
    public List < productshoppingcart > search(@Param("keyword") String keyword);

}