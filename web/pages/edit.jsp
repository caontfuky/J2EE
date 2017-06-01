<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="css/admin.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <h1 style="text-align: center">EDIT PAGES</h1>
        <hr>

    <center>
        <table>
            <s:form id="editform">
                <tr>
                    <td>
                        Product Id :      
                    </td>
                    <td>
                        <input id="productid" name="productid" type="text" readonly="true" disabled="true" value="${product.proId}" style="width: 200px"  />
                    </td> 

                </tr>
                <tr>
                    <td>
                        Name:
                    </td>
                    <td>
                        <input id="productname" name="ProductEdit.name" type="text" value="${product.name}" style="width: 200px" />
                    </td> 

                </tr>
                <tr>
                    <td>
                        Material
                    </td> 
                    <td>
                        <input id="material" name="material" type="text" value="${product.material}" style="width: 200px" />
                    </td> 

                </tr>
                <tr>
                    <td>
                        Description
                    </td>
                    <td>
                        <textarea id="description" name="description" style="width: 200px" >${product.description}   </textarea>

                    </td> 

                </tr>
                <tr>
                    <td>
                        Cost
                    </td> 
                    <td>
                        <input id="cost" name="cost" type="text" value="${product.cost}" style="width: 200px" />
                    </td> 

                </tr>
                <tr>
                    <td>
                        Remain Quantity: 
                    </td> 
                    <td>
                        <input value="${product.remainquantity}" type="number" min="1" max="100" id="remainquantity" name="remainquantity" style="width: 200px"  />
                    </td> 

                </tr>
                <tr>
                    <td>
                        Brand
                    </td> 
                    <td>

                        <input type="text" min="1" max="100" id="brand" name="brand" value="${brandname}" style="width: 200px" readonly="true"  />
                    </td> 

                </tr>
                <tr>
                    <td>
                        Gender
                    </td> 
                    <td>
                        <div style="text-align: center">
                            <input type="radio" name="gender" value="Nam" checked="true"> Male<br>
                            <input type="radio" name="gender" value="Nữ"> Female<br>
                            <input type="radio" name="gender" value="Khác"> Other
                        </div>

                    </td> 

                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">

                        <input class="btniput" type="button" value="Update" id="update" />
                        <input class="btniput" type="reset"value="Reset" />
                        <input id="back" type="button" class="btniput" value="Back" />                      

                    </td>


                </tr>



            </s:form>


        </table>
    </center>



    <script src="js/jquery-ajax.js" type="text/javascript"></script>
    <script src="js/jquery-ajax-ui.js" type="text/javascript"></script>
    <link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
    <script type="text/javascript">

        $(document).ready(function ()
        {
            $("#update").click(function ()
            {
                $("#dialog-updateconfirm").dialog({
                    autoOpen: false,
                    hide: "puff",
                    show: "slide",
                    height: 200,
                    buttons: {
                        OK: function () {

                            $("#dialog-updateconfirm").dialog("close");
                            $.ajax(
                                    {
                                        url: "update.action",
                                        type: "get",
                                        data: {
                                            proeitname: $("#productname").val(),
                                            proeditid: $("#productid").val(),
                                            proeditmaterial: $("#material").val(),
                                            proeditdes: $("#description").val(),
                                            proeditcost: $("#cost").val(),
                                            proeditremainquantity: $("#remainquantity").val(),
                                            proedtbrand: $("#brand").val(),
                                            proeditgender: $('input[name=gender]:checked').val()

                                        },
                                        success: function (data, textStatus, jqXHR) {
                                            $("#dialog-successconfirm").dialog({
                                                autoOpen: false,
                                                hide: "puff",
                                                show: "slide",
                                                height: 200,
                                                buttons: {
                                                    OK: function ()
                                                    {
                                                        $("#dialog-successconfirm").dialog("close");
                                                    }
                                                }
                                            });
                                            $("#dialog-successconfirm").dialog("open");

                                        },
                                        error: function (jqXHR, textStatus, errorThrown) {
                                            $("#dialog-failconfirm").dialog({
                                                autoOpen: false,
                                                hide: "puff",
                                                show: "slide",
                                                height: 200,
                                                buttons: {
                                                    OK: function ()
                                                    {
                                                        $("#dialog-failconfirm").dialog("close");
                                                    }


                                                }
                                            });
                                            $("#dialog-failconfirm").dialog("open");



                                        }
                                    }

                            );


                        }
                    }


                });
                $("#dialog-updateconfirm").dialog("open");
            }

            );

            $("#back").click(function () {

                window.location.href="backadmin";
                

            });

        }
        );

    </script>
    <div style="display: none" id="dialog-updateconfirm" title="Confirm Form">Are you sure want to Update this Product</div>
    <div style="display: none" id="dialog-successconfirm" title="Confirm Form">Success</div>
    <div style="display: none" id="dialog-failconfirm" title="Confirm Form">Fail</div>
</body>
</html>
