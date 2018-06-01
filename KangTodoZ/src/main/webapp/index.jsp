<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>BizPage Bootstrap Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.labellogin {
	padding-top: 6px;
}

#hoho1 {
	margin-top: 100px;
}

#hoho2 {
	padding-top: 10px;
}

.keke {
	height: 400px;
}

.keke2 {
	background-color: #E8D9FF;
	border: 1px solid #8041D9;
	color: #747474;
	width: 100px;
}

.keke4 {
	background-color: #E8D9FF;
	border: 1px solid #8041D9;
	color: #747474;
}

.keke5 {
	margin-top: 30px;
}

.keke6 {
	margin-top: 50px;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
</head>

<body>

	<!--==========================
    Header
  ============================-->
	<header id="header">
		<div class="container-fluid">

			<div id="logo" class="pull-left">
				<h1>
					<a href="#intro" class="scrollto">투두래요</a>
				</h1>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
			</div>

			<jsp:include page="/WEB-INF/module/nav.jsp"></jsp:include>

		</div>
	</header>
	<!-- #header -->

	<!--==========================
    Intro Section
  ============================-->

	<section id="intro">
		<div class="intro-container">
			<div id="introCarousel" class="carousel  slide carousel-fade"
				data-ride="carousel">

				<ol class="carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">

					<div class="carousel-item active">
						<div class="carousel-background">
							<img src="img/intro-carousel/1.gif" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>We are professional</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua. Ut enim ad minim veniam, quis nostrud exercitation
									ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
								<a href="#featured-services" class="btn-get-started scrollto">Get
									Started</a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/2.gif" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>At vero eos et accusamus</h2>
								<p>Nam libero tempore, cum soluta nobis est eligendi optio
									cumque nihil impedit quo minus id quod maxime placeat facere
									possimus, omnis voluptas assumenda est, omnis dolor
									repellendus. Temporibus autem quibusdam et aut officiis debitis
									aut.</p>
								<a href="#featured-services" class="btn-get-started scrollto">Get
									Started</a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/3.gif" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>Temporibus autem quibusdam</h2>
								<p>Beatae vitae dicta sunt explicabo. Nemo enim ipsam
									voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed
									quia consequuntur magni dolores eos qui ratione voluptatem
									sequi nesciunt omnis iste natus error sit voluptatem
									accusantium.</p>
								<a href="#featured-services" class="btn-get-started scrollto">Get
									Started</a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/4.gif" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>Nam libero tempore</h2>
								<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
									sit amet, consectetur, adipisci velit, sed quia non numquam
									eius modi tempora incidunt ut labore et dolore magnam aliquam
									quaerat voluptatem. Ut enim ad minima veniam, quis nostrum.</p>
								<a href="#featured-services" class="btn-get-started scrollto">Get
									Started</a>
							</div>
						</div>
					</div>

					<div class="carousel-item">
						<div class="carousel-background">
							<img src="img/intro-carousel/5.jpg" alt="">
						</div>
						<div class="carousel-container">
							<div class="carousel-content">
								<h2>Magnam aliquam quaerat</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua. Ut enim ad minim veniam, quis nostrud exercitation
									ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
								<a href="#featured-services" class="btn-get-started scrollto">Get
									Started</a>
							</div>
						</div>
					</div>

				</div>

				<a class="carousel-control-prev" href="#introCarousel" role="button"
					data-slide="prev"> <span
					class="carousel-control-prev-icon ion-chevron-left"
					aria-hidden="true"></span> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#introCarousel"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon ion-chevron-right"
					aria-hidden="true"></span> <span class="sr-only">Next</span>
				</a>

			</div>
		</div>
	</section>
	<!-- #intro -->

	<main id="main"> <!--==========================
      Featured Services Section
    ============================--> <!--==========================
      About Us Section
    ============================-->
	<section id="about">
		<div class="container">

			<header class="section-header">
				<h3 id="hoho1">로그인</h3>
				<p id="hoho2">투두의 기능을 사용하기 위해선 로그인이 필요합니다</p>
			</header>

			<div class="row about-cols">

				<div class="col-md-4 wow fadeInUp"></div>

				<div class="col-md-4 wow fadeInUp keke" data-wow-delay="0.1s">
					<form class="form-horizontal" action="login.do" method="post">
						<div class="form-group row">

							<label for="inputEmail3"
								class="col-sm-3 control-label labellogin"><strong>아이디</strong></label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="inputEmail3"
									placeholder="아이디" name="id">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword3"
								class="col-sm-3 control-label labellogin"><strong>패스워드</strong></label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="inputPassword3"
									placeholder="패스워드" name="password">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3"></div>
							<div class="col-sm-9">
								<div class="checkbox">
									<label> <input type="checkbox"> Remember me
									</label>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3"></div>
							<div class="col-sm-6">
								<button type="submit" class="btn btn-default btn-block keke2">로그인</button>
							</div>
						</div>
					</form>

				</div>

				<div class="col-md-4 wow fadeInUp" data-wow-delay="0.2s"></div>

			</div>

		</div>
	</section>
	<!-- #about --> <!--==========================
      Services Section
    ============================-->
	<section id="services">
		<div class="container">

			<header class="section-header wow fadeInUp keke6">
				<h3>회원가입</h3>
				<!-- 	<p></p> -->
			</header>

			<div class="row">

				<div class="col-md-3 box wow bounceInUp" data-wow-duration="1.4s">

				</div>

				<div class="col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
					<form method="post" action="register.do">
						<div class="form-group row">
							<label for="id" class="control-label col-md-3 text-center"><strong>아이디</strong></label>
							<div class="col-md-9">
								<input class="form-control" type="text" id="id" name="id">
							</div>
						</div>

						<div class="form-group row">
							<label for="password" class="control-label col-md-3 text-center"><strong>비밀번호</strong></label>
							<div class="col-md-9">
								<input class="form-control" type="password" id="password"
									name="password">
							</div>
						</div>

						<div class="form-group row">
							<label for="password2" class="control-label col-md-3 text-center"><strong>비밀번호
									확인</strong></label>
							<div class="col-md-9">
								<input class="form-control" type="password" id="password2"
									name="password2">
							</div>
						</div>

						<div class="form-group row">
							<label for="name" class="control-label col-md-3 text-center"><strong>이름</strong></label>
							<div class="col-md-9">
								<input class="form-control" type="text" id="name" name="name">
							</div>
						</div>
						<div class="form-group row">
							<label for="email1" class="control-label col-md-3 text-center"><strong>이메일</strong></label>
							<div class="col-md-4" style="padding-right: 0px">
								<input class="form-control" type="text" id="email1"
									name="email1">
							</div>
							<label class="col-md-1 text-center"
								style="padding-left: 0px; padding-right: 0px">@</label>
							<div class="col-md-4 " style="padding-left: 0px">
								<select class="form-control" name="email2">
									<option>naver.com</option>
									<option>google.com</option>
									<option>babo.com</option>
									<option>gogo.go</option>
									<option>keke.ke</option>
								</select>
							</div>
						</div>
						<div>
							<div class="form-group row">
								<label for="addr1" class="control-label col-md-3 text-center"><strong>주소</strong></label>

								<div class="col-md-4" style="padding-right: 0px">


									<input type="text" class="form-control col-xs-3"
										id="sample6_postcode" name="addr1" placeholder="우편번호" readonly>
								</div>
								<div class="col-md-5">
									<input type="button" class="col-xs-2 btn keke4"
										onclick="sample6_execDaumPostcode()" value="우편번호 찾기">

								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-3"></div>
								<div class="col-md-4 keke3">
									<input type="text" class="form-control" id="sample6_address"
										name="addr2" placeholder="주소">
								</div>
								<div class="col-md-5">
									<input type="text" class="form-control" id="sample6_address2"
										name="addr3" placeholder="상세주소">
								</div>
							</div>

						</div>
						<hr>
						<div class="form-group row keke5">
							<div class="col-md-4"></div>
							<div class="col-md-8 ">
								<input class=" btn btn-default keke2" type="submit" value="버튼이삼">
								<input class=" btn btn-default keke2" type="reset" value="리세이삼">
							</div>
						</div>
					</form>

				</div>
				<div class="col-md-3 box wow bounceInUp" data-wow-duration="1.4s">

				</div>

			</div>

		</div>
	</section>
	<!-- #services --> <!--==========================
      Call To Action Section
    ============================-->
	<section id="call-to-action" class="wow fadeIn">
		<div class="container text-center">
			<h3>Call To Action</h3>
			<p>Duis aute irure dolor in reprehenderit in voluptate velit esse
				cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
				cupidatat non proident, sunt in culpa qui officia deserunt mollit
				anim id est laborum.</p>
			<a class="cta-btn" href="#">Call To Action</a>
		</div>
	</section>
	<!-- #call-to-action --> <!--==========================
      Skills Section
    ============================-->
	<section id="skills">
		<div class="container">

			<header class="section-header">
				<h3>Our Skills</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
					enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip</p>
			</header>

			<div class="skills-content">

				<div class="progress">
					<div class="progress-bar bg-success" role="progressbar"
						aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
						<span class="skill">HTML <i class="val">100%</i></span>
					</div>
				</div>

				<div class="progress">
					<div class="progress-bar bg-info" role="progressbar"
						aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
						<span class="skill">CSS <i class="val">90%</i></span>
					</div>
				</div>

				<div class="progress">
					<div class="progress-bar bg-warning" role="progressbar"
						aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
						<span class="skill">JavaScript <i class="val">75%</i></span>
					</div>
				</div>

				<div class="progress">
					<div class="progress-bar bg-danger" role="progressbar"
						aria-valuenow="55" aria-valuemin="0" aria-valuemax="100">
						<span class="skill">Photoshop <i class="val">55%</i></span>
					</div>
				</div>

			</div>

		</div>
	</section>

	<!--==========================
      Facts Section
    ============================-->
	<section id="facts" class="wow fadeIn">
		<div class="container">

			<header class="section-header">
				<h3>Facts</h3>
				<p>Sed ut perspiciatis unde omnis iste natus error sit
					voluptatem accusantium doloremque</p>
			</header>

			<div class="row counters">

				<div class="col-lg-3 col-6 text-center">
					<span data-toggle="counter-up">274</span>
					<p>Clients</p>
				</div>

				<div class="col-lg-3 col-6 text-center">
					<span data-toggle="counter-up">421</span>
					<p>Projects</p>
				</div>

				<div class="col-lg-3 col-6 text-center">
					<span data-toggle="counter-up">1,364</span>
					<p>Hours Of Support</p>
				</div>

				<div class="col-lg-3 col-6 text-center">
					<span data-toggle="counter-up">18</span>
					<p>Hard Workers</p>
				</div>

			</div>

			<div class="facts-img">
				<img src="img/facts-img.png" alt="" class="img-fluid">
			</div>

		</div>
	</section>
	<!-- #facts --> <!--==========================
      Portfolio Section
    ============================-->
	<section id="portfolio" class="section-bg">
		<div class="container">

			<header class="section-header">
				<h3 class="section-title">Our Portfolio</h3>
			</header>

			<div class="row">
				<div class="col-lg-12">
					<ul id="portfolio-flters">
						<li data-filter="*" class="filter-active">All</li>
						<li data-filter=".filter-app">App</li>
						<li data-filter=".filter-card">Card</li>
						<li data-filter=".filter-web">Web</li>
					</ul>
				</div>
			</div>

			<div class="row portfolio-container">

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
					<div class="portfolio-wrap">
						<figure>
							<img src="img/portfolio/app1.jpg" class="img-fluid" alt="">
							<a href="img/portfolio/app1.jpg" data-lightbox="portfolio"
								data-title="App 1" class="link-preview" title="Preview"><i
								class="ion ion-eye"></i></a>
							<a href="#" class="link-details" title="More Details"><i
								class="ion ion-android-open"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="#">App 1</a>
							</h4>
							<p>App</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp"
					data-wow-delay="0.1s">
					<div class="portfolio-wrap">
						<figure>
							<img src="img/portfolio/web3.jpg" class="img-fluid" alt="">
							<a href="img/portfolio/web3.jpg" class="link-preview"
								data-lightbox="portfolio" data-title="Web 3" title="Preview"><i
								class="ion ion-eye"></i></a>
							<a href="#" class="link-details" title="More Details"><i
								class="ion ion-android-open"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="#">Web 3</a>
							</h4>
							<p>Web</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp"
					data-wow-delay="0.2s">
					<div class="portfolio-wrap">
						<figure>
							<img src="img/portfolio/app2.jpg" class="img-fluid" alt="">
							<a href="img/portfolio/app2.jpg" class="link-preview"
								data-lightbox="portfolio" data-title="App 2" title="Preview"><i
								class="ion ion-eye"></i></a>
							<a href="#" class="link-details" title="More Details"><i
								class="ion ion-android-open"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="#">App 2</a>
							</h4>
							<p>App</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp">
					<div class="portfolio-wrap">
						<figure>
							<img src="img/portfolio/card2.jpg" class="img-fluid" alt="">
							<a href="img/portfolio/card2.jpg" class="link-preview"
								data-lightbox="portfolio" data-title="Card 2" title="Preview"><i
								class="ion ion-eye"></i></a>
							<a href="#" class="link-details" title="More Details"><i
								class="ion ion-android-open"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="#">Card 2</a>
							</h4>
							<p>Card</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp"
					data-wow-delay="0.1s">
					<div class="portfolio-wrap">
						<figure>
							<img src="img/portfolio/web2.jpg" class="img-fluid" alt="">
							<a href="img/portfolio/web2.jpg" class="link-preview"
								data-lightbox="portfolio" data-title="Web 2" title="Preview"><i
								class="ion ion-eye"></i></a>
							<a href="#" class="link-details" title="More Details"><i
								class="ion ion-android-open"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="#">Web 2</a>
							</h4>
							<p>Web</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp"
					data-wow-delay="0.2s">
					<div class="portfolio-wrap">
						<figure>
							<img src="img/portfolio/app3.jpg" class="img-fluid" alt="">
							<a href="img/portfolio/app3.jpg" class="link-preview"
								data-lightbox="portfolio" data-title="App 3" title="Preview"><i
								class="ion ion-eye"></i></a>
							<a href="#" class="link-details" title="More Details"><i
								class="ion ion-android-open"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="#">App 3</a>
							</h4>
							<p>App</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp">
					<div class="portfolio-wrap">
						<figure>
							<img src="img/portfolio/card1.jpg" class="img-fluid" alt="">
							<a href="img/portfolio/card1.jpg" class="link-preview"
								data-lightbox="portfolio" data-title="Card 1" title="Preview"><i
								class="ion ion-eye"></i></a>
							<a href="#" class="link-details" title="More Details"><i
								class="ion ion-android-open"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="#">Card 1</a>
							</h4>
							<p>Card</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp"
					data-wow-delay="0.1s">
					<div class="portfolio-wrap">
						<figure>
							<img src="img/portfolio/card3.jpg" class="img-fluid" alt="">
							<a href="img/portfolio/card3.jpg" class="link-preview"
								data-lightbox="portfolio" data-title="Card 3" title="Preview"><i
								class="ion ion-eye"></i></a>
							<a href="#" class="link-details" title="More Details"><i
								class="ion ion-android-open"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="#">Card 3</a>
							</h4>
							<p>Card</p>
						</div>
					</div>
				</div>

				<div
					class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp"
					data-wow-delay="0.2s">
					<div class="portfolio-wrap">
						<figure>
							<img src="img/portfolio/web1.jpg" class="img-fluid" alt="">
							<a href="img/portfolio/web1.jpg" class="link-preview"
								data-lightbox="portfolio" data-title="Web 1" title="Preview"><i
								class="ion ion-eye"></i></a>
							<a href="#" class="link-details" title="More Details"><i
								class="ion ion-android-open"></i></a>
						</figure>

						<div class="portfolio-info">
							<h4>
								<a href="#">Web 1</a>
							</h4>
							<p>Web</p>
						</div>
					</div>
				</div>

			</div>

		</div>
	</section>
	<!-- #portfolio --> <!--==========================
      Clients Section
    ============================-->
	<section id="clients" class="wow fadeInUp">
		<div class="container">

			<header class="section-header">
				<h3>Our Clients</h3>
			</header>

			<div class="owl-carousel clients-carousel">
				<img src="img/clients/client-1.png" alt=""> <img
					src="img/clients/client-2.png" alt=""> <img
					src="img/clients/client-3.png" alt=""> <img
					src="img/clients/client-4.png" alt=""> <img
					src="img/clients/client-5.png" alt=""> <img
					src="img/clients/client-6.png" alt=""> <img
					src="img/clients/client-7.png" alt=""> <img
					src="img/clients/client-8.png" alt="">
			</div>

		</div>
	</section>
	<!-- #clients --> <!--==========================
      Clients Section
    ============================-->
	<section id="testimonials" class="section-bg wow fadeInUp">
		<div class="container">

			<header class="section-header">
				<h3>Testimonials</h3>
			</header>

			<div class="owl-carousel testimonials-carousel">

				<div class="testimonial-item">
					<img src="img/testimonial-1.jpg" class="testimonial-img" alt="">
					<h3>Saul Goodman</h3>
					<h4>Ceo &amp; Founder</h4>
					<p>
						<img src="img/quote-sign-left.png" class="quote-sign-left" alt="">
						Proin iaculis purus consequat sem cure digni ssim donec porttitora
						entum suscipit rhoncus. Accusantium quam, ultricies eget id,
						aliquam eget nibh et. Maecen aliquam, risus at semper. <img
							src="img/quote-sign-right.png" class="quote-sign-right" alt="">
					</p>
				</div>

				<div class="testimonial-item">
					<img src="img/testimonial-2.jpg" class="testimonial-img" alt="">
					<h3>Sara Wilsson</h3>
					<h4>Designer</h4>
					<p>
						<img src="img/quote-sign-left.png" class="quote-sign-left" alt="">
						Export tempor illum tamen malis malis eram quae irure esse labore
						quem cillum quid cillum eram malis quorum velit fore eram velit
						sunt aliqua noster fugiat irure amet legam anim culpa. <img
							src="img/quote-sign-right.png" class="quote-sign-right" alt="">
					</p>
				</div>

				<div class="testimonial-item">
					<img src="img/testimonial-3.jpg" class="testimonial-img" alt="">
					<h3>Jena Karlis</h3>
					<h4>Store Owner</h4>
					<p>
						<img src="img/quote-sign-left.png" class="quote-sign-left" alt="">
						Enim nisi quem export duis labore cillum quae magna enim sint
						quorum nulla quem veniam duis minim tempor labore quem eram duis
						noster aute amet eram fore quis sint minim. <img
							src="img/quote-sign-right.png" class="quote-sign-right" alt="">
					</p>
				</div>

				<div class="testimonial-item">
					<img src="img/testimonial-4.jpg" class="testimonial-img" alt="">
					<h3>Matt Brandon</h3>
					<h4>Freelancer</h4>
					<p>
						<img src="img/quote-sign-left.png" class="quote-sign-left" alt="">
						Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos
						export minim fugiat minim velit minim dolor enim duis veniam ipsum
						anim magna sunt elit fore quem dolore labore illum veniam. <img
							src="img/quote-sign-right.png" class="quote-sign-right" alt="">
					</p>
				</div>

				<div class="testimonial-item">
					<img src="img/testimonial-5.jpg" class="testimonial-img" alt="">
					<h3>John Larson</h3>
					<h4>Entrepreneur</h4>
					<p>
						<img src="img/quote-sign-left.png" class="quote-sign-left" alt="">
						Quis quorum aliqua sint quem legam fore sunt eram irure aliqua
						veniam tempor noster veniam enim culpa labore duis sunt culpa
						nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum
						quid. <img src="img/quote-sign-right.png" class="quote-sign-right"
							alt="">
					</p>
				</div>

			</div>

		</div>
	</section>
	<!-- #testimonials --> <!--==========================
      Team Section
    ============================-->
	<section id="team">
		<div class="container">
			<div class="section-header wow fadeInUp">
				<h3>Team</h3>
				<p>Sed ut perspiciatis unde omnis iste natus error sit
					voluptatem accusantium doloremque</p>
			</div>

			<div class="row">

				<div class="col-lg-3 col-md-6 wow fadeInUp">
					<div class="member">
						<img src="img/team-1.jpg" class="img-fluid" alt="">
						<div class="member-info">
							<div class="member-info-content">
								<h4>Walter White</h4>
								<span>Chief Executive Officer</span>
								<div class="social">
									<a href=""><i class="fa fa-twitter"></i></a> <a href=""><i
										class="fa fa-facebook"></i></a> <a href=""><i
										class="fa fa-google-plus"></i></a> <a href=""><i
										class="fa fa-linkedin"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
					<div class="member">
						<img src="img/team-2.jpg" class="img-fluid" alt="">
						<div class="member-info">
							<div class="member-info-content">
								<h4>Sarah Jhonson</h4>
								<span>Product Manager</span>
								<div class="social">
									<a href=""><i class="fa fa-twitter"></i></a> <a href=""><i
										class="fa fa-facebook"></i></a> <a href=""><i
										class="fa fa-google-plus"></i></a> <a href=""><i
										class="fa fa-linkedin"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
					<div class="member">
						<img src="img/team-3.jpg" class="img-fluid" alt="">
						<div class="member-info">
							<div class="member-info-content">
								<h4>William Anderson</h4>
								<span>CTO</span>
								<div class="social">
									<a href=""><i class="fa fa-twitter"></i></a> <a href=""><i
										class="fa fa-facebook"></i></a> <a href=""><i
										class="fa fa-google-plus"></i></a> <a href=""><i
										class="fa fa-linkedin"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
					<div class="member">
						<img src="img/team-4.jpg" class="img-fluid" alt="">
						<div class="member-info">
							<div class="member-info-content">
								<h4>Amanda Jepson</h4>
								<span>Accountant</span>
								<div class="social">
									<a href=""><i class="fa fa-twitter"></i></a> <a href=""><i
										class="fa fa-facebook"></i></a> <a href=""><i
										class="fa fa-google-plus"></i></a> <a href=""><i
										class="fa fa-linkedin"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</section>
	<!-- #team --> <!--==========================
      Contact Section
    ============================-->
	<section id="contact" class="section-bg wow fadeInUp">
		<div class="container">

			<div class="section-header">
				<h3>Contact Us</h3>
				<p>Sed ut perspiciatis unde omnis iste natus error sit
					voluptatem accusantium doloremque</p>
			</div>

			<div class="row contact-info">

				<div class="col-md-4">
					<div class="contact-address">
						<i class="ion-ios-location-outline"></i>
						<h3>Address</h3>
						<address>A108 Adam Street, NY 535022, USA</address>
					</div>
				</div>

				<div class="col-md-4">
					<div class="contact-phone">
						<i class="ion-ios-telephone-outline"></i>
						<h3>Phone Number</h3>
						<p>
							<a href="tel:+155895548855">+1 5589 55488 55</a>
						</p>
					</div>
				</div>

				<div class="col-md-4">
					<div class="contact-email">
						<i class="ion-ios-email-outline"></i>
						<h3>Email</h3>
						<p>
							<a href="mailto:info@example.com">info@example.com</a>
						</p>
					</div>
				</div>

			</div>

			<div class="form">
				<div id="sendmessage">Your message has been sent. Thank you!</div>
				<div id="errormessage"></div>
				<form action="" method="post" role="form" class="contactForm">
					<div class="form-row">
						<div class="form-group col-md-6">
							<input type="text" name="name" class="form-control" id="name"
								placeholder="Your Name" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<div class="validation"></div>
						</div>
						<div class="form-group col-md-6">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="Your Email" data-rule="email"
								data-msg="Please enter a valid email" />
							<div class="validation"></div>
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="subject"
							id="subject" placeholder="Subject" data-rule="minlen:4"
							data-msg="Please enter at least 8 chars of subject" />
						<div class="validation"></div>
					</div>
					<div class="form-group">
						<textarea class="form-control" name="message" rows="5"
							data-rule="required" data-msg="Please write something for us"
							placeholder="Message"></textarea>
						<div class="validation"></div>
					</div>
					<div class="text-center">
						<button type="submit">Send Message</button>
					</div>
				</form>
			</div>

		</div>
	</section>
	<!-- #contact --> </main>

	<!--==========================
    Footer
  ============================-->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6 footer-info">
						<h3>BizPage</h3>
						<p>Cras fermentum odio eu feugiat lide par naso tierra. Justo
							eget nada terra videa magna derita valies darta donna mare
							fermentum iaculis eu non diam phasellus. Scelerisque felis
							imperdiet proin fermentum leo. Amet volutpat consequat mauris
							nunc congue.</p>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="ion-ios-arrow-right"></i> <a href="#">Home</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a href="#">About
									us</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a href="#">Services</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a href="#">Terms
									of service</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a href="#">Privacy
									policy</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-contact">
						<h4>Contact Us</h4>
						<p>
							A108 Adam Street <br> New York, NY 535022<br> United
							States <br> <strong>Phone:</strong> +1 5589 55488 55<br>
							<strong>Email:</strong> info@example.com<br>
						</p>

						<div class="social-links">
							<a href="#" class="twitter"><i class="fa fa-twitter"></i></a> <a
								href="#" class="facebook"><i class="fa fa-facebook"></i></a> <a
								href="#" class="instagram"><i class="fa fa-instagram"></i></a> <a
								href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
							<a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
						</div>

					</div>

					<div class="col-lg-3 col-md-6 footer-newsletter">
						<h4>Our Newsletter</h4>
						<p>Tamen quem nulla quae legam multos aute sint culpa legam
							noster magna veniam enim veniam illum dolore legam minim quorum
							culpa amet magna export quem marada parida nodela caramase seza.</p>
						<form action="" method="post">
							<input type="email" name="email"><input type="submit"
								value="Subscribe">
						</form>
					</div>

				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong>BizPage</strong>. All Rights Reserved
			</div>
			<div class="credits">
				<!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=BizPage
        -->
				Best <a href="https://bootstrapmade.com/">Bootstrap Templates</a> by
				BootstrapMade
			</div>
		</div>
	</footer>
	<!-- #footer -->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="lib/jquery/jquery.min.js"></script>
	<script src="lib/jquery/jquery-migrate.min.js"></script>
	<script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/superfish/hoverIntent.js"></script>
	<script src="lib/superfish/superfish.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>
	<script src="lib/touchSwipe/jquery.touchSwipe.min.js"></script>
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>

</body>
</html>