package com.lithan;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lithan.entity.product;
import com.lithan.entity.productshoppingcart;
import com.lithan.entity.shoppingcart;
import com.lithan.entity.user;

@Controller
public class BoutiqaController {

    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;

    @Autowired
    private ShoppingCartService shoppingCartService;

    @Autowired
    private ProductShoppingCartService productShoppingCartService;

    private user loggedUser = null;

    @GetMapping("/")
    public ModelAndView landing() {
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("loggedUser", this.loggedUser);
        mv.addObject("loggedUserId", getLoggedUserId());
        mv.addObject("loggedUserText", getLoggedUserName());
        mv.addObject("cartCount", getCartItemCount());
        mv.addObject("cartSum", getCartItemSum());
        return mv;
    }

    @GetMapping("/home")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("loggedUser", this.loggedUser);
        mv.addObject("loggedUserId", getLoggedUserId());
        mv.addObject("loggedUserText", getLoggedUserName());
        mv.addObject("cartCount", getCartItemCount());
        mv.addObject("cartSum", getCartItemSum());
        return mv;
    }

    @GetMapping("/forgetPassword")
    public ModelAndView forgetPassword() {
        ModelAndView mv = new ModelAndView("forgetPassword");
        return mv;
    }

    @RequestMapping(value = "/forgetPassword", method = RequestMethod.POST)
    public ModelAndView forgetPassword(@ModelAttribute("user") user user) {
        String errorMessage = "";
        String successMessage = "";
        List < user > emailAddressList = userService.searchEmailAddress(user.getEmailAddress());
        if (emailAddressList.size() == 0) {
            errorMessage = "Your Email Address is Not Registered";

        } else {
            successMessage = "Successfully Reset the password";
        }
        ModelAndView mav = new ModelAndView("forgetPassword");
        mav.addObject("errorMessage", errorMessage);
        mav.addObject("successMessage", successMessage);
        return mav;
    }

    @GetMapping("/products")
    public ModelAndView products() {
        ModelAndView mv = new ModelAndView("productList");
        List < product > listProducts = productService.listAll();
        mv.addObject("allProducts", listProducts);
        mv.addObject("loggedUser", this.loggedUser);
        mv.addObject("loggedUserId", getLoggedUserId());
        mv.addObject("loggedUserText", getLoggedUserName());
        mv.addObject("cartCount", getCartItemCount());
        mv.addObject("cartSum", getCartItemSum());
        return mv;
    }

    @GetMapping("/editProduct")
    public ModelAndView editProduct(@RequestParam long id) {
        ModelAndView mav = new ModelAndView("editProduct");
        product product = productService.get(id);
        mav.addObject("product", product);
        mav.addObject("loggedUser", this.loggedUser);
        mav.addObject("loggedUserId", getLoggedUserId());
        mav.addObject("loggedUserText", getLoggedUserName());
        mav.addObject("cartCount", getCartItemCount());
        mav.addObject("cartSum", getCartItemSum());
        return mav;
    }
    
    @GetMapping("/viewProduct")
    public ModelAndView viewProduct(@RequestParam long id) {
        ModelAndView mav = new ModelAndView("viewProduct");
        product product = productService.get(id);
        mav.addObject("product", product);
        mav.addObject("loggedUser", this.loggedUser);
        mav.addObject("loggedUserId", getLoggedUserId());
        mav.addObject("loggedUserText", getLoggedUserName());
        mav.addObject("cartCount", getCartItemCount());
        mav.addObject("cartSum", getCartItemSum());
        return mav;
    }

    @RequestMapping("/deleteProduct")
    public ModelAndView deleteStoreForm(@RequestParam long id) {
        productService.delete(id);
        ModelAndView mv = new ModelAndView("productList");
        List < product > listProducts = productService.listAll();
        mv.addObject("allProducts", listProducts);
        mv.addObject("loggedUser", this.loggedUser);
        mv.addObject("loggedUserId", getLoggedUserId());
        mv.addObject("loggedUserText", getLoggedUserName());
        mv.addObject("cartCount", getCartItemCount());
        mv.addObject("cartSum", getCartItemSum());
        return mv;
    }

    @RequestMapping(value = "/editProduct", method = RequestMethod.POST)
    public ModelAndView editProduct(@ModelAttribute("product") product product) {
        product.setUser(productService.get(product.getProductID()).getUser());
        productService.save(product);
        ModelAndView mav = new ModelAndView("productList");
        List < product > listProducts = productService.listAll();
        mav.addObject("allProducts", listProducts);
        mav.addObject("loggedUser", this.loggedUser);
        mav.addObject("loggedUserId", getLoggedUserId());
        mav.addObject("loggedUserText", getLoggedUserName());
        mav.addObject("cartCount", getCartItemCount());
        mav.addObject("cartSum", getCartItemSum());
        return mav;
    }

    @GetMapping("/createProduct")
    public ModelAndView createProduct() {
        if (this.loggedUser != null && this.loggedUser.getUser_Type().equals("Seller")) {
            ModelAndView mv = new ModelAndView("createProduct");
            mv.addObject("loggedUser", this.loggedUser);
            mv.addObject("loggedUserId", getLoggedUserId());
            mv.addObject("loggedUserText", getLoggedUserName());
            mv.addObject("cartCount", getCartItemCount());
            mv.addObject("cartSum", getCartItemSum());
            return mv;
        } else {
            ModelAndView mv = new ModelAndView("unauthorizationError");
            mv.addObject("loggedUser", this.loggedUser);
            mv.addObject("loggedUserId", getLoggedUserId());
            mv.addObject("loggedUserText", getLoggedUserName());
            mv.addObject("cartSum", getCartItemSum());
            mv.addObject("cartSum", getCartItemSum());
            return mv;
        }

    }

    @RequestMapping(value = "/createProduct", method = RequestMethod.POST)
    public ModelAndView createProduct(@ModelAttribute("product") product product) {

        List < product > listProduct = productService.listAll();
        product.setProductID(listProduct.size() + 1);
        product.setUser(this.loggedUser);
        productService.save(product);
        ModelAndView mav = new ModelAndView("productList");
        List < product > listProductUpdated = productService.listAll();
        mav.addObject("allProducts", listProductUpdated);
        mav.addObject("loggedUser", this.loggedUser);
        mav.addObject("loggedUserId", getLoggedUserId());
        mav.addObject("loggedUserText", getLoggedUserName());
        mav.addObject("cartCount", getCartItemCount());
        mav.addObject("cartSum", getCartItemSum());
        return mav;
    }

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam String keyword) {
        List < product > result = productService.search(keyword);
        ModelAndView mav = new ModelAndView("productList");
        mav.addObject("allProducts", result);
        mav.addObject("loggedUser", this.loggedUser);
        mav.addObject("loggedUserId", getLoggedUserId());
        mav.addObject("loggedUserText", getLoggedUserName());
        mav.addObject("cartCount", getCartItemCount());
        mav.addObject("cartSum", getCartItemSum());
        return mav;
    }


    @RequestMapping("/registeredList")
    public ModelAndView registeredList() {
        List < user > listUsers = userService.listAll();
        ModelAndView mav = new ModelAndView("registeredList");
        mav.addObject("allUsers", listUsers);
        mav.addObject("loggedUser", this.loggedUser);
        mav.addObject("loggedUserId", getLoggedUserId());
        mav.addObject("loggedUserText", getLoggedUserName());
        mav.addObject("cartCount", getCartItemCount());
        mav.addObject("cartSum", getCartItemSum());
        return mav;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView saveStore(@ModelAttribute("user") user user) {

        List < user > listUser = userService.listAll();
        user.setUser_ID(listUser.size() + 1);
        if (user.getUser_Type().equals("Seller")) {
            user.setLastName("");
        }
        userService.save(user);
        ModelAndView mav = new ModelAndView("thankYou");
        mav.addObject("createdUser", user);
        mav.addObject("loggedUser", this.loggedUser);
        mav.addObject("loggedUserId", getLoggedUserId());
        mav.addObject("loggedUserText", getLoggedUserName());
        mav.addObject("cartCount", getCartItemCount());
        mav.addObject("cartSum", getCartItemSum());
        return mav;
    }

    @RequestMapping("/viewProfile")
    public ModelAndView viewProfile(@RequestParam long id) {
        ModelAndView mav = new ModelAndView("viewProfile");
        user usr = userService.get(id);
        mav.addObject("user", usr);
        mav.addObject("loggedUser", this.loggedUser);
        mav.addObject("loggedUserId", getLoggedUserId());
        mav.addObject("loggedUserText", getLoggedUserName());
        mav.addObject("cartCount", getCartItemCount());
        mav.addObject("cartSum", getCartItemSum());
        return mav;
    }

    @RequestMapping("/updateProfile")
    public ModelAndView updateProfile(@RequestParam long id) {
        ModelAndView mav = new ModelAndView("updateProfile");
        user usr = userService.get(id);
        mav.addObject("user", usr);

        mav.addObject("loggedUser", this.loggedUser);
        mav.addObject("loggedUserId", getLoggedUserId());
        mav.addObject("loggedUserText", getLoggedUserName());
        mav.addObject("cartCount", getCartItemCount());
        mav.addObject("cartSum", getCartItemSum());
        return mav;
    }

    @RequestMapping("/deleteProfile")
    public ModelAndView deleteProfile(@RequestParam long id) {

        userService.delete(id);
        ModelAndView mav = new ModelAndView("registeredList");
        return registeredList();
    }

    @RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
    public ModelAndView updateProfile(@ModelAttribute("user") user user) {

        List < user > listUser = userService.listAll();
        if (user.getUser_Type().equals("Seller")) {
            user.setLastName("");
        }
        userService.save(user);
        ModelAndView mav = new ModelAndView("index");
        this.loggedUser = user;
        mav.addObject("loggedUser", this.loggedUser);
        mav.addObject("loggedUserId", getLoggedUserId());
        mav.addObject("loggedUserText", getLoggedUserName());
        mav.addObject("cartCount", getCartItemCount());
        mav.addObject("cartSum", getCartItemSum());
        return mav;
    }

    @GetMapping("/register")
    public ModelAndView register() {
        ModelAndView mv = new ModelAndView("registration");
        mv.addObject("loggedUser", this.loggedUser);
        mv.addObject("loggedUserId", getLoggedUserId());
        mv.addObject("loggedUserText", getLoggedUserName());
        mv.addObject("cartCount", getCartItemCount());
        mv.addObject("cartSum", getCartItemSum());
        return mv;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView loginPost(@ModelAttribute("user") user user) {
        ModelAndView mav;
        String errorMessage = "";
        String successMessage = "";
        List < user > emailAddressList = userService.searchEmailAddress(user.getEmailAddress());
        if (emailAddressList.size() == 0) {
            mav = new ModelAndView("login");
            errorMessage = "Your Email Address is Not Registered";

        } else {

            if (emailAddressList.get(0).getPassword().equals(user.getPassword())) {
                mav = new ModelAndView("viewProfile");
                mav.addObject("id", user.getUser_Id());
                mav.addObject("user", emailAddressList.get(0));
                this.loggedUser = emailAddressList.get(0);
                mav.addObject("loggedUser", this.loggedUser);
                mav.addObject("loggedUserId", getLoggedUserId());
                mav.addObject("loggedUserText", "Hi " + this.loggedUser.getfirstName() + " " + this.loggedUser.getLastName());
                successMessage = "Login Success";

                if (emailAddressList.get(0).getUser_Type().equals("Admin")) {
                    return registeredList();
                }
            } else {
                mav = new ModelAndView("login");
                errorMessage = "Your Email Address is doesn't match with the password";
            }
        }

        mav.addObject("cartCount", getCartItemCount());
        mav.addObject("cartSum", getCartItemSum());
        mav.addObject("errorMessage", errorMessage);
        mav.addObject("successMessage", successMessage);
        return mav;
    }

    @GetMapping("/login")
    public ModelAndView login() {
        ModelAndView mv = new ModelAndView("login");
        return mv;
    }

    @RequestMapping("/searchUser")
    public ModelAndView searchUser(@RequestParam String keyword) {
        List < user > result = userService.search(keyword);
        ModelAndView mav = new ModelAndView("registeredList");
        mav.addObject("allUsers", result);
        mav.addObject("loggedUser", this.loggedUser);
        mav.addObject("loggedUserId", getLoggedUserId());
        mav.addObject("loggedUserText", getLoggedUserName());
        mav.addObject("cartCount", getCartItemCount());
        mav.addObject("cartSum", getCartItemSum());
        return mav;
    }

    @GetMapping("/logout")
    public ModelAndView logout() {
        this.loggedUser = null;
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("loggedUser", this.loggedUser);
        mv.addObject("loggedUserText", getLoggedUserName());
        mv.addObject("loggedUserId", getLoggedUserId());
        mv.addObject("cartCount", getCartItemCount());
        mv.addObject("cartSum", getCartItemSum());
        return mv;
    }

    @GetMapping("/shoppingCart")
    public ModelAndView shoppingCart() {

        if (this.loggedUser == null) {
            return products();
        }

        List < productshoppingcart > listUsers1 = productShoppingCartService.listAll();
        List < shoppingcart > allcarts = shoppingCartService.listAll();
        List < shoppingcart > allfiltedcarts = new ArrayList < shoppingcart > ();
        List < productshoppingcart > filteredproductshoppingcart = new ArrayList < productshoppingcart > ();
        for (shoppingcart sCart: allcarts) {
            if (sCart.getUser().getUser_Id() == this.loggedUser.getUser_Id() && sCart.getStatus().equals("Draft")) {
                allfiltedcarts.add(sCart);
            }
        }


        if (allfiltedcarts.size() == 0) {
            shoppingcart newCart = new shoppingcart();
            newCart.setStatus("Draft");
            newCart.setTotalPrice(0);
            newCart.setUser(this.loggedUser);

            Calendar today = Calendar.getInstance();
            today.set(Calendar.HOUR_OF_DAY, 0);

            newCart.setCheckOutDate(today.getTime());
            newCart.setShoppingCart_ID(allcarts.size() + 1);
            shoppingCartService.save(newCart);
        } else {
            for (productshoppingcart sCart: listUsers1) {
                if (sCart.getShoppingCart_ID() == allfiltedcarts.get(0).getShoppingCart_ID()) {
                    filteredproductshoppingcart.add(sCart);
                }
            }
        }
        if (filteredproductshoppingcart.size() > 0) {
            ModelAndView mv = new ModelAndView("shoppingCart");
            mv.addObject("allUsers1", filteredproductshoppingcart);

            float totalPrice = 0;

            for (productshoppingcart cartitem: filteredproductshoppingcart) {
                totalPrice = totalPrice + cartitem.getItemTotalPrice();
            }
            mv.addObject("totalPrice", totalPrice);
            mv.addObject("shoppingVartId", allfiltedcarts.get(0).getShoppingCart_ID());
            mv.addObject("shoppingCartStatus", allfiltedcarts.get(0).getStatus());


            mv.addObject("loggedUser", this.loggedUser);
            mv.addObject("loggedUserText", getLoggedUserName());
            mv.addObject("loggedUserId", getLoggedUserId());
            mv.addObject("cartCount", getCartItemCount());
            mv.addObject("cartSum", getCartItemSum());

            shoppingcart updatedCart = allfiltedcarts.get(0);
            updatedCart.setTotalPrice(totalPrice);
            shoppingCartService.save(updatedCart);
            return mv;
        }
        return products();


    }

    @GetMapping("/addToShoppingCart")
    public ModelAndView addToShoppingCart(@RequestParam long id) {

        ModelAndView mv = new ModelAndView("shoppingCart");
        product addedProduct = productService.get(id);
        productshoppingcart pshoppingCart = new productshoppingcart();
        pshoppingCart.setProduct(addedProduct);
        pshoppingCart.setItemTotalPrice(addedProduct.getP_Price());

        List < shoppingcart > allcarts = shoppingCartService.listAll();
        int shoppingCartId = 1;
        boolean isShoppingCartExising = false;
        for (shoppingcart sCart: allcarts) {
            if (sCart.getUser().getUser_Id() == this.loggedUser.getUser_Id() && sCart.getStatus().equals("Draft")) {
                shoppingCartId = (int) sCart.getShoppingCart_ID();
                isShoppingCartExising = true;
            }
        }

        if (isShoppingCartExising == false) {
            shoppingcart newCart = new shoppingcart();
            newCart.setStatus("Draft");
            newCart.setTotalPrice(0);
            newCart.setUser(this.loggedUser);

            Calendar today = Calendar.getInstance();
            today.set(Calendar.HOUR_OF_DAY, 0);

            newCart.setCheckOutDate(today.getTime());
            newCart.setShoppingCart_ID(allcarts.size() + 1);
            shoppingCartService.save(newCart);

            List < shoppingcart > allcartsupdated = shoppingCartService.listAll();
            for (shoppingcart sCart: allcartsupdated) {
                if (sCart.getUser().getUser_Id() == this.loggedUser.getUser_Id()) {
                    shoppingCartId = (int) sCart.getShoppingCart_ID();
                    isShoppingCartExising = true;
                }
            }

        }

        pshoppingCart.setShoppingCart_ID(shoppingCartId);
        pshoppingCart.setQuantity(1);

        productShoppingCartService.save(pshoppingCart);

        return shoppingCart();

    }

    @GetMapping("/increateQunatity")
    public ModelAndView increateQunatity(@RequestParam long id) {

        ModelAndView mv = new ModelAndView("shoppingCart");
        productshoppingcart addedProductCart = productShoppingCartService.get(id);
        int qunatity = addedProductCart.getQuantity();
        addedProductCart.setQuantity(qunatity + 1);
        product product = productService.get(addedProductCart.getProduct().getProductID());
        addedProductCart.setItemTotalPrice(product.getP_Price() * (qunatity + 1));
        productShoppingCartService.save(addedProductCart);

        return shoppingCart();
    }

    @GetMapping("/descreaseQunatity")
    public ModelAndView descreaseQunatity(@RequestParam long id) {

        ModelAndView mv = new ModelAndView("shoppingCart");
        productshoppingcart addedProductCart = productShoppingCartService.get(id);
        int qunatity = addedProductCart.getQuantity();
        addedProductCart.setQuantity(qunatity - 1);
        product product = productService.get(addedProductCart.getProduct().getProductID());
        addedProductCart.setItemTotalPrice(product.getP_Price() * (qunatity - 1));
        productShoppingCartService.save(addedProductCart);

        List < productshoppingcart > listUsers1 = productShoppingCartService.listAll();
        List < shoppingcart > listUsers2 = shoppingCartService.listAll();
        mv.addObject("allUsers1", listUsers1);

        return shoppingCart();
    }

    @GetMapping("/deleteCartItem")
    public ModelAndView deleteCartItem(@RequestParam long id) {

        ModelAndView mv = new ModelAndView("shoppingCart");
        productShoppingCartService.delete(id);

        return shoppingCart();
    }

    @GetMapping("/checkout")
    public ModelAndView checkout(@RequestParam long id) {


        shoppingcart checkout = shoppingCartService.get(id);
        checkout.setStatus("Shipped");
        shoppingCartService.save(checkout);


        List < productshoppingcart > listUsers1 = productShoppingCartService.listAll();
        List < shoppingcart > allcarts = shoppingCartService.listAll();

        List < productshoppingcart > filteredproductshoppingcart = new ArrayList < productshoppingcart > ();


        for (productshoppingcart sCart: listUsers1) {
            if (sCart.getShoppingCart_ID() == checkout.getShoppingCart_ID()) {
                filteredproductshoppingcart.add(sCart);
            }
        }

        if (filteredproductshoppingcart.size() > 0) {
            ModelAndView mv = new ModelAndView("shoppingCart");
            mv.addObject("allUsers1", filteredproductshoppingcart);

            float totalPrice = 0;

            for (productshoppingcart cartitem: filteredproductshoppingcart) {
                totalPrice = totalPrice + cartitem.getItemTotalPrice();
            }
            mv.addObject("totalPrice", totalPrice);
            mv.addObject("shoppingVartId", checkout.getShoppingCart_ID());
            mv.addObject("shoppingCartStatus", checkout.getStatus());
            mv.addObject("cartCount", getCartItemCount());
            mv.addObject("cartSum", getCartItemSum());

            mv.addObject("loggedUser", this.loggedUser);
            mv.addObject("loggedUserText", getLoggedUserName());
            mv.addObject("loggedUserId", getLoggedUserId());

            return mv;
        }

        return shoppingCart();

    }

    private String getLoggedUserName() {
        String userName = "";
        if (this.loggedUser != null) {
            userName = "Hi " + this.loggedUser.getfirstName() + " " + this.loggedUser.getLastName();
        } else {
            userName = "Hi Guest User";
        }
        return userName;
    }

    private String getLoggedUserId() {
        String viewName = "";
        if (this.loggedUser != null) {
            viewName = "viewProfile?id=" + this.loggedUser.getUser_Id();
        } else {
            viewName = "home";
        }
        return viewName;

    }

    private int getCartItemCount() {
        int count = 0;

        if (this.loggedUser == null) {
            return count;
        }

        List < shoppingcart > allcarts = shoppingCartService.listAll();
        int shoppingCartId = 0;
        boolean isShoppingCartExising = false;
        shoppingcart sCart_0 = new shoppingcart();
        for (shoppingcart sCart: allcarts) {
            if (sCart.getUser().getUser_Id() == this.loggedUser.getUser_Id() && sCart.getStatus().equals("Draft")) {
                shoppingCartId = (int) sCart.getShoppingCart_ID();
                isShoppingCartExising = true;
                sCart_0 = sCart;
            }
        }

        List < productshoppingcart > cartItems = productShoppingCartService.listAll();

        for (productshoppingcart sCartItem: cartItems) {
            if (isShoppingCartExising && sCartItem.getShoppingCart_ID() == shoppingCartId) {
                count++;
            }
        }

        return count;

    }

    private float getCartItemSum() {
        float sum = (float) 0.00;

        if (this.loggedUser == null) {
            return sum;
        }

        List < shoppingcart > allcarts = shoppingCartService.listAll();
        int shoppingCartId = 0;
        boolean isShoppingCartExising = false;
        shoppingcart sCart_0 = new shoppingcart();
        for (shoppingcart sCart: allcarts) {
            if (sCart.getUser().getUser_Id() == this.loggedUser.getUser_Id() && sCart.getStatus().equals("Draft")) {
                shoppingCartId = (int) sCart.getShoppingCart_ID();
                isShoppingCartExising = true;
                sCart_0 = sCart;
            }
        }

        List < productshoppingcart > cartItems = productShoppingCartService.listAll();

        for (productshoppingcart sCartItem: cartItems) {
            if (isShoppingCartExising && sCartItem.getShoppingCart_ID() == shoppingCartId) {
                sum = sum + sCartItem.getItemTotalPrice();
            }
        }

        return sum;

    }

}