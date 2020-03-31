<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	    <div class="row">
	        <div class="col">
	            <p class="text-white mt-5 mb-5">환영합니다, <b>관리자님</b></p>
	        </div>
	    </div>
	    <!-- row -->
	    <div class="row tm-content-row">
	        <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
	            <div class="tm-bg-primary-dark tm-block summary-layout" >
	                <h3 class="tm-block-title text-center">월별 매출</h3>
	                <canvas id="lineChart" style="margin-top:30px;"></canvas>
	            </div>
	        </div>
	        	        <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
	            <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow summary-layout">
	                <h2 class="tm-block-title text-center">Daily Report</h2>
	                <div class="tm-notification-items">
	                    <div class="media tm-notification-item">
	                        <div class="tm-gray-circle"><img src="/starbucks/images/shopping-cart (4).png" alt="Avatar Image" class="rounded-circle" width="100%" height="100%""></div>
	                        <div class="media-body">
	                            <p class="mb-2"><b>Jessica</b> and <b>6 others</b> sent you new <a href="#"
	                                    class="tm-notification-link">product updates</a>. Check new orders.</p>
	                            <span class="tm-small tm-text-color-secondary">6h ago.</span>
	                        </div>
	                    </div>
	                    <div class="media tm-notification-item">
	                        <div class="tm-gray-circle"><img src="/starbucks/images/buy.png" alt="Avatar Image" class="rounded-circle" width="100%" height="100%"></div>
	                        <div class="media-body">
	                            <p class="mb-2"><b>Oliver Too</b> and <b>6 others</b> sent you existing <a href="#"
	                                    class="tm-notification-link">product updates</a>. Read more reports.</p>
	                            <span class="tm-small tm-text-color-secondary">6h ago.</span>
	                        </div>
	                    </div>
	                    <div class="media tm-notification-item">
	                        <div class="tm-gray-circle"><img src="/starbucks/images/shopping-cart (4).png" alt="Avatar Image" class="rounded-circle" width="100%" height="100%"></div>
	                        <div class="media-body">
	                            <p class="mb-2"><b>Victoria</b> and <b>6 others</b> sent you <a href="#"
	                                    class="tm-notification-link">order updates</a>. Read order information.</p>
	                            <span class="tm-small tm-text-color-secondary">6h ago.</span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
	            <div class="tm-bg-primary-dark tm-block summary-layout">
	                <h3 class="tm-block-title text-center">TOP7 인기상품</h3>
	                <canvas id="barChart"></canvas>
	            </div>
	        </div>
	        <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
	            <div class="tm-bg-primary-dark tm-block tm-block-taller summary-layout">
	                <h2 class="tm-block-title text-center" style="margin-bottom:10px;">테마별 판매량</h2>
	                <div id="pieChartContainer">
	                    <canvas id="pieChart" class="chartjs-render-monitor"></canvas>
	                </div>                        
	            </div>
	        </div>

	        <div class="col-12 tm-block-col">
	            <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
	                <h2 class="tm-block-title">Orders List</h2>
	                <table class="table">
	                    <thead>
	                        <tr>
	                            <th scope="col">ORDER NO.</th>
	                            <th scope="col">STATUS</th>
	                            <th scope="col">OPERATORS</th>
	                            <th scope="col">LOCATION</th>
	                            <th scope="col">DISTANCE</th>
	                            <th scope="col">START DATE</th>
	                            <th scope="col">EST DELIVERY DUE</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <th scope="row"><b>#122349</b></th>
	                            <td>
	                                <div class="tm-status-circle moving">
	                                </div>Moving
	                            </td>
	                            <td><b>Oliver Trag</b></td>
	                            <td><b>London, UK</b></td>
	                            <td><b>485 km</b></td>
	                            <td>16:00, 12 NOV 2018</td>
	                            <td>08:00, 18 NOV 2018</td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><b>#122348</b></th>
	                            <td>
	                                <div class="tm-status-circle pending">
	                                </div>Pending
	                            </td>
	                            <td><b>Jacob Miller</b></td>
	                            <td><b>London, UK</b></td>
	                            <td><b>360 km</b></td>
	                            <td>11:00, 10 NOV 2018</td>
	                            <td>04:00, 14 NOV 2018</td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><b>#122347</b></th>
	                            <td>
	                                <div class="tm-status-circle cancelled">
	                                </div>Cancelled
	                            </td>
	                            <td><b>George Wilson</b></td>
	                            <td><b>London, UK</b></td>
	                            <td><b>340 km</b></td>
	                            <td>12:00, 22 NOV 2018</td>
	                            <td>06:00, 28 NOV 2018</td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><b>#122346</b></th>
	                            <td>
	                                <div class="tm-status-circle moving">
	                                </div>Moving
	                            </td>
	                            <td><b>William Aung</b></td>
	                            <td><b>London, UK</b></td>
	                            <td><b>218 km</b></td>
	                            <td>15:00, 10 NOV 2018</td>
	                            <td>09:00, 14 NOV 2018</td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><b>#122345</b></th>
	                            <td>
	                                <div class="tm-status-circle pending">
	                                </div>Pending
	                            </td>
	                            <td><b>Harry Ryan</b></td>
	                            <td><b>London, UK</b></td>
	                            <td><b>280 km</b></td>
	                            <td>15:00, 11 NOV 2018</td>
	                            <td>09:00, 17 NOV 2018</td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><b>#122344</b></th>
	                            <td>
	                                <div class="tm-status-circle pending">
	                                </div>Pending
	                            </td>
	                            <td><b>Michael Jones</b></td>
	                            <td><b>London, UK</b></td>
	                            <td><b>218 km</b></td>
	                            <td>18:00, 12 OCT 2018</td>
	                            <td>06:00, 18 OCT 2018</td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><b>#122343</b></th>
	                            <td>
	                                <div class="tm-status-circle moving">
	                                </div>Moving
	                            </td>
	                            <td><b>Timmy Davis</b></td>
	                            <td><b>London, UK</b></td>
	                            <td><b>218 km</b></td>
	                            <td>12:00, 10 OCT 2018</td>
	                            <td>08:00, 18 OCT 2018</td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><b>#122342</b></th>
	                            <td>
	                                <div class="tm-status-circle moving">
	                                </div>Moving
	                            </td>
	                            <td><b>Oscar Phyo</b></td>
	                            <td><b>London, UK</b></td>
	                            <td><b>420 km</b></td>
	                            <td>15:30, 06 OCT 2018</td>
	                            <td>09:30, 16 OCT 2018</td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><b>#122341</b></th>
	                            <td>
	                                <div class="tm-status-circle moving">
	                                </div>Moving
	                            </td>
	                            <td><b>Charlie Brown</b></td>
	                            <td><b>London, UK</b></td>
	                            <td><b>300 km</b></td>
	                            <td>11:00, 10 OCT 2018</td>
	                            <td>03:00, 14 OCT 2018</td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><b>#122340</b></th>
	                            <td>
	                                <div class="tm-status-circle cancelled">
	                                </div>Cancelled
	                            </td>
	                            <td><b>Wilson Cookies</b></td>
	                            <td><b>London, UK</b></td>
	                            <td><b>218 km</b></td>
	                            <td>17:30, 12 OCT 2018</td>
	                            <td>08:30, 22 OCT 2018</td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><b>#122339</b></th>
	                            <td>
	                                <div class="tm-status-circle moving">
	                                </div>Moving
	                            </td>
	                            <td><b>Richard Clamon</b></td>
	                            <td><b>London, UK</b></td>
	                            <td><b>150 km</b></td>
	                            <td>15:00, 12 OCT 2018</td>
	                            <td>09:20, 26 OCT 2018</td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	</div>
	<form id="dashFrm" name="dashFrm">
	<c:forEach var="item" items="${pList }">
	<input type="hidden" name="bestItem" value="${item.item_title }"/>
	<input type="hidden" name="bestItemValue" value="${item.order_sumnum }"/>
	</c:forEach>
	
	<c:forEach var="item" items="${sum }">
	<input type="hidden" name="totalSum" value="${item }"/>
	</c:forEach>
	
	<c:forEach var="item" items="${list2 }">
	<input type="hidden" name="themeSum" value="${item.item_theme }"/>
	<input type="hidden" name="themeSumValue" value="${item.salesSum}"/>
	</c:forEach>
	
	</form>
	<script>
	   $(document).ready(function(){
		    $('#dashNav').addClass('active');
	   });
	</script>
</body>
</html>