package com.lithan.Test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.springframework.web.servlet.ModelAndView;

import com.lithan.BoutiqaController;

public class BoutiqaTest {
	
	@Test
	public void test1() {
		BoutiqaController controller = new BoutiqaController();
		ModelAndView mv = controller.landing();
		assertEquals("index", mv.getViewName());
	}
	
	@Test
	public void test2() {
		BoutiqaController controller = new BoutiqaController();
		ModelAndView mv = controller.forgetPassword();
		assertEquals("forgetPassword", mv.getViewName());
	}
	
	@Test
	public void test3() {
		BoutiqaController controller = new BoutiqaController();
		ModelAndView mv = controller.logout();
		assertEquals("index", mv.getViewName());
	}

}
