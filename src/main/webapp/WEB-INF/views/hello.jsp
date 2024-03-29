<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="Content-Type">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users</title>



<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

</head>
<body onload="load();">

	<input type="hidden" id="user_id">
	Name: <input type="text" id="name" required="required" name="user_name"><br>
	Email: <input type="email" id="email" required="required" name="email"><br>
	
	<button onclick="submit();">Submit</button>
	
	<table id="table" border=1>
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
	</table>
	
	<script type="text/javascript">
    data = "";
    submit = function(){
          
            $.ajax({
                url:'saveOrUpdate',
                type:'POST',
                data:{user_id:$("#user_id").val(),user_name:$('#name').val(),email:$('#email').val()},
                success: function(response){
                        alert(response.message);
                        load();    
                }              
            });        
    }
     
    delete_ = function(id){     
         $.ajax({
            url:'delete',
            type:'POST',
            data:{user_id:id},
            success: function(response){
                    alert(response.message);
                    load();
            }              
        });
}
     
 
    edit = function (index){
        $("#user_id").val(data[index].user_id);
        $("#name").val(data[index].user_name);
        $("#email").val(data[index].email);
         
    }
     
     
    load = function(){ 
        $.ajax({
            url:'list',
            type:'POST',
            success: function(response){
                    data = response.data;
                    $('.tr').remove();
                    for(i=0; i<response.data.length; i++){                  
                        $("#table").append("<tr class='tr'> <td> "+response.data[i].user_name+" </td> <td> "+response.data[i].email+" </td> <td> <a href='#' onclick= edit("+i+");> Edit </a>  </td> </td> <td> <a href='#' onclick='delete_("+response.data[i].user_id+");'> Delete </a>  </td> </tr>");
                    }          
            }              
        });
         
    }
         
    </script>
	
	
</body>
</html>