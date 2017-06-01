<%-- 
    Document   : admin
    Created on : Jun 4, 2016, 9:34:13 AM
    Author     : BLAMAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Product" %>
<%@page import="model.*" %>
<%@taglib prefix="s" uri="/struts-tags"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>JSP Page</title>
      



    </head>
    <style type="text/css">

        .paging-nav {
            text-align: right;
            padding-top: 2px;
        }

        .paging-nav a {
            margin: auto 1px;
            text-decoration: none;
            display: inline-block;
            padding: 1px 7px;
            background: #91b9e6;
            color: white;
            border-radius: 3px;
        }

        .paging-nav .selected-page {
            background: #187ed5;
            font-weight: bold;
        }

        .paging-nav,


        #button1, #button2,#button3 {
            position: relative;
            color: rgba(255,255,255,1);
            text-decoration: none;
            background-color: rgba(219,87,5,1);
            font-family: 'Yanone Kaffeesatz';
            font-weight: 400;
            font-size: 2em;
            display: block;
            padding: 4px;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
            -webkit-box-shadow: 0px 9px 0px rgba(219,31,5,1), 0px 9px 25px rgba(0,0,0,.7);
            -moz-box-shadow: 0px 9px 0px rgba(219,31,5,1), 0px 9px 25px rgba(0,0,0,.7);
            box-shadow: 0px 9px 0px rgba(219,31,5,1), 0px 9px 25px rgba(0,0,0,.7);
            margin: 100px auto;
            width: 280px;
            text-align: center;

            -webkit-transition: all .1s ease;
            -moz-transition: all .1s ease;
            -ms-transition: all .1s ease;
            -o-transition: all .1s ease;
            transition: all .1s ease;
        }
        .btniput
        {
            border-radius: 10px;
            background: #FF4518;
            height: 50px;
            width: 300px;
            text-align: center;
            text-emphasis: #187ed5;
            color: white;
            font-size: 20px;
            font-style: initial;
            font-weight: bold;

        }

        /*
                a:active {
                    -webkit-box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
                    -moz-box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
                    box-shadow: 0px 3px 0px rgba(219,31,5,1), 0px 3px 6px rgba(0,0,0,.9);
                    position: relative;*/



    </style>      

    <body>
    <center>
        <h1>ADMIN</h1>        
    </center>  
    <hr>
    <center>
        <div>
            <button class="btniput" id="danhmuc" >DANH MỤC</button>
            <button class="btniput" id="sanpham">SẢN PHẨM</button>
            <button class="btniput" id="giohang">GIỎ HÀNG</button>          
            <button class="btniput" id="taikhoan">TÀI KHOẢN</button>
            <button class="btniput" id="ttkhuyenmai">THÔNG TIN KHUYẾN MÃI</button>
            <button class="btniput" id="lienhe">LIÊN HỆ</button>
            <s:form action="/backindex" method="Post"> 
                <button class="btniput" type="submit" style="background: #5BBCEC" id="lienhe">TRANG CHỦ</button>

            </s:form>

        </div>
    </center>
    <hr>
    <center>
        <div style="width: 600px; display: none" id="danhmuctable">

            <h1>Danh mục sản phẩm</h1>
            <table border="1" width="100%" >
                <tr>
                    <th>CateId</th>
                    <th>Name</th>
                    <th>ParentId</th>
                    <th>Action</th>
                </tr>
                <tr>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td style="text-align: center">
                        <input  type="submit" value="Update"/>
                        <input  type="submit" value="Delete"/>
                    </td>

                </tr>



            </table>      



        </div>
    </center>
    <center>
        <div style="width: 1200px;display: none" id="samphamtable">

            <h1>Tất cả sản phẩm</h1><br>
            <s:form action="/addproduct" method="post">
                <input type="submit" id="button3" value="Add New Product" style="width: 300px;height: 40px;text-align: center"/>

            </s:form>


            <table border="1" width="100%">
                <tr id="firstrow">
                    <th style="width: 10%;text-align: center">ProductId</th>
                    <th style="width: 10%;text-align: center" >Name</th>
                    <th style="width: 12%;text-align: center">Marerial</th>
                    <th style="width: 22%">Description</th>
                    <th style="width: 10%;text-align: center">Cost</th>
                    <th style="width: 10%;text-align: center">Remain Quantity</th>
                    <th style="width: 8%;text-align: center" >Brand</th>
                    <th style="width: 8%;text-align: center" >Gender</th>                     
                    <th style="width: 10%;text-align: center">Action</th>
                </tr>
            </table>
            <table border="1" width="100%" id="tableData" id="racetimes" class="table table-bordered table-striped" >


                <%
                    ProductModel promodel = new ProductModel();
                    for (Product p : promodel.getAllProductss()) {


                %>


                <tr class="colunm<%= p.getProId()%>" >
                    <td class="proid<%= p.getProId()%>" style="text-align: center;width: 10%;background: #FF4518 " ><%= p.getProId()%></td>
                    <td style="text-align: center;width: 10% " ><%= p.getName()%></td>
                    <td style="text-align: center;width: 12%" ><%= p.getMaterial()%></td>
                    <td style="width: 22%" ><%= p.getDescription()%> </td>
                    <td style="text-align: center ; width:10% " ><%= p.getCost()%></td>
                    <td style="text-align: center;width: 10%  " ><%= p.getRemainquantity()%></td>
                    <td style="text-align: center;width: 8% " ><%= p.getBrandname()%></td>
                    <td style="text-align: center;width: 8%"  ><%= p.getGendername()%></td>                                   
                    <td style="text-align: center" style="text-align: center;width: 10% "  >
                        <s:form action="/edit" method="post"  >

                            <input type="hidden" value="<%=p.getProId()%>" name="proeditid"  />
                            <input id="button1" type="submit" class="edit<%=p.getProId()%>"  value="Edit" style="width: 100px; margin-top:40px;height: 40px;text-align: center" />

                            <input id="button2" type="button"  class="pro<%=p.getProId()%>"  name="<%=p.getProId()%>" value="Delete" style="width: 100px;height: 40px;text-align: center ; margin-top:10px" />

                        </s:form>
                    </td>

                </tr>

                <%}%>
            </table>      

            <div style="display: none" id="dialog-delete" title="Delete Form">Are you sure want to delete this Product




            </div>
            <div style="display: none; " id="dialog-fail" title="Can not delete"> Cant delete this product        


            </div>



        </div>
    </center>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/paging.js"></script>
    <!--    <script src="../js/jquery-1.12.2.min.js"</script>
        <script src="../js/jquery-1.12.2.js"</script>-->
    <script src="js/jquery-ui.min.js"</script>
    <script src="js/jquery-ajax.js" type="text/javascript"></script>
    <script src="js/jquery-ajax-ui.js" type="text/javascript"></script>
    <link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">

    <script type="text/javascript">
        $(document).ready(function () {
            $('#tableData').paging({limit: 3});


            {
                $("#danhmuc").click(function ()


                {
                    $("#danhmuctable").css({"display": "block"});
                    $("#samphamtable").css({"display": "none"});
                }

                );
                $("#sanpham").click(function ()


                {
                    $("#danhmuctable").css({"display": "none"});
                    $("#samphamtable").css({"display": "block"});
                }

                );

                var arr = new Array(100);
                $.each(arr, function (index)
                {
                    $(".pro" + index).click(function ()
                    {

                        $("#dialog-delete").dialog({
                            autoOpen: false,
                            hide: "puff",
                            show: "slide",
                            height: 200,
                            buttons: {
                                OK: function () {

                                    $.ajax(
                                            {
                                                type: 'POST',
                                                url: "delete.action",
                                                data:
                                                        {
                                                            proid: index
                                                        },
                                                success: function (data, textStatus, jqXHR) {
                                                    $("#dialog-delete").dialog("close");
                                                    $(".colunm" + index).css("display", "none");
                                                },
                                                error: function (jqXHR, textStatus, errorThrown) {
                                                    $("#dialog-delete").dialog("close");

                                                    $("#dialog-fail").dialog({
                                                        autoOpen: false,
                                                        hide: "puff",
                                                        show: "slide",
                                                        height: 200,
                                                        buttons: {
                                                            OK: function () {

                                                                $(this).dialog("close");


                                                            }


                                                        }

                                                    });
                                                    $("#dialog-fail").dialog("open");


                                                }
                                            }

                                    );



                                },
                                Cancel: function ()
                                {
                                    $(this).dialog("close");
                                }


                            }

                        });
                        $("#dialog-delete").dialog("open");
                    });


                });

                $("#button3").click(function () {





                });



            }










        });
    </script>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36251023-1']);
        _gaq.push(['_setDomainName', 'jqueryscript.net']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' === document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();

    </script>





</body>
</html>
