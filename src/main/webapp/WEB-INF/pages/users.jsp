<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>

<html>
<head>
	<meta charset="utf-8">
	<title>Spring MVC Application</title>

	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link href="<c:url value="/resource/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resource/css/style.css" />" rel="stylesheet">
</head>

<body>
<div class="container">
	<div class="row"  style="padding-top: 40px">
		<div class="col-md-3 col-md-push-9"  id="user-name"></div>
		<div class="col-md-9 col-md-pull-3"></div>
	</div>
	<div class="row">
		<h3 class="text-center">Simple chat </h3>
		<div class="col-md-8">
			<div class="panel panel-info">
				<div class="panel-heading">RECENT CHAT HISTORY</div>
			</div>
			</div>
		<div class="col-md-4">
			<div class="panel panel-primary">
				<div class="panel-heading">ONLINE USERS</div>
				<div class="panel-body">
					<ul class="media-list" id="user-list">
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Log in</h4>
			</div> <!-- /.modal-header -->

			<div class="modal-body">
				<form role="form">
					<div class="form-group">
							<input type="text" class="form-control" id="uEmail" placeholder="Email">
					</div> <!-- /.form-group -->
					<div class="form-group">
							<input type="text" class="form-control" id="uFirstName" placeholder="firstName">
					</div> <!-- /.form-group -->
					<div class="form-group">
						<input type="text" class="form-control" id="uLastName" placeholder="lastName">
					</div> <!-- /.form-group -->
				</form>

			</div> <!-- /.modal-body -->

			<div class="modal-footer">
				<button class="form-control btn btn-primary js-login">Ok</button>
			</div> <!-- /.modal-footer -->

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
	</div>
<script src="<c:url value="/resource/js/jquery-1.11.2.min.js" />"></script>
<script src="<c:url value="/resource/js/bootstrap.min.js" />"></script>
<script>
	$( document ).ready(function() {
			$('#myModal').modal({
						backdrop: "static"
					},
					"show");
		function showListUser () {
			$.ajax({
				type: "GET",
				url: '/api/users',             // указываем URL и
				dataType : "json",                     // тип загружаемых данных
				success: function (data, textStatus) { // вешаем свой обработчик на функцию success
					$.each(data, function(i, val) {    // обрабатываем полученные данные
						$("#user-list").append(
						"<li class='media'><div class='media-body'><div class='media'><a class='pull-left' href='#'>" +
						"<img class='media-object img-circle' style='max-height:40px' src='<c:url value='/resource/img/user.png' />'>" +
						"</a>" +
						"<div class='media-body'>" +
						"<h5>" + val.firstName + " " + val.lastName + "</h5>" +
						"</div>" +
						"</div>" +
						"</div>" +
						"</li>"
						);
					});
				}
			});

		}
		function showChat (data) {
			$("#user-name").html("<h4>" + "Hi, " + data.firstName + " " + data.lastName + "</h4>");
			showListUser();
		}
			$(".js-login").on("click", function (e) {
				e.preventDefault();
				var inputs = $('form input');
				var data = {
					email: $(inputs[0]).val(),
					firstName: $(inputs[1]).val(),
					lastName: $(inputs[2]).val()
				};
				// Send the data using post
				$.ajax({
					url: "/add",
					type: "POST",
					data: data,
					statusCode: {
						200: function (responce){
							$('#myModal').modal("hide");
							showChat(JSON.parse(responce));
						}
					}
			});
				// Put the results in a div

			});
	});
</script>

</body>
</html>