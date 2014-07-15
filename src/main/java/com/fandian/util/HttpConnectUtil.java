package com.fandian.util;


import org.apache.http.*;
import org.apache.http.client.CookieStore;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.AuthSchemes;
import org.apache.http.client.config.CookieSpecs;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.config.*;
import org.apache.http.conn.DnsResolver;
import org.apache.http.conn.HttpConnectionFactory;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.*;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.DefaultHttpResponseFactory;
import org.apache.http.impl.client.*;
import org.apache.http.impl.conn.*;
import org.apache.http.impl.io.DefaultHttpRequestWriterFactory;
import org.apache.http.io.HttpMessageParser;
import org.apache.http.io.HttpMessageParserFactory;
import org.apache.http.io.HttpMessageWriterFactory;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicLineParser;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.message.LineParser;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.util.CharArrayBuffer;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


import javax.net.ssl.SSLContext;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.charset.CodingErrorAction;
import java.util.*;


/**
 * HTTP-Client http模拟客户端，获取指定url的响应内容
 * @author zhijieliu
 *
 */
@Service
public class HttpConnectUtil {

	private HttpClient client;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	//连接超时
	private int conn_timeout = 10000;
	//传输超时
	private int so_timeout = 30000;
	//默认响应内容编码
	private String default_response_encode = "UTF-8";
	
	public HttpConnectUtil() {
		initConfig();
	}


	/**
	 * 构造函数
	 * @param conn_timeout 连接超时时间 ms
	 * @param so_timeout 传输超时时间  ms
	 * @param default_response_encode 默认响应内容编码
	 */
	public HttpConnectUtil(int conn_timeout, int so_timeout, String default_response_encode) {
		setConn_timeout(conn_timeout);
		setSo_timeout(so_timeout);
		setDefault_response_encode(default_response_encode);
		initConfig();

	}


