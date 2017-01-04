<%--
  Created by IntelliJ IDEA.
  User: james.jiang
  Date: 2017/1/3
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //Custom Theme files -->
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
    <!-- js -->
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
    <!-- //js -->
    <!-- cart -->
    <script src="js/simpleCart.min.js"> </script>
    <!-- cart -->
    <script type="text/javascript" src="js/jsAddress.js"></script>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        function initOption() {
            var ageOption= document.getElementById("ageOption");
            var arr=new Array(130);
            for (var i=0;i<130;i++){
                var s=arr[i]=i+1;
                ageOption.options.add(new Option(s,s));
            }
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var flag=new Array(7);
            for (var i=0;i<7;i++){
                flag[i]=new Boolean(false);
            }
            $(".nickName").blur(function () {
                var length = $(this).val().length;
                var str = "Name （昵称 ：）";
                if (length <= 8 && length > 0) {
                    $(this).prev().append().html(str + '<label style="color:green">√</label>');
                    flag[0]=true;
                } else {
                    $(this).prev().append().html(str + '<label style="color: red">昵称长度过长</label>');
                    flag[0]=false;
                }
            });

            $(".accoutNumber").blur(function () {
                var str=$(this).val();
                var str2="account number （账号 ：）";
                if((/^[0-9]{6,16}$/.test(str))){
                    $.ajax({
                        url:'checkAccout.do',
                        type:'post',
                        async:true,
                        dataType: "text",
                        data:{name:str,val:str2},
                        timeout:5000,
                        success:function (data) {
                            if(data=="true"){
                                $(".accoutNumber").prev().append().html(str2+ '<label style="color:green">√</label>');
                                flag[1]=true;
                            }else{
                                $(".accoutNumber").prev().append().html(str2 + '<label style="color: red">该账号已存在</label>');
                                flag[1]=false;
                            }
                        },
                        error:function () {
                            alert("出现错误");
                        }
                    });
                }else {
                    $(this).prev().append().html(str2 + '<label style="color: red">账号格式不正确</label>');
                    flag[1]=false;

                }
            });
            $(".phoneNumber").blur(function () {
                var str="phome (电话号码 ：)";
                var phone=$(this).val();
                if((/^1[34578]\d{9}$/.test(phone))){
                    $(this).prev().append().html(str + '<label style="color:green">√</label>');
                    flag[2]=true;
                }else{
                    $(this).prev().append().html(str + '<label style="color:red">请输入正确的手机号</label>');
                    flag[2]=false;
                }
            });

            $(".password").blur(function () {
                var str="Password (账号密码 ：)";
                var password=$(this).val();
                if((/^[0-9a-zA-Z_]{6,16}$/.test(password))){
                    $(this).prev().append().html(str + '<label style="color:green">√</label>');
                    flag[3]=true;
                }else{
                    $(this).prev().append().html(str + '<label style="color:red">密码不符合规范</label>');
                    flag[3]=false;
                }
            });
            $(".rePassword").blur(function () {
                var str="Confirm Password (确认密码 ：) ";
                var repassword=$(this).val();
                var password=$(".password").val();
                if((repassword==password)){
                    $(this).prev().append().html(str + '<label style="color:green">√</label>');
                    flag[4]=true;
                }else{
                    $(this).prev().append().html(str + '<label style="color:red">密码不一致</label>');
                    flag[4]=false;
                }
            });
            $(".payPassword").blur(function () {
                var str=" payment code (支付密码 ：)";
                var payPassword=$(this).val();
                if((/^[0-9]{6}$/.test(payPassword))){
                    $(this).prev().append().html(str + '<label style="color:green">√</label>');
                    flag[5]=true;
                }else{
                    $(this).prev().append().html(str + '<label style="color:red">密码格式错误</label>');
                    flag[5]=false;
                }
            });
            $(".rePayPassword").blur(function () {
                var str="affirm payment code (确认支付密码 ：) ";
                var  payPassword=$(".payPassword").val();
                var  rePayPassword=$(this).val();
                if(payPassword==rePayPassword){
                    $(this).prev().append().html(str + '<label style="color:green">√</label>');
                    flag[6]=true;
                }else {
                    $(this).prev().append().html(str + '<label style="color:red">密码不一致</label>');
                    flag[6]=false
                }
            });
            $(".submit").click(function () {
                var s=0;
                for(var i=0;i<7;i++){
                    if(flag[i]==true){
                        s++;
                    }
                }
                if(s==flag.length){

                    $("form").submit();
                }
            });

        });

    </script>


