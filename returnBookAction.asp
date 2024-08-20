<%@ Language=VBScript.Encode codepage=1256%>
<!--#include file="connection1.inc"-->

<html lang="en" dir="ltr">
<head>
<meta http-equiv="X-UA-Compatible" content="chrome=1"> 
<meta http-equiv="X-UA-Compatible" content="IE=8;FF=3;OtherUA=4">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<meta http-equiv="Content-Language" content="ar-sa">
<title>Document</title>
<style>
	
</style>
</head>
<body>

<%
    returnDate = Request.Form("returnDate")

    sql = "SELECT burrowerName,bookName FROM BurrowingProcess WHERE returnDate = #" & returnDate & "#"
    set rs = ConAct.Execute(sql)

    While Not rs.EOF
        bookName = rs("bookName")
        burrowerName = rs("burrowerName")

        returnedValue = Request.Form("returned" & burrowerID)

        ' Update the book availability based on the returned value
        if returnedValue = "1" and availability = 0 then
            sqlUpdateBook = "UPDATE Books SET availability = 1 WHERE bookName = '" & bookName & "'"
            ConAct.Execute(sqlUpdateBook)
        end if

        rs.MoveNext
    Wend

    rs.Close

    response.write("<script language=""javascript"">alert('Books returned successfully!');window.location.href='returnBook.asp?returnDate=" & returnDate & "';</script>")
%>

</body>
</html>