	/**
	 * 初始化
	 * 设置连接管理器、超时时间等
	 */
	private void initConfig() {

        // Use custom message parser / writer to customize the way HTTP
        // messages are parsed from and written out to the data stream.
        HttpMessageParserFactory<HttpResponse> responseParserFactory = new DefaultHttpResponseParserFactory() {

            @Override
            public HttpMessageParser<HttpResponse> create(
                    SessionInputBuffer buffer, MessageConstraints constraints) {
                LineParser lineParser = new BasicLineParser() {

                    @Override
                    public Header parseHeader(final CharArrayBuffer buffer) {
                        try {
                            return super.parseHeader(buffer);
                        } catch (ParseException ex) {
                            return new BasicHeader(buffer.toString(), null);
                        }
                    }

                };
                return new DefaultHttpResponseParser(
                        buffer, lineParser, DefaultHttpResponseFactory.INSTANCE, constraints) {

                    @Override
                    protected boolean reject(final CharArrayBuffer line, int count) {
                        // try to ignore all garbage preceding a status line infinitely
                        return false;
                    }

                };
            }

        };
        HttpMessageWriterFactory<HttpRequest> requestWriterFactory = new DefaultHttpRequestWriterFactory();

        // Use a custom connection factory to customize the process of
        // initialization of outgoing HTTP connections. Beside standard connection
        // configuration parameters HTTP connection factory can define message
        // parser / writer routines to be employed by individual connections.
        HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> connFactory = new ManagedHttpClientConnectionFactory(
                requestWriterFactory, responseParserFactory);

        // Client HTTP connection objects when fully initialized can be bound to
        // an arbitrary network socket. The process of network socket initialization,
        // its connection to a remote address and binding to a local one is controlled
        // by a connection socket factory.

        // SSL context for secure connections can be created either based on
        // system or application specific properties.
        SSLContext sslcontext = SSLContexts.createSystemDefault();
        // Use custom hostname verifier to customize SSL hostname verification.
        X509HostnameVerifier hostnameVerifier = new BrowserCompatHostnameVerifier();

        // Create a registry of custom connection socket factories for supported
        // protocol schemes.
        Registry<ConnectionSocketFactory> socketFactoryRegistry = RegistryBuilder.<ConnectionSocketFactory>create()
                .register("http", PlainConnectionSocketFactory.INSTANCE)
                .register("https", new SSLConnectionSocketFactory(sslcontext, hostnameVerifier))
                .build();

        // Use custom DNS resolver to override the system DNS resolution.
        DnsResolver dnsResolver = new SystemDefaultDnsResolver() {

            @Override
            public InetAddress[] resolve(final String host) throws UnknownHostException {
                if (host.equalsIgnoreCase("myhost")) {
                    return new InetAddress[] { InetAddress.getByAddress(new byte[] {127, 0, 0, 1}) };
                } else {
                    return super.resolve(host);
                }
            }

        };

        // Create a connection manager with custom configuration.
        PoolingHttpClientConnectionManager connManager = new PoolingHttpClientConnectionManager(
                socketFactoryRegistry, connFactory, dnsResolver);

        // Create socket configuration
        SocketConfig socketConfig = SocketConfig.custom()
                .setTcpNoDelay(true)
                .build();
        // Configure the connection manager to use socket configuration either
        // by default or for a specific host.
        connManager.setDefaultSocketConfig(socketConfig);



        // Create message constraints
        MessageConstraints messageConstraints = MessageConstraints.custom()
                .setMaxHeaderCount(200)
                .setMaxLineLength(2000)
                .build();
        // Create connection configuration
        ConnectionConfig connectionConfig = ConnectionConfig.custom()
                .setMalformedInputAction(CodingErrorAction.IGNORE)
                .setUnmappableInputAction(CodingErrorAction.IGNORE)
                .setCharset(Consts.UTF_8)
                .setMessageConstraints(messageConstraints)
                .build();
        // Configure the connection manager to use connection configuration either
        // by default or for a specific host.
        connManager.setDefaultConnectionConfig(connectionConfig);


        // Configure total max or per route limits for persistent connections
        // that can be kept in the pool or leased by the connection manager.
        connManager.setMaxTotal(100);
        connManager.setDefaultMaxPerRoute(10);


        // Use custom cookie store if necessary.
        CookieStore cookieStore = new BasicCookieStore();
        // Use custom credentials provider if necessary.
        CredentialsProvider credentialsProvider = new BasicCredentialsProvider();
        // Create global request configuration
        RequestConfig defaultRequestConfig = RequestConfig.custom()
                .setCookieSpec(CookieSpecs.BEST_MATCH)
                .setExpectContinueEnabled(true)
                .setStaleConnectionCheckEnabled(true)
                .setTargetPreferredAuthSchemes(Arrays.asList(AuthSchemes.NTLM, AuthSchemes.DIGEST))
                .setProxyPreferredAuthSchemes(Arrays.asList(AuthSchemes.BASIC))
                .setSocketTimeout(so_timeout)
                .setConnectTimeout(conn_timeout)
                .build();

        // Create an HttpClient with the given custom dependencies and configuration.
        CloseableHttpClient httpclient = HttpClients.custom()
                .setConnectionManager(connManager)
                .setDefaultCookieStore(cookieStore)
                .setDefaultCredentialsProvider(credentialsProvider)
                .setDefaultRequestConfig(defaultRequestConfig)
                .build();

        this.client = httpclient;
		if(log.isDebugEnabled()){
			log.debug("http client set params[conn_timeout:" + conn_timeout + ",so_timeout:" + so_timeout + "]");
		}
	}
	
	/**
	 * http get 方式获取指定url的响应内容
	 * @param url 要获取内容的url地址
	 * @param encode url中参数的编码
	 * @return string  如果发生异常返回null
	 */
	public String get(String url, String encode){
		
		return get(url, null, encode);
	}
	/**
	 * http get 方式获取指定url的响应内容,并传送相应参数
	 * @param url 要获取内容的url地址
	 * @param params 要传递的参数
	 * @param encode url中参数的编码
	 * @return 如果发生异常返回null
	 */
	public String get(String url, Map<String,String> params, String encode){
		if(url == null || "".equals(url.trim())){
			return null;
		}
		
		if(params != null && params.size() != 0){
			Iterator<String> keys = params.keySet().iterator();
			List<NameValuePair> _params = new ArrayList<NameValuePair>();
			while(keys.hasNext()){
				String key = keys.next();
				_params.add(new BasicNameValuePair(key, params.get(key)));
			}
			url += "?"+URLEncodedUtils.format(_params, encode);
			
		}
		
		HttpGet httpGet = new HttpGet(url);

        httpGet.setHeader("X-SW-Client-IPAUTH","10.1.60.88");
		
		if(log.isDebugEnabled()){
			log.debug("http client excute query["+httpGet.getURI()+"] start!");
		}
		
		String response_str = null;
		
		try {
			HttpResponse response = client.execute(httpGet, new BasicHttpContext());
			
			HttpEntity entity = response.getEntity();
			
			
			
			if(entity != null){
				
				response_str = EntityUtils.toString(entity, default_response_encode);
			}
			
			EntityUtils.consume(entity);
			
			
		} catch (Exception e) {

			log.error("get response[" + httpGet.getURI() + "] failed", e);
			httpGet.abort();
		} finally {
			httpGet.releaseConnection();
		}
		
		return response_str;
		
	}

