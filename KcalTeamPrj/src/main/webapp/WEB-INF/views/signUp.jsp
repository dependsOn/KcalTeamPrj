<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table cellspacing=0 cellpadding=0 border="0">
        <tr>
            <td height=1><spacer type=BLOCK height=10 width=100%></td>
        </tr>
    </table>

    <form name="join" action="${path}/member/signUp" method="post">
        
        <table width="500" cellspacing="0" bordercolordark="white" bordercolorlight="black" cellpadding="0" align="center">
            <tr bgcolor="#008baf" valign="middle">
                <td height="25" class="t1" align="center"><b>
                    <font color ="#FFFFFF" size="2"> ::: 확찐자 구조대 가입하기 :::</font>
                </b></td>
            </tr>

            <tr>
                <td height="30" class="t1">
                    <table width="100%" border="0" cellspacing="0" cellpadding="2">
                        <tr>
                            <td width="100%" class="t1" align="right"><font color="#FF0000"><b>*</b></font>
                                <font color="#0000FF">표시부분 입력필슈!</font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td height="20" class="t1">
                    <table width="100%" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="#0CA5A5">
                        <tr>
                            <td width="25%" class="t1" bgcolor="#bddee8"><strong>&nbsp;
                                <font color="#FF0000"><b>*</b></font>원하는 ID
                            </strong>

                            </td>
                            <td width="75%" class="t1">&nbsp;
                                <input type="text" name="id" id="id" title="ID" maxlength="13" size="13" class="TXTFLD">&nbsp;&nbsp;&nbsp;
                                <button type="button" onclick="idcheck(join);">중복확인</button>
                            </td>
                        </tr>
                    </table>

                </td>
            </tr>
            <tr>
            <td height="20" class="t1">
                <table width="100%" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="#0CA5A5">
                    <tr>
                        <td width="25%" class="t1" bgcolor="#bddee8"><strong>&nbsp;
                            <font color="#FF0000"><b>*</b></font>비밀번호
                        </strong>

                        </td>
                        <td width="75%" class="t1">&nbsp;
                            <input type="password" name="password" id="password" maxlength="13" size="13" class="TXTFLD">
                        </td>
        
            </tr>
        </table>
        </td>
        </tr>

        <tr>
            <td height="20" class="t1">
                <table width="100%" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="#0CA5A5">
                    <tr>
                        <td width="25%" class="t1" bgcolor="#bddee8"><strong>&nbsp;
                            <font color="#FF0000"><b>*</b></font>비밀번호 확인
                        </strong>

                        </td>
                        <td width="75%" class="t1">&nbsp;
                            <input type="password" name="password2" id="password2" maxlength="13" size="13" class="TXTFLD">
                        </td>
        
            </tr>
        </table>
        </td>
        </tr>

        <tr>
            <td height="20" class="t1">
                <table width="100%" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="#0CA5A5">
                    <tr>
                        <td width="25%" class="t1" bgcolor="#bddee8"><strong>&nbsp;
                            <font color="#FF0000"><b>*</b></font>닉네임
                        </strong>

                        </td>
                        <td width="75%" class="t1">&nbsp;
                            <input type="text" name="nickname" id="nickname" maxlength="13" size="13" class="TXTFLD">
                        </td>
        
            </tr>
        </table>
        </td>
        </tr>

        <tr>
            <td height="20" class="t1">
                <table width="100%" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="#0CA5A5">
                    <tr>
                        <td width="25%" class="t1" bgcolor="#bddee8"><strong>&nbsp;
                            <font color="#FF0000"><b>*</b></font>이메일
                            
                        </strong>

                        </td>
                        <td width="75%" class="t1">&nbsp;
                            <input type="text" name="email" id="email" maxlength="30" size="30" class="TXTFLD">
                        </td>
        
            </tr>
        </table>
        </td>
        </tr>

        <tr>
            <td height="20" class="t1">
                <table width="100%" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="#0CA5A5">
                    <tr>
                        <td rowspan="2" width="25%" class="t1" bgcolor="#bddee8"><strong>&nbsp;
                            <font color="#FF0000"><b>*</b></font>주소
                        </strong>

                        </td>
                        <td width="25%" class="t1">&nbsp;
                            우편번호<input type="text" name="addr1" id="addr1" size="10" class="TXTFLD">
                            <input type="text" name="addr2" id="addr2" maxlength="45" size="45" class="TXTFLD">
                        </td>
        
            </tr>
            <tr>
                <td width="75%" class="t1">
                    <input type="text" name="addr3" id="addr3" maxlength="45" size="45" class="TXTFLD">
                </td>
            </tr>
        </table>
        </td>
        </tr>

        <tr>
            <td height="10" class="t1">
                <table width="100%" border="0" cellspacing="0" cellpadding="2">
                    <tr>
                        <td width="75%" class="t1">

                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td height="30" class="t1" align="center">
                <input type="submit" border="0" value="가입신청" submit"> &nbsp;
                <a href ="memberLogin.jsp"></a>
            </td>
        </tr>
</table>

</form>

    <table cellspacing=0 cellpadding=0 border=0>
        <tr>
            <td height=20><spacer type=BLOCK height=10 width=100%></td>
        </tr>
    </table>
</body>
</html>