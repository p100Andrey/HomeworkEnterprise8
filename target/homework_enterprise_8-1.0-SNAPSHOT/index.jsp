<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>

<head>
    <title>My ToDo List</title>
</head>

<body>
<h2 style="background-color:#000000; color:#CDC0B0; height:40px">&emsp;My Tasks</h2>
<table bordercolor="white" border="5" cellpadding="10">
    <tr>
        <td>
            <h1>My ToDo List</h1>
            <hr width="80%" align="left">

            <br/>
            <table border="1" cellspacing="0" cellpadding="10" width="80%" style="font-size:22px">
                <tr align=left>
                    <td><b>Name</b></td>
                    <td><b>Category</b></td>
                    <td><b>Complete</b></td>
                </tr>

                <form METHOD="POST" name="update_tasks">
                    <c:set var="count" value="0" scope="page"/>
                    <c:forEach items="${result}" var="record" varStatus="loop">
                    <tr align=left style="background-color:#ffeb61">
                        <td>${record.key}</td>
                        <td>${record.value} </td>
                        <td><input type="checkbox" name="${record.key}"></td>
                    </tr>
                        <c:set var="count" value="${count + 1}" scope="page"/>
                    </c:forEach>
            </table>

            <br/><br/>
            <input TYPE="submit" value="Update Tasks" style="background-color:#1E90FF; height:30px">
            </form>
            <br/><br/>

            <hr width="80%" align="left">
            <br/>

            <form METHOD="POST">
                <table width="1200" border="0" cellpadding="5">
                    <tr>
                        <td width="15%"><b>Task Name</b></td>
                        <td><input type="text" name="task_name" placeholder="Enter name" size="106"></td>
                    </tr>
                    <tr>
                        <td><b>Task Category</b></td>
                        <td><input type="text" name="category" placeholder="Enter category" size="106"></td>
                    </tr>
                    <tr>
                        <td><input TYPE="submit" value="Add Task" name="new_record"
                                   style="background-color:#1E90FF; height:30px"></td>
                        <td></td>
                    </tr>

                </table>
            </form>
            <hr width="80%" align="left">
            <font color="red"><h1>${error}</h1></font><br/></h1>

        </td>
    </tr>
</table>
</body>
</html>