
 <div class="modal fade" id="myModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5>Déconnexion</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

			
			<div class="modal-body">
				<p>Vous voulez continuer?</p>
			</div>
			<div class="modal-footer">
				<button type="button"  class="btn btn-info" data-dismiss="modal">Non</button>
				<button type="button" id="supprimer"  class="btn btn-light " data-dismiss="modal">Oui</button>
			</div>
			</div>
		</div>
	</div>
	
	
<div class="modal fade" id="myModa">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5>Déconnexion</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

			
			<div class="modal-body">
				<p>Vous vraiment se déconnecter?</p>
			</div>
			<div class="modal-footer">
				<button type="button"  class="btn btn-info" data-dismiss="modal">Non</button>
				<button type="button" id="log"  class="btn btn-light ">Oui</button>
			</div>
			</div>
		</div>
	</div>
	
<aside id="sidebar" class="js-custom-scroll side-nav ">
        <ul id="sideNav" class="side-nav-menu side-nav-menu-top-level mb-0">
            <!-- Title -->
            <li class="sidebar-heading h6">Dashboard</li>
            <!-- End Title -->

            <!-- Dashboard -->
            <li class="side-nav-menu-item ">
                <a class="side-nav-menu-link media align-items-center" href="dashboard.jsp">
              <span class="side-nav-menu-icon d-flex mr-3">
                <i class="gd-dashboard"></i>
              </span>
                    <span class="side-nav-fadeout-on-closed media-body">Dashboard</span>
                </a>
            </li>
            <!-- End Dashboard -->

            <!-- Machine -->
            <li class="side-nav-menu-item">
                <a class="side-nav-menu-link media align-items-center toplinks"  href="machines.jsp" >
              <span class="side-nav-menu-icon d-flex mr-3">
                <i class="gd-desktop"></i>
              </span>
                    <span class="side-nav-fadeout-on-closed media-body">Machine</span>
                </a>
            </li>
            <!-- End Machine -->
            <!-- Salle -->
            <li class="side-nav-menu-item">
                <a class="side-nav-menu-link media align-items-center toplinks" href="salles.jsp" >
              <span class="side-nav-menu-icon d-flex mr-3">
                <i class="gd-home"></i>
              </span>
                    <span class="side-nav-fadeout-on-closed media-body">Salle</span>
                </a>
            </li>
            <!-- End Salle -->
            <!-- machine par salle -->
            <li class="side-nav-menu-item">
                <a class="side-nav-menu-link media align-items-center toplinks" href="listems.jsp" >
              <span class="side-nav-menu-icon d-flex mr-3">
                <i class="gd-file"></i>
              </span>
                    <span class="side-nav-fadeout-on-closed media-body">Machines Par Salle</span>
                </a>
            </li>
            <!-- End machine par salle -->
            <!-- machine entre dates -->
            <li class="side-nav-menu-item">
                <a class="side-nav-menu-link media align-items-center toplinks" href="listemsd.jsp" >
              <span class="side-nav-menu-icon d-flex mr-3">
                <i class="gd-file"></i>
              </span>
                    <span class="side-nav-fadeout-on-closed media-body"> Machines Par Date</span>
                </a>
            </li>
            <!-- End machine entre dates -->

            <!-- Title -->
            <li class="sidebar-heading h6">Paramétres</li>
            <!-- End Title -->

            <!-- Users -->
            <%  
            if(session.getAttribute("role").equals(true)){%>
 
            <li class="side-nav-menu-item side-nav-has-menu">
                <a class="side-nav-menu-link media align-items-center toplinks"  href="createuser.jsp"
                  >
                  <span class="side-nav-menu-icon d-flex mr-3">
                    <i class="gd-user"></i>
                  </span>
                    <span class="side-nav-fadeout-on-closed media-body">Utilisateurs</span>
                    <span class="side-nav-control-icon d-flex">
               
              </span>
                  
                </a>

                <!-- Users: subUsers -->
                
                <!-- End Users: subUsers -->
            </li> <%}%>
 
            <!-- End Users -->

            <!-- Authentication -->
            
            <!-- End Authentication -->

            <!-- Settings -->
            <li class="side-nav-menu-item">
                <a class="side-nav-menu-link media align-items-center" data-toggle="modal" data-target="#myModa" href="#">
              <span class="side-nav-menu-icon d-flex mr-3">
                <i class="gd-power-off"></i>
              </span>
                    <span class="side-nav-fadeout-on-closed media-body">Déconnexion</span>
                </a>
            </li>
            <!-- End Settings -->

            <!-- Static -->
           
            <!-- End Static -->

        </ul>
    </aside>