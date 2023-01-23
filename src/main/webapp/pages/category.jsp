
<html>
<head>
<title>Insert title here</title>
<%
	String name=(String)request.getAttribute("username");

%>
<script>
	var xmlhttp;
	var buttonClicked;
	var message;
	function sendData(button) {
		var cid = document.categoryform.cid.value;
		var name = document.categoryform.name.value;

		var javascriptObject = {"cid" : cid,"name" : name};
		xmlhttp = new XMLHttpRequest();
		buttonClicked=button.value;
		if(buttonClicked=="post")
		{	
				message="data is Added successfully";
				xmlhttp.open("post","categoryapi/saveCategory");
		}
		
		else
		{
			    message="data is updated successfully";
			
				xmlhttp.open("put","categoryapi/updateCategory");
		}
		xmlhttp.load=displayResponse();
		var jsonString = JSON.stringify(javascriptObject);
		xmlhttp.setRequestHeader('Content-type', 'application/json')
		xmlhttp.send(jsonString);
	
	}
	
	
	function displayResponse()
	{
		alert(xmlhttp.responseText)
	}
	
	function getData(button)
	{
		
		var cid=document.categoryform.cid.value;// reading category id typed by user
		
		xmlhttp=new XMLHttpRequest(); // XMLHttpRequest is predefined class

		buttonClicked=button.value;

		if(buttonClicked=="get")
		{
						message="Category is retrieved successfully";
						xmlhttp.open("get","categoryapi/getCategory/"+ cid);// send cid to API method
		}
		else
		{
			message="Category is deleted successfully";
			xmlhttp.open("delete","categoryapi/deleteCategory/"+ cid);// send cid to API method
		}
		
			
		xmlhttp.onload=displayResponse2; 

		// when response is loaded from API , then call displayResponse2  function .
		// DO NOT write displayResponse2() . just write displayResponse2.
				
		xmlhttp.send();
							
	}

	function displayResponse2()
	{	
		var jsonstring=xmlhttp.responseText;
		var obj=JSON.parse(jsonstring); // parse() converts JSON String to JavaScript object

		// obj ==> {cid:1,name:"stationery"} if record is found
		// obj ==> {message:record not found} if record is NOT found
		
		var name=obj.name;
	    
// when exception occurs , message variable value will be record not found and below 
// condition will be satisfied

	    if(obj.message!=undefined) 
		{
	    	document.categoryform.name.value="No Catogory present"; 

			document.getElementById("message").innerHTML=obj.message;	
						
		}
	    else
		{
			document.categoryform.name.value=name;

			document.getElementById("message").innerHTML=message;	
		}
	}
	
	var xmlhttpp;

	function getAllData()
	{

		xmlhttpp=new XMLHttpRequest(); // XMLHttpRequest is predefined class


		xmlhttpp.open("get","categoryapi/getAllCategories");
		xmlhttpp.onload=displayResponse3;


		xmlhttpp.send();	 
		
	}

	function displayResponse3()
	{

			//int[] a={};  java 
			
			var allJSONStrings=xmlhttpp.responseText;// allJSONStrings is a array
			//var p1=document.getElementById("p1");
				
			var data="";
		/*	
		for(var i=0;i<allJSONStrings.length;i++)
		{
			alert(allJSONStrings[i]);
			
			var obj=JSON.parse(allJSONStrings[i]); // parse() converts JSON String to JavaScript object
			data=data+obj+ "<br>";
		}
*/
		document.getElementById("p1").innerHTML=allJSONStrings;

			

    }

</script>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

.container {
	margin: auto;
	width: 35%;
	height: 35%;
	padding: 10px;
	margin-top: 17%;
	border-radius: 10px;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 15px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
	border-radius: 20px;
}

button {
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	cursor: pointer;
	width: 40%;
	border-radius: 15px;
}

button:hover {
	opacity: 0.8;
}

.signup {
	margin-left: 40px;
}

#Add {
	background-color: #1e1c9b;
	margin-left: 10%;
}

#Delete {
	background-color: #cf1717;
}

#Update {
	background-color: #41b0db;
	margin-left: 10%;
}

#Get {
	background-color: #15b13c;
}

#GetAll {
	background-color: #15b13c;
	margin-left: 30%;
}

span
	{
		font-size: 30px;
		color:red;
		margin: 400px;
	}
#para{
                width: 300px;
                top:20px;
                background-color: yellow;
                color: black;
                height: 300px;
                marging:auto;
            }
</style>
</head>
<body>
	<span id="message">waiting</span>
	<form name="categoryform">
		<div class="container">
			<label for="cid"><b>Category Id : </b></label>
			 <input type="text" placeholder=" Category Id :" name=cid> <br> <br> 
			 <label	for="name"><b>Category Name : </b></label> 
			 <input type="text" placeholder=" Category Name :" name=name> <br>
			<br>
			<button value="post" onclick="sendData(this)" id="Add" value="post">Add
				Category</button>
			<button value="get" onclick="getData(this);return false;" id="Get" value="get">Get
				Category</button>
			<button value="put" onclick="sendData(this);return false;" id="Update" value="put">Update
				Category</button>
			<button value="delete" onclick="getData(this);return false;" id="Delete"
				value="delete">Delete Category</button>
			<button value="getall" onclick="getAllData();return false;" id="GetAll"
				value="getall" >Get All Categories</button>

		</div>


	</form>
	<br>
	<br><br>
	<br><br><br><br>
	<div id="para">
		<p id="p1"> All Data </p> 
	</div>
</body>
</html>