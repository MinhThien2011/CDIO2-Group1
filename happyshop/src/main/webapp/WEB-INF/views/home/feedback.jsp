<%@ page pageEncoding="utf-8" %>


	<div class="container-fluid" style="padding: 0px 80px 0px 80px">
		<h3 class="title">
			<b>GỬI THÔNG TIN PHẢN HỒI</b>
		</h3>
		<div class="ct1">
			<div class="row">
				<br>
				<div class="dang-nhap">
					<form id="fb" class="form-horizontal" action="addFeedBack.htm" method="post">
						<div class="control-group">
							<label class="control-label" for="inputCountry">Họ và tên
								<span style="color: red;">(*)</span>
							</label>
							<div class="controls">
								<input id="name" name="name" style="width: 100%;" placeholder="Họ và tên" type="text"
									class="form-control" value=""><br>

							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputPost">Số điện thoại
								<span style="color: red;">(*)</span>
							</label>
							<div class="controls">
								<input id="phone" name="phone" style="width: 100%;" placeholder="Số điện thoại"
									type="text" class="form-control" value=""><br>

							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="inputCountry">Email <span style="color: red;">(*)</span>
							</label>
							<div class="controls">
								<input id="email" name="email" style="width: 100%;" placeholder="Email" type="text"
									class="form-control" value=""><br>

							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="inputPost">Nội dung <span style="color: red;">(*)</span>
							</label>
							<div class="controls">
								<textarea id="content" name="content" style="width: 100%;" placeholder="Nội dung"
									type="text" class="form-control" rows="6"></textarea>
								<br>

							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="inputCountry">Ngày gửi phản hồi </label>
							<div class="controls">
								<input id="today" name="createDate" style="width: 100%;" type="date"
									class="form-control" readonly="readonly" value="">
							</div>
						</div>

						<script>
							document.addEventListener("DOMContentLoaded", function () {
								var today = new Date();
								var dd = String(today.getDate()).padStart(2, '0');
								var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
								var yyyy = today.getFullYear();

								today = yyyy + '-' + mm + '-' + dd;
								document.getElementById('today').value = today;
							});
						</script>

						<div class="control-group" hidden="">
							<label class="control-label" for="inputPost">Trạng thái </label>
							<div class="controls">
								<input id="status1" name="status" type="radio" value="false">
								Kích hoạt &nbsp;&nbsp; <input id="status2" name="status" checked="true" type="radio"
									value="true"> Khóa

							</div>
						</div>
						<br />
						<div class="control-group">
							<div class="controls text-center">
								<button id="feedback-btn" type="submit" class="btn btn-success">Gửi phản hồi</button>
							</div>
						</div>
						<script>
							document.addEventListener("DOMContentLoaded", function () {
								const submitButton = document.getElementById('feedback-btn');
								submitButton.addEventListener('click', function (e) {
									e.preventDefault(); // Prevent the default form submission

									var form = {
										id: $("#name").val(),
										to:"happyshopsuport2024@gmail.com" ,
										body: $("#content").val(),
										from: $("#email").val()
									};

									$.ajax({
										url: "/feedback/cark",
										// data: form,
										type: 'POST',
										//contentType: 'application/json',
										//dataType: 'json',
										data: form,
										success: function (response) {
											console.log(response)
											if (response === "true") {
												alert("Đã gửi thành công");
											} else {
												alert("Lỗi gửi mail");
											}
										},
										error: function () {
											alert("Đã xảy ra lỗi trong quá trình gửi phản hồi");
										}
									});
								});
							});
						</script>

						<br />
					</form>
				</div>
			</div>
		</div>
	</div>

	<hr class="soft">

	<style>
		.dang-nhap {
			background-color: white;
			padding: 30px 120px;
			margin: 0 auto;
			width: 60%;
			margin-bottom: 25px;
		}
	</style>