<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>品牌酒网注册</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/reg.css"
	type="text/css" />

<script src="${pageContext.request.contextPath }/js/customer/reg/jquery-1.2.6.min.js" type=text/javascript></script>
<script src="${pageContext.request.contextPath }/js/customer/reg/formValidator_min.js" type="text/javascript" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath }/js/customer/reg/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({formid:"form1",debug:false,submitonce:true,
		onerror:function(msg,obj,errorlist){
			//$.map(errorlist,function(msg1){alert(msg1)});
			alert(msg);
		}
	});
	$("#t_UserName").formValidator({onshow:"5-10个字符",onfocus:"5-10个字符",oncorrect:"该用户名可以注册"}).inputValidator({min:5,max:10,onerror:"输入有误"}).regexValidator({regexp:"username",datatype:"enum",onerror:"格式有误"});
	$("#iptNickName").formValidator({onshow:"至少4个字符",onfocus:"至少4个字符",oncorrect:"通过"}).inputValidator({min:4,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
	$("#t_UserPass").formValidator({onshow:"至少6个字符",onfocus:"至少6个字符",oncorrect:"密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
	$("#t_RePass").formValidator({onshow:"请再次输入密码",onfocus:"请再次输入密码",oncorrect:"密码一致"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"}).compareValidator({desid:"t_UserPass",operateor:"=",onerror:"密码不一致"});	
	$("#iptName").formValidator({onshow:"至少4个字符",onfocus:"至少4个字符",oncorrect:"通过"}).inputValidator({min:4,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
	$("#iptCard").formValidator({onshow:"15或18位的身份证",onfocus:"15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
	$("#t_Email").formValidator({onshow:"6-100个字符",onfocus:"6-100个字符",oncorrect:"恭喜你,你输对了",defaultvalue:"@"}).inputValidator({min:6,max:100,onerror:"长度非法"}).regexValidator({regexp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onerror:"格式不正确"});
	$("#phone").formValidator({onshow:"11位电话号码",onfocus:"11位电话号码",oncorrect:"输入正确"}).functionValidator({fun:isPhone});
	
});
function test1(obj)
{
	if(obj.value=="全角字符当做1个长度")
	{
		$.formValidator.getInitConfig("1").wideword = false;
		obj.value = "全角字符当做2个长度";
	}
	else
	{
		$.formValidator.getInitConfig("1").wideword = true;
		obj.value = "全角字符当做1个长度";
	}
	
}

</script>
</head>

<body>
	<!-- logo -->
	<div class="logo">
		<p style="background:url(${pageContext.request.contextPath }/images/others/winelogo.png) no-repeat;" class="logo">
		</p>
	</div>

<!--注册开始-->
    <div class="reg">
    	<div class="welcome">欢迎注册品牌酒网帐号</div>
        <form action="reg" method="post" name="form1" id="form1">
        	<!--  
            <dl>
                <dt class="f14 b">账户基本信息</dt>
                <dd><span class="title">昵称：</span><input class="reg_input" name="iptNickName" id="iptNickName" onblur="checkNickName(this.value)" type="text" /><span id="iptNickNameTip" class="onshow"></span></dd>
                <dd><span class="title">性别：</span><input type="radio" id="Sex_Man" name="rb_Sex" value="0" checked="CHECKED" /><label for="Sex_Man"> 帅哥</label>
                                                    <input type="radio" id="Sex_Woman" name="rb_Sex" value="0" /><label for="Sex_Woman"> 美女</label>　
                                                    <input name="" type="checkbox" value="" /> 不公开
              </dd>
            </dl>
            -->
            <dl>
                <!-- <dt class="f14 b">帐户安全设置</dt>  -->
                <dd><span class="title">登录账号：</span><input class="reg_input" name="user.username" id="t_UserName" onblur="checkusername(this.value);" type="text" /><span id="t_UserNameTip" class="onshow"></span></dd>
                <dd><span class="title">登录密码：</span><input class="reg_input" onblur="return checkpasswd(this);" id="t_UserPass" name="user.passwd" type="password"/><span id="t_UserPassTip" class="onshow"></span></dd>
                <dd><span class="title">确认登录密码：</span><input onblur="checkdoublepassword();" class="reg_input" type="password" id="t_RePass" name="t_RePass"/><span id="t_RePassTip" class="onshow"></span></dd>
                <dd><span class="title">邮箱地址：</span><input class="reg_input" name="user.email" type="text" id="t_Email" onblur="checkemail(this.value)" /><span id="t_EmailTip" class="onshow"></span></dd>
                <dd><span class="title">手机号码：</span><input class="reg_input" name='user.phone' type='text' id='iptPhone' onblur="return checktheform();" /><span id="iptPhoneTip" class="onshow"></span></dd>               
                
                <!--  <dd><span class="title">真实姓名：</span><input name="iptName" id="iptName" class="reg_input" type="text" onblur="return isCnn(this)" /><span id="iptNameTip" class="onshow"></span></dd>
                <dd><span class="title">身份证号：</span><input class="reg_input" name='iptCard' type='text' id='iptCard' onblur="return checktheform();" /><span id="iptCardTip" class="onshow"></span></dd>
                -->
                <!-- <dd><span class="title">验证码：</span><input id="t_CheckCode" class="reg_input_pic" name="t_CheckCode" type="text" maxlength="4" />
                <img class="img" src="images/eee.jpg" width="60" height="30" /><span id="t_CheckCodeTip" class="reg_m onError in_pic_s">sdsdas</span></dd>
                 -->
            </dl>
            <div class="f_reg_but"><input id="button" name="button" type="submit" value="免费注册" class="r_button"/><span class="clew_txt">如果您已有帐号，可<a href="goLoginUI.action">直接登录</a></span></div>
        </form>                              
    </div>
<!--注册结束-->        
</body>
</html>