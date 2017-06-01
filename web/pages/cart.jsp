<%-- 
    Document   : index
    Created on : Jun 1, 2016, 9:32:32 PM
    Author     : BLAMAN
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page import="entity.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Home | E-Shopper</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/font-awesome.min.css" rel="stylesheet">
        <link href="../css/prettyPhoto.css" rel="stylesheet">
        <link href="../css/price-range.css" rel="stylesheet">
        <link href="../css/animate.css" rel="stylesheet">
        <link href="../css/main.css" rel="stylesheet">
        <link href="../css/responsive.css" rel="stylesheet"> 
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="../images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="../images/logo/logo.png.png">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                      <li><a href="#">Home</a></li>
                      <li class="active">Shopping Cart</li>
                    </ol>
                </div>
                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Item</td>
                                <td class="description"></td>
                                <td class="price">Price</td>
                                <td class="quantity">Quantity</td>
                                <td class="total">Total</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            Map data = new HashMap();
                            if(session.getAttribute("ProductList") != null) {                                        
                                data = (HashMap)session.getAttribute("ProductList");
                            }
                            Iterator iterator = data.keySet().iterator();                                                            
                            ProductModel model = ProductModel.getInstance();
                            double totalPrice = 0;
                            int totalQuanlity = 0;
                            while(iterator.hasNext()) {                                
                                Integer key = (Integer)iterator.next();
                                Integer value = (Integer)data.get(key);                                                        
                                Product product = new Product();
                                product = model.getProductByID(key);
                                
                                totalPrice      += product.getCost() * value;
                                totalQuanlity   += value;

                        %>
                                <tr>
                                    <td class="cart_product">
                                        <a href=""><img src="<%= request.getContextPath() %>/images/cart/one.png" alt=""></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4><a href=""><%=product.getName()%></a></h4>
                                        <p>Web ID: <%=product.getProId()%></p>
                                    </td>
                                    <td class="cart_price">
                                        <p><%=product.getCostMoney()%></p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <p class="cart_quantity_input"><%=value%></p>
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price"><%=Product.convertToMoney(product.getCost() * value) %></p>
                                    </td>
                                    <td class="cart_delete">
                                        <!--<a class="cart_quantity_delete" href="#"><i class="fa fa-refresh"></i></a>-->                                                                                                                
                                        <form action="removeItem" method="post">
                                                <input type="hidden" value=<%=product.getProId()%> name="ProductID"/>
                                                <button type="submit" class="fa fa-times">
                                        </form>
                                    </td>
                                </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
	</section> <!--/#cart_items-->

	<section id="do_action">
            <div class="container">
                <div class="heading">
                    <h3>What would you like to do next?</h3>
                    <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="chose_area">
                            <ul class="user_option">
                                <li>
                                    <input type="checkbox">
                                    <label>Use Coupon Code</label>
                                </li>
                                <li>
                                    <input type="checkbox">
                                    <label>Use Gift Voucher</label>
                                </li>
                                <li>
                                    <input type="checkbox">
                                    <label>Estimate Shipping & Taxes</label>
                                </li>
                            </ul>
                            <ul class="user_info">
                                <li class="single_field">
                                    <label>Country:</label>
                                    <select>
                                        <option>United States</option>
                                        <option>Bangladesh</option>
                                        <option>UK</option>
                                        <option>India</option>
                                        <option>Pakistan</option>
                                        <option>Ucrane</option>
                                        <option>Canada</option>
                                        <option>Dubai</option>
                                    </select>

                                </li>
                                <li class="single_field">
                                    <label>Region / State:</label>
                                    <select>
                                        <option>Select</option>
                                        <option>Dhaka</option>
                                        <option>London</option>
                                        <option>Dillih</option>
                                        <option>Lahore</option>
                                        <option>Alaska</option>
                                        <option>Canada</option>
                                        <option>Dubai</option>
                                    </select>
                                </li>
                                <li class="single_field zip-field">
                                    <label>Zip Code:</label>
                                    <input type="text">
                                </li>
                            </ul>
                            <a class="btn btn-default update" href="">Get Quotes</a>
                            <a class="btn btn-default check_out" href="">Continue</a>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="total_area">
                            <ul>
                                <li>Cart Sub Total <span><%=Product.convertToMoney(totalPrice)%></span></li>
                                <li>Eco Tax <span>Free</span></li>
                                <li>Shipping Cost <span>Free</span></li>
                                <li>Total <span><%=Product.convertToMoney(totalPrice)%></span></li>
                            </ul>
                            <form action="" method="post" id="updateForm">
                            </form>
                            <form action="checkout" method="post" id="checkoutForm">
                                <input type="hidden" name="TotalPrice" value=<%=totalPrice%> />
                                <input type="hidden" name="TotalQuantity" value=<%=totalQuanlity%> />
                            </form>
                                <!--<a class="btn btn-default update" href="">Update</a>-->
                                <!--<a class="btn btn-default check_out" href="checkout" >Check out</a>-->
                                <button type="submit" class="btn btn-default update" form="updateForm">Update</button>
                                <button type="submit" class="btn btn-default check_out" form="checkoutForm">Check out</button>
                        </div>
                    </div>
                </div>
            </div>
	</section><!--/#do_action-->
        <jsp:include page="footer.jsp"/> //footer     
    </body>
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.scrollUp.min.js"></script>
    <script src="../js/price-range.js"></script>
    <script src="../js/jquery.prettyPhoto.js"></script>
    <script src="../js/main.js"></script>
</html>
