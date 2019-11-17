package ccit.byc.tamall.admain;

public class OrderItem {
	private String orderItemId;//主键
	private int quantity;//数量
	private double subtotal;//小计
	private Product product;//所关联的product
	@Override
	public String toString() {
		return "OrderItem [orderItemId=" + orderItemId + ", quantity=" + quantity + ", subtotal=" + subtotal
				+ ", product=" + product + ", order=" + order + "]";
	}
	public String getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(String orderItemId) {
		this.orderItemId = orderItemId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	private Order order;//所属的订单
	
}
