
public class TestOut {
 private int n;
 private String str;
 private float realnumber;
 
 public TestOut() {
 }
 
 public TestOut(String str, float realnumber) {
	 this.str = str;
	 this.realnumber = realnumber;
	 this.n = (int)this.realnumber;
 }
 
 
 
public int getN() {
	return n;
}
public void setN(int n) {
	this.n = n;
}
public String getStr() {
	return str;
}
public void setStr(String str) {
	this.str = str;
}
public float getRealnumber() {
	return realnumber;
}
public void setRealnumber(float realnumber) {
	this.realnumber = realnumber;
}
 
}
