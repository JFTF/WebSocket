<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</head>
	<body>
     <button onclick="start()">测试</button>
<div id="messages"></div>
<script type="text/javascript">
 
    var webSocket = null;
     
    function init()
    {
        webSocket = new WebSocket('ws://127.0.0.1:8082/day_0700_WebSocket/cmd/prog');
         
        webSocket.onerror = function(event) 
        {
          onError(event);
        };
         
        webSocket.onopen = function(event) 
        {
          onOpen(event);
        };
         
        webSocket.onmessage = function(event)
        {
          onMessage(event);
        };
    }
     
    function onMessage(event)
    {
        document.getElementById('messages').innerHTML += '<br />' + event.data;
    }
     
    function onOpen(event) 
    {
        document.getElementById('messages').innerHTML  = 'Connection established';
      
         webSocket.send("ds");
    }
     
    function onError(event) 
    {
        alert(event.data);
    }
     
    function start() 
    {
        init();
    }
 
   </script>
  </body>
</html>
