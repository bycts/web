<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
div.each span {
	margin-right: 10px;
}

div.each {
	height: 47px;
	line-height: 30px;
	padding-left: 10px;
	font-size: 18px;
}

.gly {
	text-decoration: none;
}

.each:hover {
	
}
</style>
<body>
	<c:forEach items="${parents}" var="parent">
		<div class="each" cid="${parent.cid}">
			<span class="glyphicon glyphicon-link"></span> <a class="gly"
				href="/Tianmall/ProductServlet?method=findByCategory&cid=${parent.cid}"
				target="_top"> ${parent.cname} </a>
		</div>
	</c:forEach>

</body>