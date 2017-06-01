<%-- 
    Document   : main-content
    Created on : Jun 2, 2016, 7:53:51 PM
    Author     : BLAMAN
--%>
<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page import="entity.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
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
        <div class="col-sm-9 padding-right">
            <div class="features_items"><!--features_items-->
                <h2 class="title text-center">Product Items</h2>
                <%
                    ProductModel model = new ProductModel();
                    List<Product> list;
                    Object obj = request.getParameter("CatalogID");
                    if(obj != null)
                    {
                        list = model.getAllProductByCatalogID(Integer.parseInt(obj.toString()));
                    }
                    else
                    {
                        list = model.getAllProducts();
                    }
                    for(Product product : list)
                    {
                %>
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/product1.jpg" alt="" />
                                        <h2><%=product.getCostMoney()%></h2>
                                        <p><%=product.getName()%></p>
                                        <a href="pages/product-detail.jsp?ProductID=<%=product.getProId()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2><%=product.getCostMoney()%></h2>
                                            <p><%=product.getName()%></p>
                                            <a href="pages/product-detail.jsp?ProductID=<%=product.getProId()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                        <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                <%
                    }
                %>
            </div><!--features_items-->

            <div class="category-tab"><!--category-tab-->
                <div class="col-sm-12">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tshirt" data-toggle="tab">T-Shirt</a></li>
                        <li><a href="#blazers" data-toggle="tab">Blazers</a></li>
                        <li><a href="#sunglass" data-toggle="tab">Sunglass</a></li>
                        <li><a href="#kids" data-toggle="tab">Kids</a></li>
                        <li><a href="#poloshirt" data-toggle="tab">Polo shirt</a></li>
                    </ul>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="tshirt" >
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery1.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery2.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery3.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery4.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="blazers" >
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery4.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery3.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery2.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery1.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="sunglass" >
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery3.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery4.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery1.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery2.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="kids" >
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery1.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery2.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery3.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery4.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="poloshirt" >
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery2.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery4.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery3.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="<%= request.getContextPath() %>/images/home/gallery1.jpg" alt="" />
                                        <h2>$56</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/category-tab-->

            <div class="recommended_items"><!--recommended_items-->
                <h2 class="title text-center">recommended items</h2>

                <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="item active">	
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="<%= request.getContextPath() %>/images/home/recommend1.jpg" alt="" />
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="<%= request.getContextPath() %>/images/home/recommend2.jpg" alt="" />
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="<%= request.getContextPath() %>/images/home/recommend3.jpg" alt="" />
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">	
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="<%= request.getContextPath() %>/images/home/recommend1.jpg" alt="" />
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="<%= request.getContextPath() %>/images/home/recommend2.jpg" alt="" />
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="<%= request.getContextPath() %>/images/home/recommend3.jpg" alt="" />
                                            <h2>$56</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>			
                </div>
            </div><!--/recommended_items-->

        </div>
    </body>
</html>
