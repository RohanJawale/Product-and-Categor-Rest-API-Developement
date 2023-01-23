
<html>
<head>
<title>Insert title here</title>
 <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        .container {

            margin: auto;
            width: 35%;
            height: 35%;
            border: 3px solid green;
            padding: 10px;
            margin-top: 17%;
            border-radius: 10px;

        }

        input[type=text],
        input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 15px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            background-color: #04AA6D;
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
        
        
    </style>
    
    <script>
        var xmlhttp;
    	function checkData(button)
    	{
    		xmlhttp=new XMLHttpRequest();
    		var username=document.loginform.username.value;
    		var password=document.loginform.password.value;
    		var javascriptObject = {"username" : username,"password" : password};
    		xmlhttp.open("post","/getuser");
    		xmlhttp.load=displayResponse();
    		var jsonString = JSON.stringify(javascriptObject);
    		xmlhttp.setRequestHeader('Content-type', 'application/json');
    		xmlhttp.send(jsonString);
    	}
    	function displayResponse()
    	{
    		alert(xmlhttp.responseText);

    	}
    
    </script>
    
</head>
<body>
 <marquee behavior="15" direction="right"  scrollamount="10"><h1>Hello Welcome to Login Page</h1></marquee>
 <form name="loginform">
    <div class="container">
        <label for="username"><b>Username </b></label>
        <input type="text" name="username" placeholder="Enter Username" >
        <br>
        <label for="password"><b>Password </b> </label>
        <input type="password" name="password" placeholder="Enter Password">
        <br>
        <button value="get" onclick="checkData(this);return false;">Login</button>
    </div>
  </form>
</body>
</html>