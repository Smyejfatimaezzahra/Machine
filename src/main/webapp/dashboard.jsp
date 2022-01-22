<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
	<%@page import="beans.*"%>
	<%@page import="service.MachineService"%>
	<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script src="scripts/dashboard.js" type="text/javascript"></script>
<%@include file="template/css.jsp"%>
</head>


<body class="has-sidebar has-fixed-sidebar-and-header">
<%  response.setHeader("cache-control", " no-cache,no-store,must-revalidate");
Users u = (Users) session.getAttribute("user");
	if(u==null ){
	%>
	<jsp:forward page="login.jsp"/>
	 <% }else {  %>
   
 
		  
<!-- Header -->
<%@include file="template/header.jsp"%>
    

<main class="main">
    <!-- Sidebar Nav -->
    <%@include file="template/menu.jsp"%>
    <!-- End Sidebar Nav -->

    <div class="content">
        <div class="py-4 px-3 px-md-4">

            <div class="mb-3 mb-md-4 d-flex justify-content-between">
                <div class="h3 mb-0">Dashboard</div>
            </div>

            <div class="row">
                <div class="col-md-6 col-xl-6 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card h-100">
                        <div class="card-header d-flex">
                            <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Depenses de l'année</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="media align-items-center px-3 px-md-4 mb-3 mb-md-4">
                                <div class="media-body">
                                    <h4 class="h3 lh-1 mb-2 depense"></h4>
                                    <p class="small text-muted mb-0 ">
                                        <span class="text-success mx-1 ">Année Actuelle </span> 
                                    </p>
                                </div>
                            </div>

                            <div id="graph1" class=" chart--points-invisible chart--labels-hidden position-relative"
                             ></div>
                        </div>
                    </div>
                    <!-- End Card -->
                </div>
                <div class="col-md-6 col-xl-6 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card h-100">
                        <div class="card-header d-flex">
                            <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Nombre de machine par salle</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="media align-items-center px-3 px-md-4 mb-3 mb-md-4">
                                <div class="media-body">
                                    <h4 class="h3 lh-1 mb-2 tm"></h4>
                                    <p class="small text-muted mb-0 ">
                                        <span class="text-success mx-1"> Nombre machine</span> 
                                    </p>
                                </div>
                            </div>

                            <div id="bar"></div>

                        </div>
                    </div>
                    <!-- End Card -->
                </div>
                
                <div class="col-md-6 col-xl-4 mb-3 mb-xl-4">
                    <!-- Widget -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div class="icon icon-lg bg-soft-primary rounded-circle mr-3">
                            <i class="gd-desktop icon-text d-inline-block text-primary"></i>
                        </div>
                        <div>
                            <h4 class="lh-1 mb-1 tm"></h4>
                            <h6 class="mb-0">Total Machine</h6>
                        </div>
                        <i class="gd-tag icon-text d-flex text-success ml-auto"></i>
                    </div>
                    <!-- End Widget -->
                </div>

                <div class="col-md-6 col-xl-4 mb-3 mb-xl-4">
                    <!-- Widget -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div class="icon icon-lg bg-soft-secondary rounded-circle mr-3">
                            <i class="gd-home icon-text d-inline-block text-secondary"></i>
                        </div>
                        <div>
                            <h4 class="lh-1 mb-1 ts"></h4>
                            <h6 class="mb-0">Total Salle</h6>
                        </div>
                        <i class="gd-tag icon-text d-flex text-danger ml-auto"></i>
                    </div>
                    <!-- End Widget -->
                </div>

                <div class="col-md-6 col-xl-4 mb-3 mb-xl-4">
                    <!-- Widget -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div class="icon icon-lg bg-soft-warning rounded-circle mr-3">
                            <i class="gd-money icon-text d-inline-block text-warning"></i>
                        </div>
                        <div>
                            <h4 class="lh-1 mb-1 depense"></h4>
                            <h6 class="mb-0"></h6>
                        </div>
                        <i class="gd-tag icon-text d-flex text-success ml-auto"></i>
                    </div>
                    <!-- End Widget -->
                </div>

            </div>
            
             
                        
            
            
            

            <div class="row">
                <div class="col-12">
                    <!-- Card -->
                    <div class="card mb-3 mb-md-4">
                        <div class="card-header border-bottom p-0">
                            <ul id="wallets" class="nav nav-v2 nav-primary nav-justified d-block d-xl-flex w-100" role="tablist">
                                
                                <li  id="tbar" class="nav-item border-bottom border-xl-bottom-0 border-xl-left">
                                    <a class="nav-link d-flex align-items-center py-2 px-3 p-xl-4"  role="tab" aria-selected="false"
                                      >
                                        <span style="Color:blue" >Nombre de Machines Par Salle</span>
                                        <small class="text-muted ml-auto">Graph</small>
                                    </a>
                                </li>
                                
                            </ul>
                        </div>
                        
         
                        <div id="walletsContent" class="card-body tab-content">
                            <div class="tab-pane fade show active" id="bitcoin" role="tabpanel">
                                <div class="row text-center">
                                    <div class="col-6 col-md-4 mb-3 mb-md-0">
                                        <div id=""  class="h3 mb-0 ts">
                                            
                                        </div>
                                        <small class="text-muted">Total Salles</small>
                                    </div>

                                    <div class="col-6 col-md-4 mb-3 mb-md-0 border-left">
                                        <div id= "" class="h3 mb-0 tm">
                                          
                                        </div>
                                        <small class="text-muted">Total Machines</small>
                                    </div>

                                    <div class="col-12 col-md-4 border-left">
                                        <div class=" depense h3 mb-0">
                                            
                                        </div>
                                        <small class="text-muted">Depenses</small>
                                    </div>
                                </div>
                             
                                <div id="graph" ></div>
                            </div>

                            
                             <div class="tab-pane fade" id="bitcoinCash" role="tabpanel">
                                <div class="row text-center">
                                    <div class="col-6 col-md-4 mb-3 mb-md-0">
                                        <div class="h3 mb-0">
                                            $8,038<sup class="h5">.00</sup>
                                        </div>
                                        <small class="text-muted">Total Sales</small>
                                    </div>

                                    <div class="col-6 col-md-4 mb-3 mb-md-0 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-success">+</span>$105<sup class="h5">.84</sup>
                                        </div>
                                        <small class="text-muted">Today Sales (USD)</small>
                                    </div>

                                    <div class="col-12 col-md-4 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-danger">-</span>2.38<sup class="h5">%</sup>
                                        </div>
                                        <small class="text-muted">Net Profit (%)</small>
                                    </div>
                                </div>

                                <div id="bar"></div>
                            </div>
                            

                            <div class="tab-pane fade" id="litecoin" role="tabpanel">
                                <div class="row text-center mb-4 mb-md-5">
                                    <div class="col-6 col-md-4 mb-3 mb-md-0">
                                        <div class="h3 mb-0">
                                            $23,844<sup class="h5">.44</sup>
                                        </div>
                                        <small class="text-muted">Total ²</small>
                                    </div>

                                    <div class="col-6 col-md-4 mb-3 mb-md-0 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-success">+</span>$952<sup class="h5">.43</sup>
                                        </div>
                                        <small class="text-muted">Today Sales (USD)</small>
                                    </div>

                                    <div class="col-12 col-md-4 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-success">+</span>10.25<sup class="h5">%</sup>
                                        </div>
                                        <small class="text-muted">Net Profit (%)</small>
                                    </div>
                                </div>

                                <div class="js-area-chart chart chart--axis-x--nowrap chart--points-invisible position-relative mh-15_6 safari-overflow-hidden pt-4 pt-md-5 pb-1"
                                     data-series='[
                           [
                             {"meta":"6/01/2019 9:00 PM","value":"2100"},
                             {"meta":"6/02/2019 9:00 PM","value":"2200"},
                             {"meta":"6/03/2019 9:00 PM","value":"2300"},
                             {"meta":"6/04/2019 9:00 PM","value":"1900"},
                             {"meta":"6/05/2019 9:00 PM","value":"1850"},
                             {"meta":"6/06/2019 9:00 PM","value":"2150"},
                             {"meta":"6/07/2019 9:00 PM","value":"2200"},
                             {"meta":"6/08/2019 9:00 PM","value":"2250"},
                             {"meta":"6/09/2019 9:00 PM","value":"2800"},
                             {"meta":"6/10/2019 9:00 PM","value":"2900"},
                             {"meta":"6/11/2019 9:00 PM","value":"3000"},
                             {"meta":"6/12/2019 9:00 PM","value":"2500"},
                             {"meta":"6/13/2019 9:00 PM","value":"2550"},
                             {"meta":"6/14/2019 9:00 PM","value":"2600"},
                             {"meta":"6/15/2019 9:00 PM","value":"2700"},
                             {"meta":"6/16/2019 9:00 PM","value":"2800"},
                             {"meta":"6/17/2019 9:00 PM","value":"2950"},
                             {"meta":"6/18/2019 9:00 PM","value":"3200"},
                             {"meta":"6/19/2019 9:00 PM","value":"3100"},
                             {"meta":"6/20/2019 9:00 PM","value":"2700"},
                             {"meta":"6/21/2019 9:00 PM","value":"3300"},
                             {"meta":"6/22/2019 9:00 PM","value":"3350"},
                             {"meta":"6/23/2019 9:00 PM","value":"3400"},
                             {"meta":"6/24/2019 9:00 PM","value":"3450"},
                             {"meta":"6/25/2019 9:00 PM","value":"3200"},
                             {"meta":"6/26/2019 9:00 PM","value":"3350"},
                             {"meta":"6/27/2019 9:00 PM","value":"3450"},
                             {"meta":"6/28/2019 9:00 PM","value":"3600"},
                             {"meta":"6/29/2019 9:00 PM","value":"3650"},
                             {"meta":"6/30/2019 9:00 PM","value":"3700"}
                           ]
                         ]'
                                     data-labels='["June 01","June 02","June 03","June 04","June 05","June 06","June 07","June 08","June 09","June 10","June 11","June 12","June 13","June 14","June 15","June 16","June 17","June 18","June 19","June 20","June 21","June 22","June 23","June 24","June 25","June 26","June 27","June 28","June 29","June 30"]'
                                     data-labels-qty="6"
                                     data-labels-start-from="1"
                                     data-prefix="$"
                                     data-height="250"
                                     data-mobile-height="75"
                                     data-high="4000"
                                     data-low="1000"
                                     data-offset-x="30"
                                     data-offset-y="60"
                                     data-is-line-smooth='[false]'
                                     data-line-width='["1px"]'
                                     data-line-colors='["#8069f2"]'
                                     data-fill-opacity="1"
                                     data-fill-colors='["#ecebfa"]'
                                     data-text-size-x="14px"
                                     data-text-color-x="#4a4e69"
                                     data-text-offset-top-x="10"
                                     data-text-align-axis-x="center"
                                     data-text-size-y="14px"
                                     data-text-color-y="#868e96"
                                     data-is-show-tooltips="true"
                                     data-is-tooltip-divided="true"
                                     data-tooltip-custom-class="chart-tooltip--divided chart-tooltip__value--bg-black chart-tooltip__meta--bg-primary small text-white"
                                     data-tooltip-currency="USD "
                                     data-is-show-points="true"
                                     data-point-custom-class='chart__point--donut chart__point--has-line-helper chart__point--border-xxs border-primary rounded-circle'
                                     data-point-dimensions='{"width":8,"height":8}'></div>
                            </div>
                        </div>
                        
                        
                        
                        
                        
                        
                       
                    </div>
                    <!-- End Card -->
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card h-100">
                        <div class="card-header d-flex">
                            <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Balance</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="border-bottom p-3 p-md-4 mt-3 pb-md-6">
                                <div class="js-bar-chart position-relative" style="height: 160px;"
                                     data-series="[
                               [160,160,160,160,160,160,160,160,160,160,160,160],
                               [92,97,124,137,97,124,46,97,90,97,111,90],
                               [69,47,69,53,45,94,34,31,68,73,83,68]
                             ]"
                                     data-height="160"
                                     data-high="160"
                                     data-low="0"
                                     data-distance="20"
                                     data-stroke-width="5"
                                     data-stroke-color='["#e0f6fc","#a0eee7","#8069f2"]'
                                     data-is-stack-bars="true"
                                     data-is-show-axis-x="false"
                                     data-is-show-axis-y="false"
                                     data-is-show-label-axis-x="false"
                                     data-is-show-label-axis-y="false"
                                     data-is-stroke-rounded="true"
                                     data-is-show-tooltips="true"
                                     data-postfix="%"
                                     data-tooltip-custom-class="chart-tooltip chart-tooltip--black small text-white px-2 py-1"></div>
                            </div>

                            <div class="border-bottom media align-items-center p-3">
                                <div class="media-body d-flex align-items-center mr-2">
                                    <span>Expenses</span>
                                    <span class="ml-auto">$393.15</span>
                                </div>

                                <i class="gd-arrow-down icon-text icon-text-xs d-flex text-danger ml-auto"></i>
                            </div>

                            <div class="media align-items-center p-3">
                                <div class="media-body d-flex align-items-center mr-2">
                                    <span>Profit</span>
                                    <span class="ml-auto">$7,040.87</span>
                                </div>

                                <i class="gd-arrow-up icon-text icon-text-xs d-flex text-success ml-auto"></i>
                            </div>
                        </div>
                    </div>
                    <!-- End Card -->
                </div>
                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card h-100">
                        <div class="card-header d-flex">
                            <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Available Balance</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="border-bottom text-center p-3 p-md-4 pb-md-6">
                                <div class="js-donut-chart position-relative d-flex mx-auto mb-3 mb-md-4" style="width: 130px; height: 130px;"
                                     data-series="[65,35]"
                                     data-border-width="12"
                                     data-slice-margin="2"
                                     data-start-angle="0"
                                     data-fill-colors='["#8069f2","#0cdcB9"]'
                                     data-is-show-tooltips="true"
                                     data-tooltip-currency="%"
                                     data-is-tooltip-currency-reverse="true"
                                     data-tooltip-custom-class="chart-tooltip chart-tooltip--triangle-right chart-tooltip--black small text-white px-2 py-1 mt-5 ml-n5"></div>

                                <div class="small text-muted">Total Balance ≈ 32,754.56 USD</div>
                            </div>

                            <div class="border-bottom media align-items-center p-3">
                                <div class="media-body d-flex align-items-center mr-2">
                                    <span>Cash</span>
                                    <span class="ml-auto">$13,380.25</span>
                                </div>

                                <i class="gd-arrow-up icon-text icon-text-xs d-flex text-success ml-auto"></i>
                            </div>

                            <div class="media align-items-center p-3">
                                <div class="media-body d-flex align-items-center mr-2">
                                    <span>Bank Account</span>
                                    <span class="ml-auto">$19,432.80</span>
                                </div>

                                <i class="gd-arrow-up icon-text icon-text-xs d-flex text-success ml-auto"></i>
                            </div>
                        </div>
                    </div>
                    <!-- End Card -->
                </div>
                <div class="col-lg-6 col-xl-4 mb-3 mb-lg-4">
                    <!-- Card -->
                    <div class="card h-100">
                        <div class="card-header">
                            <h5 class="h6 text-uppercase font-weight-semi-bold mb-0">Recent Transactions</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="border-top p-3 px-md-4 mx-0">
                                <div class="row justify-content-between small mb-2">
                                    <div class="col">
                                        <span class="text-primary mr-3">TOK</span>

                                        <span class="mr-1">$3,320.98</span>
                                        <i class="gd-arrow-left text-success mr-3"></i>
                                    </div>

                                    <div class="col-auto text-muted">
                                        3h ago
                                    </div>
                                </div>

                                Balance update
                            </div>
                            <div class="border-top p-3 px-md-4 mx-0">
                                <div class="row justify-content-between small mb-2">
                                    <div class="col">
                                        <span class="text-primary mr-3">NYC</span>

                                        <span class="mr-1">$4,320.98</span>
                                        <i class="gd-arrow-left text-success mr-3"></i>
                                    </div>

                                    <div class="col-auto text-muted">
                                        5h ago
                                    </div>
                                </div>

                                Balance update
                            </div>
                            <div class="border-top p-3 px-md-4 mx-0">
                                <div class="row justify-content-between small mb-2">
                                    <div class="col">
                                        <span class="text-primary mr-3">NYC</span>

                                        <span class="mr-1">$3,320.98</span>
                                        <i class="gd-arrow-right text-danger mr-3"></i>
                                    </div>

                                    <div class="col-auto text-muted">
                                        7h ago
                                    </div>
                                </div>
                                Marketing Expenses
                            </div>
                            <div class="border-top p-3 px-md-4 mx-0">
                                <div class="row justify-content-between small mb-2">
                                    <div class="col">
                                        <span class="text-primary mr-3">NYC</span>

                                        <span class="mr-1">$1,320.98</span>
                                        <i class="gd-arrow-left text-success mr-3"></i>
                                    </div>

                                    <div class="col-auto text-muted">
                                        12h ago
                                    </div>
                                </div>

                                Balance update
                            </div>

                        </div>
                    </div>
                    <!-- End Card -->
                </div>

                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div>
                            <h5 class="lh-1 mb-0">Orers</h5>
                            <small>125 (+5)</small>
                        </div>
                        <div class="js-area-chart chart--points-invisible chart--labels-hidden py-1 ml-auto"
                             data-series='[
                           [
                            {"value":"25"},
                            {"value":"35"},
                            {"value":"10"},
                            {"value":"40"},
                            {"value":"20"}
                           ]
                         ]'
                             data-width="100"
                             data-height="40"
                             data-high="40"
                             data-is-line-smooth='["simple"]'
                             data-line-width='["1px"]'
                             data-line-colors='["#0cdcB9"]'
                             data-fill-opacity=".3"
                             data-is-fill-colors-gradient="true"
                             data-fill-colors='[
                           ["rgba(28,240,221,.6)","rgba(255,255,255,.6)"]
                         ]'
                             data-is-show-tooltips="true"
                             data-is-tooltips-append-to-body="true"
                             data-tooltip-custom-class="chart-tooltip chart-tooltip--none-triangle d-flex align-items-center small text-white p-2 mt-5 ml-5"
                             data-tooltip-badge-markup='<span class="indicator indicator-sm bg-secondary rounded-circle mr-1"></span>'
                             data-is-show-points="true"
                             data-point-custom-class='chart__point--hidden'
                             data-point-dimensions='{"width":8,"height":8}'></div>
                    </div>
                    <!-- End Card -->
                </div>

                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div>
                            <h5 class="lh-1 mb-0">Visitors</h5>
                            <small>1,450 (+325)</small>
                        </div>
                        <div class="js-area-chart chart--points-invisible chart--labels-hidden py-2 ml-auto"
                             data-series='[
                           [
                             {"value":"40"},
                             {"value":"40"},
                             {"value":"40"},
                             {"value":"25"},
                             {"value":"30"},
                             {"value":"35"},
                             {"value":"50"},
                             {"value":"35"},
                             {"value":"35"},
                             {"value":"35"},
                             {"value":"30"},
                             {"value":"30"},
                             {"value":"40"},
                             {"value":"35"},
                             {"value":"35"},
                             {"value":"55"},
                             {"value":"50"},
                             {"value":"45"},
                             {"value":"60"},
                             {"value":"70"},
                             {"value":"80"}
                           ]
                         ]'
                             data-width="100"
                             data-height="40"
                             data-high="100"
                             data-is-line-smooth='[false]'
                             data-line-width='["1px"]'
                             data-line-colors='["#8069f2"]'
                             data-fill-opacity=".3"
                             data-is-fill-colors-gradient="true"
                             data-fill-colors='[
                           ["rgba(128,105,242,.7)","rgba(255,255,255,.6)"]
                         ]'
                             data-is-show-tooltips="true"
                             data-is-tooltips-append-to-body="true"
                             data-tooltip-custom-class="chart-tooltip chart-tooltip--none-triangle d-flex align-items-center small text-white p-2 mt-5 ml-5"
                             data-tooltip-badge-markup='<span class="indicator indicator-sm bg-primary rounded-circle mr-1"></span>'
                             data-is-show-points="true"
                             data-point-custom-class='chart__point--hidden'
                             data-point-dimensions='{"width":8,"height":8}'></div>
                    </div>
                    <!-- End Card -->
                </div>

                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div>
                            <h5 class="lh-1 mb-0">Customers</h5>
                            <small>320 (+20)</small>
                        </div>
                        <div class="js-area-chart chart--points-invisible chart--labels-hidden py-2 ml-auto"
                             data-series='[
                           [
                             {"value":"35"},
                             {"value":"20"},
                             {"value":"10"},
                             {"value":"20"},
                             {"value":"20"},
                             {"value":"0"},
                             {"value":"10"},
                             {"value":"0"},
                             {"value":"10"},
                             {"value":"10"},
                             {"value":"15"},
                             {"value":"35"},
                             {"value":"15"},
                             {"value":"20"},
                             {"value":"35"},
                             {"value":"35"},
                             {"value":"40"},
                             {"value":"42"}
                           ]
                         ]'
                             data-is-hide-area="true"
                             data-width="123"
                             data-height="42"
                             data-high="42"
                             data-is-line-smooth='[false]'
                             data-line-width='["2px"]'
                             data-line-colors='["#8069f2"]'
                             data-is-show-tooltips="true"
                             data-is-tooltips-append-to-body="true"
                             data-tooltip-custom-class="chart-tooltip chart-tooltip--none-triangle d-flex align-items-center small text-white p-2 mt-5 ml-5"
                             data-tooltip-badge-markup='<span class="indicator indicator-sm bg-primary rounded-circle mr-1"></span>'
                             data-is-show-points="true"
                             data-point-custom-class='chart__point--hidden'
                             data-point-dimensions='{"width":8,"height":8}'></div>
                    </div>
                    <!-- End Card -->
                </div>

            </div>

            


        </div>

        <!-- Footer -->
        <%@include file="template/footer.jsp"%>
        <!-- End Footer -->
    </div>
</main>

<%@include file="template/js.jsp"%>
 <% }%>
</body>
</html>