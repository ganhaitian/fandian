package com.fandian.util;

import com.fandian.model.WeixinMsgNotify;
import org.springframework.stereotype.Service;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.transform.Result;
import java.io.StringReader;
import java.io.StringWriter;

/**
 * Created by zhijieliu on 2014/7/18.
 */
@Service
public class XMLUtil {



    public String transObjToXml(Object o) throws Exception{
        JAXBContext context = JAXBContext.newInstance(o.getClass());

        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_ENCODING,"UTF-8");//编码格式

        //我在实际开发中重新封装了JAXB基本类，这里就使用到了该属性。不过默认的编码格式UTF-8

        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);//是否格式化生成的xml串
        marshaller.setProperty(Marshaller.JAXB_FRAGMENT, false);//是否省略xml头信息（<?xml version="1.0" encoding="gb2312" standalone="yes"?>）

        StringWriter stringWriter = new StringWriter();

        marshaller.marshal(o, stringWriter);

        return stringWriter.getBuffer().toString();
    }

    public <T> T transXmlToObj(String xml,Class<T> clazz) throws JAXBException {
        JAXBContext context = JAXBContext.newInstance(clazz);
        Unmarshaller unmarshaller = context.createUnmarshaller();
        return (T) unmarshaller.unmarshal(new StringReader(xml));
    }

    public static void main(String[] args) throws Exception {
//        WeixinMsgNotify weixinMsgNotify = new WeixinMsgNotify();
//        weixinMsgNotify.setFromUserName("fromuser");
//        weixinMsgNotify.setToUserName("touser");
//        weixinMsgNotify.setCreateTime("123423432");
//        weixinMsgNotify.setMsgId("11111111111111");
//        weixinMsgNotify.setMsgType("text");
//        weixinMsgNotify.setContent("testcontent");
//
//        String s = new XMLUtil().transObjToXml(weixinMsgNotify);
//        System.out.println(s);
        String xml = "<xml>\n" +
                " <ToUserName><![CDATA[toUser]]></ToUserName>\n" +
                " <FromUserName><![CDATA[fromUser]]></FromUserName> \n" +
                " <CreateTime>1348831860</CreateTime>\n" +
                " <MsgType><![CDATA[text]]></MsgType>\n" +
                " <Content><![CDATA[this is a test]]></Content>\n" +
                " <MsgId>1234567890123456</MsgId>\n" +
                " </xml>";

        System.out.println(new XMLUtil().transXmlToObj(xml,WeixinMsgNotify.class).getFromUserName());
    }
}
