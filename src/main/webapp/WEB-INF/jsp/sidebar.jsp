
        <div class="sidebar-bg col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="sidebar fs-5 d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
            	<div class="d-flex align-items-center sidebar">
                    <a class="navbar-brand me-2 my-4" href="/">
				    	<img class="header-logo" src="/img/eLaskuLogo.png"/>
				    </a>
				    <a class="nav-link" href="/app"><span class="fs-5 d-none d-sm-inline">Dashboard</span></a>
				 </div>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item my-2">
                        <a href="/app" class="nav-link align-middle px-0">
                            <i class="fs-5 bi bi-house"></i> <span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                    <li class="nav-item my-2">
                        <a href="#invoice-menu" data-bs-toggle="collapse" class="nav-link px-0 align-middle dropdown-toggle">
                            <i class="fs-5 bi bi-receipt-cutoff"></i> <span class="ms-1 d-none d-sm-inline">Invoices</span></a>
                        <ul class="collapse nav flex-column ms-1" id="invoice-menu" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="/app/invoices" class="nav-link px-0"> <span class="fs-5 ps-5 d-none d-sm-inline">View invoices</span></a>
                            </li>
                            <li>
                                <a href="/app/invoice/new" class="nav-link px-0"> <span class="fs-5 ps-5 d-none d-sm-inline">New invoice</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item my-2">
                            <a href="#customer-menu" data-bs-toggle="collapse" class="nav-link px-0 align-middle dropdown-toggle">
                            <i class="fs-5 bi-people"></i> <span class="ms-1 d-none d-sm-inline">Customers</span> </a>
                        <ul class="collapse nav flex-column ms-1" id="customer-menu" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="/app/customers" class="nav-link px-0"> <span class="fs-5 ps-5 d-none d-sm-inline">View customers</span></a>
                            </li>
                            <li>
                                <a href="/app/customer/new" class="nav-link px-0"> <span class="fs-5 ps-5 d-none d-sm-inline">New customer</span></a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <hr>
                <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="/img/user-icon.png" alt="hugenerd" class="rounded-circle">
                        <span class="fs-6 d-none d-sm-inline mx-1">${user.userName}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                        <li><a class="dropdown-item" href="/app/invoice/new">New invoice</a></li>
                        <li><a class="dropdown-item" href="/app/profile">Profile</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="/logout">Sign out</a></li>
                    </ul>
                </div>
            </div>
        </div>
        