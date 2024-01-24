<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty addSuccess }">
<div id="toast">${addSuccess}</div>
<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
<c:remove var="addSuccess" scope="session"/>
</c:if>

<div class="container-fluid text-center text-white p-3 mt-2" style="background-color:#303f9f;">
<h5>Developed By Prashant Morade</h5>
</div>