</head>
<body style="background-image: url('images/registerBgs.jpg')">
<!--header-->
<div class="header">
    <div class="container">
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <h1 class="navbar-brand"><a  href="index.jsp">Yummy</a></h1>
            </div>
            <!--navbar-header-->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp" class="active">主页</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Birthday<b class="caret"></b></a>
                        <ul class="dropdown-menu multi-column columns-4">
                            <div class="row">
                                <div class="col-sm-3">
                                    <h4>By Relation</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">Friend</a></li>
                                        <li><a class="list" href="products.html">Lover</a></li>
                                        <li><a class="list" href="products.html">Sister</a></li>
                                        <li><a class="list" href="products.html">Brother</a></li>
                                        <li><a class="list" href="products.html">Kids</a></li>
                                        <li><a class="list" href="products.html">Parents</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-3">
                                    <h4>By Flavour</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">Chocolate</a></li>
                                        <li><a class="list" href="products.html">Mixed Fruit</a></li>
                                        <li><a class="list" href="products.html">Butterscotch</a></li>
                                        <li><a class="list" href="products.html">Strawberry</a></li>
                                        <li><a class="list" href="products.html">Vanilla</a></li>
                                        <li><a class="list" href="products.html">Eggless Cakes</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-3">
                                    <h4>By Theme</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">Heart shaped</a></li>
                                        <li><a class="list" href="products.html">Cartoon Cakes</a></li>
                                        <li><a class="list" href="products.html">2-3 Tier Cakes</a></li>
                                        <li><a class="list" href="products.html">Square shape</a></li>
                                        <li><a class="list" href="products.html">Round shape</a></li>
                                        <li><a class="list" href="products.html">Photo cakes</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-3">
                                    <h4>Weight</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">1 kG</a></li>
                                        <li><a class="list" href="products.html">1.5 kG</a></li>
                                        <li><a class="list" href="products.html">2 kG</a></li>
                                        <li><a class="list" href="products.html">3 kG</a></li>
                                        <li><a class="list" href="products.html">4 kG</a></li>
                                        <li><a class="list" href="products.html">Large</a></li>
                                    </ul>
                                </div>
                            </div>
                        </ul>
                    </li>
                    <li class="dropdown grid">
                        <a href="#" class="dropdown-toggle list1" data-toggle="dropdown">Wedding<b class="caret"></b></a>
                        <ul class="dropdown-menu multi-column columns-4">
                            <div class="row">
                                <div class="col-sm-3">
                                    <h4>By Relation</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">Friend</a></li>
                                        <li><a class="list" href="products.html">Lover</a></li>
                                        <li><a class="list" href="products.html">Sister</a></li>
                                        <li><a class="list" href="products.html">Brother</a></li>
                                        <li><a class="list" href="products.html">Kids</a></li>
                                        <li><a class="list" href="products.html">Parents</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-3">
                                    <h4>By Flavour</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">Chocolate</a></li>
                                        <li><a class="list" href="products.html">Mixed Fruit</a></li>
                                        <li><a class="list" href="products.html">Butterscotch</a></li>
                                        <li><a class="list" href="products.html">Strawberry</a></li>
                                        <li><a class="list" href="products.html">Vanilla</a></li>
                                        <li><a class="list" href="products.html">Eggless Cakes</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-3">
                                    <h4>By Theme</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">Heart shaped</a></li>
                                        <li><a class="list" href="products.html">Cartoon Cakes</a></li>
                                        <li><a class="list" href="products.html">2-3 Tier Cakes</a></li>
                                        <li><a class="list" href="products.html">Square shape</a></li>
                                        <li><a class="list" href="products.html">Round shape</a></li>
                                        <li><a class="list" href="products.html">Photo cakes</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-3">
                                    <h4>Weight</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">1 kG</a></li>
                                        <li><a class="list" href="products.html">1.5 kG</a></li>
                                        <li><a class="list" href="products.html">2 kG</a></li>
                                        <li><a class="list" href="products.html">3 kG</a></li>
                                        <li><a class="list" href="products.html">4 kG</a></li>
                                        <li><a class="list" href="products.html">Large</a></li>
                                    </ul>
                                </div>
                            </div>
                        </ul>
                    </li>
                    <li class="dropdown grid">
                        <a href="#" class="dropdown-toggle list1" data-toggle="dropdown">Special Offers <b class="caret"></b></a>
                        <ul class="dropdown-menu multi-column columns-4">
                            <div class="row">
                                <div class="col-sm-3">
                                    <h4>By Relation</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">Friend</a></li>
                                        <li><a class="list" href="products.html">Lover</a></li>
                                        <li><a class="list" href="products.html">Sister</a></li>
                                        <li><a class="list" href="products.html">Brother</a></li>
                                        <li><a class="list" href="products.html">Kids</a></li>
                                        <li><a class="list" href="products.html">Parents</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-3">
                                    <h4>By Flavour</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">Chocolate</a></li>
                                        <li><a class="list" href="products.html">Mixed Fruit</a></li>
                                        <li><a class="list" href="products.html">Butterscotch</a></li>
                                        <li><a class="list" href="products.html">Strawberry</a></li>
                                        <li><a class="list" href="products.html">Vanilla</a></li>
                                        <li><a class="list" href="products.html">Eggless Cakes</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-3">
                                    <h4>By Theme</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">Heart shaped</a></li>
                                        <li><a class="list" href="products.html">Cartoon Cakes</a></li>
                                        <li><a class="list" href="products.html">2-3 Tier Cakes</a></li>
                                        <li><a class="list" href="products.html">Square shape</a></li>
                                        <li><a class="list" href="products.html">Round shape</a></li>
                                        <li><a class="list" href="products.html">Photo cakes</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-3">
                                    <h4>Weight</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">1 kG</a></li>
                                        <li><a class="list" href="products.html">1.5 kG</a></li>
                                        <li><a class="list" href="products.html">2 kG</a></li>
                                        <li><a class="list" href="products.html">3 kG</a></li>
                                        <li><a class="list" href="products.html">4 kG</a></li>
                                        <li><a class="list" href="products.html">Large</a></li>
                                    </ul>
                                </div>
                            </div>
                        </ul>
                    </li>
                    <li class="dropdown grid">
                        <a href="#" class="dropdown-toggle list1" data-toggle="dropdown">Store<b class="caret"></b></a>
                        <ul class="dropdown-menu multi-column columns-3">
                            <div class="row">
                                <div class="col-sm-4">
                                    <h4>By Relation</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">Friend</a></li>
                                        <li><a class="list" href="products.html">Lover</a></li>
                                        <li><a class="list" href="products.html">Sister</a></li>
                                        <li><a class="list" href="products.html">Brother</a></li>
                                        <li><a class="list" href="products.html">Kids</a></li>
                                        <li><a class="list" href="products.html">Parents</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-4">
                                    <h4>By Flavour</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">Chocolate</a></li>
                                        <li><a class="list" href="products.html">Mixed Fruit</a></li>
                                        <li><a class="list" href="products.html">Butterscotch</a></li>
                                        <li><a class="list" href="products.html">Strawberry</a></li>
                                        <li><a class="list" href="products.html">Vanilla</a></li>
                                        <li><a class="list" href="products.html">Eggless Cakes</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-4">
                                    <h4>Specials</h4>
                                    <ul class="multi-column-dropdown">
                                        <li><a class="list" href="products.html">Ice cream cake</a></li>
                                        <li><a class="list" href="products.html">Swiss roll</a></li>
                                        <li><a class="list" href="products.html">Ruske kape</a></li>
                                        <li><a class="list" href="products.html">Cupcakes</a></li>
                                        <li><a class="list" href="products.html">Muffin</a></li>
                                        <li><a class="list" href="products.html">Merveilleux</a></li>
                                    </ul>
                                </div>
                            </div>
                        </ul>
                    </li>
                </ul>
                <!--/.navbar-collapse-->
            </div>
            <!--//navbar-header-->
        </nav>
        <div class="header-info">
            <div class="header-right search-box">
                <a href="#"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>
                <div class="search">
                    <form class="navbar-form">
                        <input type="text" class="form-control">
                        <button type="submit" class="btn btn-default" aria-label="Left Align">
                            开始搜索
                        </button>
                    </form>
                </div>
            </div>
            <div class="header-right login">
                <a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
                <div id="loginBox">
                    <form id="loginForm">
                        <fieldset id="body">
                            <fieldset>
                                <label for="email">账号</label>
                                <input type="text" name="email" id="email">
                            </fieldset>
                            <fieldset>
                                <label for="password">密码</label>
                                <input type="password" name="password" id="password">
                            </fieldset>
                            <input type="submit" id="login" value="登陆">
                            <!--	<label for="checkbox"><input type="checkbox" id="checkbox"> <i>记住账号</i></label>-->
                        </fieldset>
                        <p>没有账号吧？<a class="sign" href="register.jsp">点击注册</a>
                            <span><a href="changePassword.jsp">忘记密码?</a></span>
                        </p>
                    </form>
                </div>
            </div>
            <div class="header-right cart">
                <a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a>
                <div class="cart-box">
                    <h4><a href="index.jsp">
                        <span class="simpleCart_total" style="color: red"> $0.00 </span> (<span id="simpleCart_quantity" class="simpleCart_quantity"> 0 </span>)
                    </a></h4>
                    <p><a href="javascript:;" class="simpleCart_empty">清空购物车</a></p>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!--//header-->
