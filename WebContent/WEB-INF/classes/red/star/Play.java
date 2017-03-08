package red.star;
import java.io.*; 
public class Play {
   int imageNumber=0,max;
   String pictureName[],playImage;
   String webDir="";        //web����Ŀ¼������
   String tomcatDir;        //tomcat�İ�װĿ¼
   public Play() {
      File f= new File(""); //���ļ���Ϊ��Tomcat����������Ŀ¼�У���binĿ¼��
      String path = f.getAbsolutePath();
      int index = path.indexOf("bin");
      tomcatDir = path.substring(0,index); 
     
  }
  public void setWebDir(String s) {
     webDir =s;
     if(pictureName==null) {
       File dirImage=new File(tomcatDir+"/webapps/"+webDir+"/image"); 
       pictureName=dirImage.list();
     }
     if(pictureName!=null)
        max=pictureName.length;
  }
  public void setImageNumber(int n){
      if(n<0)
        n=max-1;
      if(n==max)
        n=0; 
      imageNumber=n;
   }
   public int getImageNumber() {
      return imageNumber;
   }
   public String getPlayImage() {
      if(pictureName!=null)
        playImage=pictureName[imageNumber]; 
      return playImage; 
   } 
}
