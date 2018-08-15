package com.thinkgem.javamg.common.utils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.codehaus.jackson.map.ObjectMapper;

/**
 * @name HttpJSONUtil.java
 *
 * @author PXL
 *
 * @date  2016-7-12 22:55:45
 *
 */
public class HttpJSONUtil {

	/**
	 * Http-Post请求发送Json并接收返回值
	 * jsonObject程序自动序列化
	 * @param encode -字符编码
	 * @param jsonObject-传递信息Object
	 * @param urlPath-服务端地址接口
	 * @return
	 */
	public static String sendPostMessage(String urlPath,String encode, Object jsonObject) {
		ObjectMapper om = new ObjectMapper();
		OutputStream outputStream = null;
		InputStream inputStream = null;
		try {
			URL url = new URL(urlPath);
			HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
			httpURLConnection.setConnectTimeout(3000);//HTTP请求连接时间
			httpURLConnection.setDoInput(true);// 从服务器获取数据
			httpURLConnection.setDoOutput(true);// 向服务器写入数据
			String jsonSendStr = om.writeValueAsString(jsonObject);
			// 获得上传信息的字节大小及长度
			byte[] mydata = jsonSendStr.getBytes();
			// 设置请求体的类型
			httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			httpURLConnection.setRequestProperty("Content-Lenth", String.valueOf(mydata.length));

			// 获得输出流，向服务器输出数据
			outputStream = (OutputStream) httpURLConnection.getOutputStream();
			outputStream.write(mydata);

			// 获得服务器响应的结果和状态码
			int responseCode = httpURLConnection.getResponseCode();
			if (responseCode == 200) {
				// 获得输入流，从服务器端获得数据
				inputStream = (InputStream) httpURLConnection.getInputStream();
				return (changeInputStream(inputStream, encode));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * 流信息转换为字符串
	 * 
	 * @param inputStream
	 *            -字符输入流
	 * @param encode
	 *            -字符编码
	 * @return
	 */
	public static String changeInputStream(InputStream inputStream, String encode) {
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		byte[] data = new byte[1024];
		int len = 0;
		String result = "";
		if (inputStream != null) {
			try {
				while ((len = inputStream.read(data)) != -1) {
					byteArrayOutputStream.write(data, 0, len);
				}
				result = new String(byteArrayOutputStream.toByteArray(), encode);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	/**
	 * 使用 GetMethod 来访问一个 URL请求,
	 * 实现步骤: 
	 * 1:生成一个 HttpClinet 对象并设置相应的参数。
	 * 2:生成一个 GetMethod 对象并设置响应的参数。
	 * 3:用 HttpClinet 生成的对象来执行 GetMethod 生成的Get方法。 
	 * 4:处理响应状态码。 
	 * 5:若响应正常，处理 HTTP 响应内容。 
	 * 6:释放连接
	 * @param url
	 * @param charset
	 * @return
	 * @throws Exception
	 */
	public static String sendGetMessage(String url, String charset) throws Exception {
		/* 1 生成 HttpClinet 对象并设置参数 */
		HttpClient httpClient = new HttpClient();
		// 设置 Http 连接超时为5秒
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(5000);
		/* 2 生成 GetMethod 对象并设置参数 */
		GetMethod getMethod = new GetMethod(url);
		// 设置 get 请求超时为 5 秒
		getMethod.getParams().setParameter(HttpMethodParams.SO_TIMEOUT, 5000);
		// 设置请求重试处理，用的是默认的重试处理：请求三次
		getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler());
		String resultStr = "";
		/* 3 执行 HTTP GET 请求 */
		try {
			int statusCode = httpClient.executeMethod(getMethod);
			/* 4 判断访问的状态码 */
			if (statusCode != HttpStatus.SC_OK) {
				resultStr = "请求出错: " + getMethod.getStatusLine();
			}else{
				/* 5 处理 HTTP 响应内容 */
				byte[] responseBody = getMethod.getResponseBody();// 读取为字节数组
				resultStr = new String(responseBody, charset);
				// 读取为 InputStream，在响应内容数据量大时候推荐使用
				//InputStream inputStream = getMethod.getResponseBodyAsStream();
				//resultStr = changeInputStream(inputStream,charset);
			}
		} catch (HttpException e) {
			//致命的异常，可能是协议不对或者返回的内容有问题
			e.printStackTrace();
		} catch (IOException e) {
			// 发生网络异常
			e.printStackTrace();
		} finally {
			/* 6 .释放连接 */
			getMethod.releaseConnection();
		}
		return resultStr;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String PATH = "http://127.0.0.1:8080/test/sendHttpPostJson.do";
		Map<String, String> params = new HashMap<String, String>();
		params.put("username", "admin");
		params.put("password", "123");
		String result = sendPostMessage(PATH,"utf-8", params);
		System.out.println("-result->>" + result);

	}
	
	/**
	 * 测试HTTP请求的服务
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	/*@RequestMapping(value = "/sendHttpPostJson")
	@ResponseBody
	public String sendHttpPostJson(HttpServletRequest request,HttpServletResponse response) throws IOException{
		InputStream inputStream =	request.getInputStream();
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		byte[] data = new byte[1024];
		int len = request.getContentLength();
		String result = "";
		if (inputStream != null) {
			try {
				while ((len = inputStream.read(data)) != -1) {
					byteArrayOutputStream.write(data, 0, len);
				}
				result = new String(byteArrayOutputStream.toByteArray(), "utf-8");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println(result);
		StringBuffer buffer = new StringBuffer("{");
		buffer.append("msg:'你好，HttpPost请求成功'");
		return buffer.append("}").toString();
		
	}*/
}