<!--account-->
<div class="account">
    <div class="container">
        <div class="register">

            <form action="register.do" method="post" >
                <div class="register-top-grid"><h3>注册信息</h3>
                    <div style="float: left;margin-left: 150px;margin-top: 50px;">

                        <h4 style="color: #d58512">填写个人信息 :</h4>

                        <div class="input">
                            <span> Name （昵称 ：）<label style="color: red"></label></span>
                            <input type="text" name="nickName" class="nickName" style="width: 300px" placeholder="请输入小于8位数的昵称">
                        </div>

                        <div class="input">
                            <span> account number （账号 ：）</span>
                            <input type="text" name="account_number" class="accoutNumber"
                                   style="width: 300px" placeholder="请填写10-16位数字字符作为登陆账号">
                        </div>

                        <div class="input">
                            <span>phome (电话号码 ：) </span>
                            <input type="text" class="phoneNumber"  style="width: 300px;height: 36px;" name="tel" placeholder="13257498980">
                        </div>

                        <div>
                            <span style="float: left;">Age (年龄 ：) </span>
                            <select style="float: left;margin-left: 20px ;width: 150px;height: 20px" name="age" id="ageOption" onmousedown="initOption()">
                                <option  value="1">1</option>
                            </select>
                        </div>
                        <br>

                        <div class="input">
                            <span>Sex （性别 ：）</span>
                            <div>
                                <span style="float: left">男：<input type="radio" name="sex" value="男" checked="checked"></span>
                                <span style="float: left;margin-left: 20px">女：<input type="radio" name="sex" value="女"></span>
                            </div>
                        </div><br>
                        <div class="input" >
                            <span>Address （地址：）<label></label></span>
                            <br>
                            地区：<select id="area" name="region"></select>
                            省：<select id="cmbProvince" name="province"></select>
                            市：<select id="cmbCity" name="city"></select>
                            区：<select id="cmbArea" name="area"></select>
                            <br /><br />

                            <script type="text/javascript">
                                addressInit('area','cmbProvince','cmbCity','cmbArea','西北地区', '北京', '市辖区', '东城区');
                                //addressInit('Select1', 'Select2', 'Select3');
                            </script>
                        </div>
                    </div>
                </div>

                <div class="clearfix" style=" background-color: #F0F0F0 ;border-radius:20px;box-shadow:-2px 0px 8px #A3A3A3,0px -2px 8px #A3A3A3,0px 2px 8px #A3A3A3,2px 0px 8px #A3A3A3;">
                    <div class="register-bottom-grid">
                        <div style="float: left;margin-left: 150px;margin-top: 40px;margin-bottom: 50px;">
                            <h4 style="color: #d58512">安全设置 :</h4>
                            <div class="input">
                                <span>Password (账号密码 ：) </span>
                                <input type="password" name="password" class="password" style="width: 300px" placeholder="10-16位字符（字母、数字、下划线）">
                            </div>

                            <div class="input">
                                <span>Confirm Password (确认密码 ：) <label style="color: red"></label></span>
                                <input type="password" name = "rePassword" class="rePassword" style="width: 300px" placeholder="请重新输入密码">
                            </div>

                            <div class="input">
                                <span>Secret question (密保问题选项 ：) </span>
                                <br>
                                <span> 密保问题1：</span>
                                <input type="text" name = "question1" style="width: 300px;height: 36px;border: 1px solid #555;"
                                       placeholder="我的年龄有多大？">
                                <div class="input">
                                    <span> 答案：</span>
                                    <input type="text" name = "answer1" style="width: 300px;height: 36px;border: 1px solid #555;"
                                           placeholder="18岁">
                                </div>
                                <span> 密保问题2：</span>
                                <input type="text" name = "question2" style="width: 300px;height: 36px;border: 1px solid #555;"
                                       placeholder="我最喜欢吃什么？">
                                <div class="input">
                                    <span> 答案：</span>
                                    <input type="text" name = "answer2" style="width: 300px;height: 36px;border: 1px solid #555;"
                                           placeholder="猪蹄">
                                </div>
                                <span> 密保问题3：</span>
                                <input type="text" name = "question3" style="width: 300px;height: 36px;border: 1px solid #555;"  placeholder="我的工作是什么？">
                                <div class="input">
                                    <span> 答案：</span>
                                    <input type="text" name = "answer3" style="width: 300px;height: 36px;border: 1px solid #555;"
                                           placeholder="码农">
                                </div>
                            </div>

                            <div class="input">
                                <span> payment code (支付密码 ：) </span>
                                <input type="password" name = "payPassWord" class="payPassword" style="width: 300px"
                                       placeholder="6位纯数字">
                            </div>

                            <div class="input">
                                <span> affirm payment code (确认支付密码 ：) </span>
                                <input type="password" name = "affirm_payment_code" class="rePayPassword" style="width: 300px"
                                       placeholder="重新输入密码">
                            </div>
                            <div class="input">
                                <input type="button" value="开始注册"  class="submit" style="height:30px;width: 150px;flot:left;margin-left: 80px; ">
                            </div>
                        </div>

                    </div>
                </div>

            </form>
        </div>

    </div>
