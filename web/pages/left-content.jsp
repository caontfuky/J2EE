<%-- 
    Document   : left-content
    Created on : Jun 2, 2016, 7:53:38 PM
    Author     : BLAMAN
--%>

<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page import="entity.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="col-sm-3">
            <div class="left-sidebar">
                <h2>Category</h2>
                <div class="panel-group category-products" id="accordian"><!--category-productsr-->                    
                    <%
                        CataLogModel model = new CataLogModel();
                        List<Catalog> listParent = model.getAllCatalogParent();
                        for(Catalog parent : listParent)
                        {
                            %>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordian" href="#<%=parent.getName()%>">
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            <%=parent.getName()%>
                                        </a>
                                    </h4>
                                </div>
                                <div id="<%=parent.getName()%>" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                            <%
                            List<Catalog> listChildren = model.getAllCatalogByParentID(String.valueOf(parent.getCatalogID()));
                            for(Catalog child : listChildren)
                            {
                                %>
                                <li><a href="<%= request.getContextPath() %>/index.jsp?CatalogID=<%=String.valueOf(child.getCatalogID())%>"><%=child.getName()%> </a></li>
                                <%
                            }
                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <%
                        }
                    %>
                </div><!--/category-products-->

                <div class="brands_products"><!--brands_products-->
                    <h2>Brands</h2>
                    <div class="brands-name">
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="#"> <span class="pull-right">(50)</span>Acne</a></li>
                            <li><a href="#"> <span class="pull-right">(56)</span>Grüne Erde</a></li>
                            <li><a href="#"> <span class="pull-right">(27)</span>Albiro</a></li>
                            <li><a href="#"> <span class="pull-right">(32)</span>Ronhill</a></li>
                            <li><a href="#"> <span class="pull-right">(5)</span>Oddmolly</a></li>
                            <li><a href="#"> <span class="pull-right">(9)</span>Boudestijn</a></li>
                            <li><a href="#"> <span class="pull-right">(4)</span>Rösch creative culture</a></li>
                        </ul>
                    </div>
                </div><!--/brands_products-->

                <div class="price-range"><!--price-range-->
                    <h2>Price Range</h2>
                    <div class="well text-center">
                        <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
                        <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
                    </div>
                </div><!--/price-range-->

                <div class="shipping text-center"><!--shipping-->
                    <img src="<%= request.getContextPath() %>/images/home/shipping.jpg" alt="" />
                </div><!--/shipping-->

            </div>
        </div>
    </body>
</html>