    /**
     *
     * @param url
     * @param content
     * @param encode
     * @return
     */
    public String post(String url, String content, String encode){
        if(url == null || "".equals(url.trim())){
            return null;
        }

        HttpPost httpPost = new HttpPost(url);

        if(content != null){


            try {
                httpPost.setEntity(new StringEntity(content,encode));
            } catch (Exception e) {

                log.warn("post content encode["+encode+"] not supported!", e);
                return null;
            }
        }


        if(log.isDebugEnabled()){
            log.debug("http client excute query["+httpPost.getURI()+"] start!");
        }

        String response_str = null;

        try {
            HttpResponse response = client.execute(httpPost, new BasicHttpContext());

            HttpEntity entity = response.getEntity();



            if(entity != null){

                response_str = EntityUtils.toString(entity, default_response_encode);
            }

            EntityUtils.consume(entity);


        } catch (Exception e) {

            log.error("get response[" + httpPost.getURI() + "] failed", e);
            httpPost.abort();
        } finally {
            httpPost.releaseConnection();
        }

        return response_str;
    }
	/**
	 * http post 方式获取指定url的响应内容,并传送相应参数
	 * @param url 要获取内容的url地址
	 * @param params 要传递的参数
	 * @param encode 传输参数的编码
	 * @return 如果发生异常返回null
	 */
	public String post(String url, Map<String,String> params, String encode){
		if(url == null || "".equals(url.trim())){
			return null;
		}
		
		HttpPost httpPost = new HttpPost(url);
		
		if(params != null && params.size() != 0){
			Iterator<String> keys = params.keySet().iterator();
			List<NameValuePair> _params = new ArrayList<NameValuePair>();
			while(keys.hasNext()){
				String key = keys.next();
				_params.add(new BasicNameValuePair(key, params.get(key)));
			}
			
			try {
				httpPost.setEntity(new UrlEncodedFormEntity(_params, encode));
			} catch (Exception e) {

				log.warn("post content encode["+encode+"] not supported!", e);
				return null;
			}
		}
		
		
		if(log.isDebugEnabled()){
			log.debug("http client excute query["+httpPost.getURI()+"] start!");
		}
		
		String response_str = null;
		
		try {
			HttpResponse response = client.execute(httpPost, new BasicHttpContext());
			
			HttpEntity entity = response.getEntity();
			
			
			
			if(entity != null){
				
				response_str = EntityUtils.toString(entity, default_response_encode);
			}
			
			EntityUtils.consume(entity);
			
			
		} catch (Exception e) {

			log.error("get response[" + httpPost.getURI() + "] failed", e);
			httpPost.abort();
		} finally {
			httpPost.releaseConnection();
		}
		
		return response_str;
	}
	
	
	/**
	 * 获得连接超时配置时间（ms）
	 * @return
	 */
	public int getConn_timeout() {
		return conn_timeout;
	}	
	/**
	 * 设置连接超时时间（ms）
	 * @param conn_timeout
	 */
	public void setConn_timeout(int conn_timeout) {
		this.conn_timeout = conn_timeout;
	}
	/**
	 * 获得传输超时时间配置（ms）
	 * @return
	 */
	public int getSo_timeout() {
		return so_timeout;
	}
	/**
	 * 设置连接超时时间（ms）
	 * @param so_timeout
	 */
	public void setSo_timeout(int so_timeout) {
		this.so_timeout = so_timeout;
	}
	/**
	 * 获得默认响应内容编码
	 * @return
	 */
	public String getDefault_response_encode() {
		return default_response_encode;
	}
	/**
	 * 设置默认响应内容编码
	 * @param default_response_encode
	 */
	public void setDefault_response_encode(String default_response_encode) {
		this.default_response_encode = default_response_encode;
	}



}