</div>
<!--//account-->
<!--footer-->
<div class="footer">
    <div class="container">
        <div class="footer-grids">
            <div class="col-md-2 footer-grid">
                <h4>company</h4>
                <ul>
                    <li><a href="products.html">products</a></li>
                    <li><a href="#">Work Here</a></li>
                    <li><a href="#">Team</a></li>
                    <li><a href="#">Happenings</a></li>
                    <li><a href="#">Dealer Locator</a></li>
                </ul>
            </div>
            <div class="col-md-2 footer-grid">
                <h4>service</h4>
                <ul>
                    <li><a href="#">Support</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Warranty</a></li>
                    <li><a href="contact.html">Contact Us</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-grid">
                <h4>order & returns</h4>
                <ul>
                    <li><a href="#">Order Status</a></li>
                    <li><a href="#">Shipping Policy</a></li>
                    <li><a href="#">Return Policy</a></li>
                    <li><a href="#">Digital Gift Card</a></li>
                </ul>
            </div>
            <div class="col-md-2 footer-grid">
                <h4>legal</h4>
                <ul>
                    <li><a href="#">Privacy</a></li>
                    <li><a href="#">Terms and Conditions</a></li>
                    <li><a href="#">Social Responsibility</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-grid icons">
                <h4>Connect with Us</h4>
                <ul>
                    <li><a href="#"><img src="images/i1.png" alt=""/>Follow us on Facebook</a></li>
                    <li><a href="#"><img src="images/i2.png" alt=""/>Follow us on Twitter</a></li>
                    <li><a href="#"><img src="images/i3.png" alt=""/>Follow us on Google-plus</a></li>
                    <li><a href="#"><img src="images/i4.png" alt=""/>Follow us on Pinterest</a></li>
                </ul>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
</div>
<!--footer-->
<div class="footer-bottom">
    <div class="container">
        <p>Copyright &copy; 2015.Company name All rights reserved</p>
    </div>
</div>

<script src="assets/js/jquery-1.8.2.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.backstretch.min.js"></script>
<script src="assets/js/scripts.js"></script>
</body>

</html>
