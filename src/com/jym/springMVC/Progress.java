package com.jym.springMVC;

import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
 
import java.util.concurrent.TimeUnit;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
 
@ServerEndpoint("/cmd/prog")
public class Progress
{
    @OnMessage
    public void onMessage(String msg, Session session) throws Exception
    {
        System.out.println("-------onMessage-------");
        System.out.println("msg : " + msg);
        System.out.println(session.getQueryString());
         
        for(int i=0;i<=100;i++)
        {
            String tmp = "让我们定义一个 Java EE websocket服务器端" + i;
            System.out.println("send msg : " + tmp);
            session.getBasicRemote().sendText(tmp);
            TimeUnit.SECONDS.sleep(1l);
        }
    }
     
    @OnOpen
    public void onOpen()
    {
        System.out.println("------------onOpen------------");
    }
     
    @OnClose
    public void onClose()
    {
        System.out.println("------------onClose------------");
    }
}