<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="play" class="red.star.Play" scope="session" />
 <%
    String webDir = request.getContextPath();//��ȡ��ǰWeb����Ŀ¼������
    webDir = webDir.substring(1); //ȥ������ǰ���Ŀ¼���ţ�/
 %>
    <jsp:setProperty  name="play" property="webDir" value="<%= webDir %>"/> 
    <jsp:setProperty  name="play" property="imageNumber" param="imageNumber"/>
<HTML><body bgcolor=cyan><font size=2>
    <image src = image/<jsp:getProperty  name="play" property="playImage"/>
     width =120 height =90><br>���ǵ�ǰ��ʾ��ͼ��</image> 
    <br>����"��һ��"��"��һ��"��ť���ͼ��
    <form action="" method=post>
      <input type=submit name="ok" value="��һ��">
      <input type="hidden" name="imageNumber" value="<%=play.getImageNumber()-1%>">
    </form>
    <form action="" method=post>
      <input type=submit name="ok" value="��һ��">
      <input type="hidden" name="imageNumber" value="<%=play.getImageNumber()+1 %>">
    </form>
</font></body></HTML>
