package ccit.byc.tamall.admain;
public class Product {
	private String  bid;
	private String  bname;
	private String  ptitle;
	private double  originalPrice;
	private double promotionPrice;
	private int xiaoliang;
	private int  pinglun;
    private Category category;
    private String smallimg;
    private String bigimg;
	@Override
	public String toString() {
		return "Product [bid=" + bid + ", bname=" + bname + ", ptitle=" + ptitle + ", originalPrice=" + originalPrice
				+ ", promotionPrice=" + promotionPrice + ", xiaoliang=" + xiaoliang + ", pinglun=" + pinglun
				+ ", category=" + category + ", smallimg=" + smallimg + ", bigimg=" + bigimg + "]";
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public double getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(double originalPrice) {
		this.originalPrice = originalPrice;
	}
	public double getPromotionPrice() {
		return promotionPrice;
	}
	public void setPromotionPrice(double promotionPrice) {
		this.promotionPrice = promotionPrice;
	}
	public int getXiaoliang() {
		return xiaoliang;
	}
	public void setXiaoliang(int xiaoliang) {
		this.xiaoliang = xiaoliang;
	}
	public int getPinglun() {
		return pinglun;
	}
	public void setPinglun(int pinglun) {
		this.pinglun = pinglun;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getSmallimg() {
		return smallimg;
	}
	public void setSmallimg(String smallimg) {
		this.smallimg = smallimg;
	}
	public String getBigimg() {
		return bigimg;
	}
	public void setBigimg(String bigimg) {
		this.bigimg = bigimg;
	}
	

}
