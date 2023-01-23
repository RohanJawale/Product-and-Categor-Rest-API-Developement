
<html>
<head>
<title>Insert title here</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        
        .container {
            display:block;
            width: 35%;
            margin: auto;
            height: 35%;
            padding: 10px;
            margin-top: 5%;
            border-radius: 10px;
        }
        
        input[type=text]{
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
                margin-left:auto;
            	margin-right:auto;
            }
           
            #table1{
            margin-left:auto;
            margin-right:auto;
            margin-top:400px;
            }
            th,td{
              text-align: center;
            
            }
            #caption{
            text-align:center;
            font-style: normal;
            }
            #message{
            margin-left:auto;
            margin-right:auto;
            }
         
        </style>
        <script>
        var xmlhttp;
    	var buttonClicked;
    	var message;
    	function sendData(button) {
    		var pid = document.productform.pid.value;
    		var name = document.productform.name.value;
    		var price=document.productform.price.value;
			var cid=document.productform.cid.value;
    		var javascriptObject = {"pid" : pid,"name" : name,"price":price,"cid":cid};
    		xmlhttp = new XMLHttpRequest();
    		buttonClicked=button.value;
    		if(buttonClicked=="post")
    		{	
    				message="Product is Added successfully";
    				xmlhttp.open("post","productapi/saveproduct/"+ cid);
    		}
    		
    		else
    		{
    			    message="Product is updated successfully";
    			
    				xmlhttp.open("put","productapi/updateproduct");
    		}
    		xmlhttp.load=displayResponse();
    		var jsonString = JSON.stringify(javascriptObject);
    		xmlhttp.setRequestHeader('Content-type', 'application/json');
    		xmlhttp.send(jsonString);
    	
    	}
    	
    	
    	function displayResponse()
    	{
    		alert(xmlhttp.responseText)
			document.getElementById("message").innerHTML=message;	

    	}
    	
    	function getData(button)
    	{
    		
    		var pid=document.productform.pid.value;// reading category id typed by user
    		xmlhttp=new XMLHttpRequest(); // XMLHttpRequest is predefined class
			alert(pid);
    		buttonClicked=button.value;

    		if(buttonClicked=="get")
    		{
    						message="Product is retrieved successfully";
    						xmlhttp.open("get","productapi/getproduct/"+ pid);// send cid to API method
    		}
    		else
    		{
    			message="Product is deleted successfully";
    			xmlhttp.open("delete","productapi/deleteProduct/"+ pid);// send cid to API method
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
    		var price=obj.price;
    		var cid=obj.cid;
    	    
    // when exception occurs , message variable value will be record not found and below 
    // condition will be satisfied

    	    if(obj.message!=undefined) 
    		{
    	    	document.productform.name.value="Product not found"; 

    			document.getElementById("message").innerHTML=name+" is "+obj.message;	
    						
    		}
    	    else
    		{
    			document.productform.name.value=name;
    			document.productform.price.value=price;
    			document.productform.cid.value=cid;

    			document.getElementById("message").innerHTML=name+" is "+message;	
    		}
    	}
    	
 
    	
    	function getAllData(button)
		{
				xmlhttp=new XMLHttpRequest();
				xmlhttp.open("get","productapi/getallproducts");
	    		xmlhttp.onload=displayResponse3; 
				xmlhttp.send();

				
		}
		

		function displayResponse3()
		{

			var table=document.getElementById("table1");
			table.innerHTML=""; // clear existing rows from table
			var caption=document.createElement("caption");
			caption.setAttribute("id", "caption");
			var captionValue=document.createTextNode("Products Information");
			caption.appendChild(captionValue);
			var headingrow=document.createElement("tr");

			var pidheading=document.createElement("th");
			var nameheading=document.createElement("th");
			var priceheading=document.createElement("th");
			var cidheading=document.createElement("th");
			
			var pidvalue=document.createTextNode("product id");
			var namevalue=document.createTextNode("product name");
			var pricevalue=document.createTextNode("product price");
			var cidvalue=document.createTextNode("product Category ID");
			
			pidheading.appendChild(pidvalue);
			nameheading.appendChild(namevalue);
			priceheading.appendChild(pricevalue);
			cidheading.appendChild(cidvalue);


			headingrow.appendChild(pidheading);
			headingrow.appendChild(nameheading);
			headingrow.appendChild(priceheading);
			headingrow.appendChild(cidheading);
			
			table.appendChild(caption);
			table.appendChild(headingrow);


			var data=xmlhttp.responseText;

			
			
			// data ==> [ {"rno":1,"marks":70} , {"rno":2,"marks":80} ]
					
			data=data.substring(1,data.length-1);
			
			//alert(data);

			
			/*
			String s="java";  //  [java] 
			s=s.concat("KiranAcademy");// s==>[java KiranAcademy]
			sop(s);
			*/

			// data ==> {"rno":1,"marks":70} , {"rno":2,"marks":80} , {"rno":3,"marks":70}
			
			var newstr="";  // {""rno":1,"marks":70}

			// creating new string where we will add character #, so that we can split strings
			// based on # .
										
			for(var i=0;i<data.length;i++)
			{
			//	alert(data[i]);
				var character=data[i];
				if(character==',' && data[i+1]=='{')
				{
					newstr=newstr+"#";
				}
				else
				{
					newstr=newstr+character;
				}
				
			}

		//	alert(newstr);

			// newstr ==> {"rno":1,"marks":70} # {"rno":2,"marks":80} # {"rno":3,"marks":70}
			
			var jsonstrings=newstr.split("#");



			
			for(var i=0;i<jsonstrings.length;i++)
			{

					var jsonrecord=jsonstrings[i];
					
//					alert(jsonrecord);
													
					var object=JSON.parse(jsonrecord);
					
					var row=document.createElement("tr");

					var pidtd=document.createElement("td");
					var nametd=document.createElement("td");
					var pricetd=document.createElement("td");
					var cidtd=document.createElement("td");
					
					var pidvalue=document.createTextNode(object.pid);
					var namevalue=document.createTextNode(object.name);
					var pricevalue=document.createTextNode(object.price);
					var cidValue=document.createTextNode(object.cid);
					
				
					
					//alert(productimage.src);
					
					pidtd.appendChild(pidvalue);
					nametd.appendChild(namevalue);
					pricetd.appendChild(pricevalue);
					cidtd.appendChild(cidValue);
					
					row.appendChild(pidtd);
					row.appendChild(nametd);
					row.appendChild(pricetd);
					row.appendChild(cidtd);
					
					table.appendChild(row);
					
			}
		}
        
        </script>
        
</head>
<body>

    <body>
        <span id="message"></span>

        <form name="productform">
            <div class="container" >
                <label for="pid"><b>Product Id : </b></label>
                 <input type="text" placeholder=" Product Id " name=pid> <br> <br> 
                 <label	for="name"><b>Product Name : </b></label> 
                 <input type="text" placeholder=" Product Name " name=name> <br><br>
                 <label	for="price"><b>Product Price : </b></label> 
                 <input type="text" placeholder=" Product Price " name=price> <br> <br> 
                 <label	for="cid"><b>Category Id : </b></label> 
                 <input type="text" placeholder=" Category Id " name=cid> <br> <br> 
                
                <button value="post" onclick="sendData(this);return false;" id="Add" >Add
                    Product</button>
                <button value="get" onclick="getData(this);return false;" id="Get" >Get
                    Product</button>
                <button value="put" onclick="sendData(this);return false;" id="Update" >Update
                    Product</button>
                <button value="delete" onclick="getData(this);return false" id="Delete"
                    >Delete Product</button>
                <button value="getall" onclick="getAllData(this);return false;" id="GetAll"
                   >Get All Product</button>
    

            </div>

    
        </form>
       
       <div>
       	<table id="table1" border=1  cellspacing=2 callpading=5 >
				
		</table>
       </div>
 
    </body>
</body>
</html>