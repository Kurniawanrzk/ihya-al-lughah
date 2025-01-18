<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-text mx-3">Ihya Allughah Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="{{ Route("dashboard_admin_index") }}">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Fitur-Fitur Utama
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fa fa-book" aria-hidden="true"></i>
                    <span>Al Mufrodat</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Operasi:</h6>
                        <a class="collapse-item" href="{{ Route("mufrodat_list_index") }}">List Mufrodat</a>
                        <a class="collapse-item" href="{{ Route("mufrodat_tambah_index") }}">Tambah Mufrodat Baru</a>
                    </div>
                </div>
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwoKalam"
                aria-expanded="true" aria-controls="collapseTwo">
                <i class="fa fa-book" aria-hidden="true"></i>
                <span>Kalam</span>
            </a>
            <div id="collapseTwoKalam" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Operasi:</h6>
                    <a class="collapse-item" href="{{ Route("kalam_list_index") }}">List Kalam</a>
                    <a class="collapse-item" href="{{ Route("kalam_tambah_index") }}">Tambah Kalam Baru</a>
                </div>
            </div>
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwoQiraah"
                aria-expanded="true" aria-controls="collapseTwo">
                <i class="fa fa-book" aria-hidden="true"></i>
                <span>Qiraah</span>
            </a>
            <div id="collapseTwoQiraah" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Operasi:</h6>
                    <a class="collapse-item" href="{{ Route("qiraah_list_index") }}">List Qiraah</a>
                    <a class="collapse-item" href="{{ Route("qiraah_tambah_index") }}">Tambah Qiraah Baru</a>
                </div>
            </div>
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwoLatsol"
                aria-expanded="true" aria-controls="collapseTwo">
                <i class="fa fa-book" aria-hidden="true"></i>
                <span>Latihan Soal</span>
            </a>
            <div id="collapseTwoLatsol" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Operasi:</h6>
                    <a class="collapse-item" href="{{ Route("latihan_qiraah_list_index") }}">List Latihan Qiraah</a>
                    <a class="collapse-item" href="{{ Route("latihan_qiraah_tambah_index") }}">Tambah Latihan Qiraah Baru</a>
                </div>
            </div>
            </li>

    

            <!-- Divider -->
            <hr class="sidebar-divider">


            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
                <p class="text-center mb-2">Hai <b>{{ auth()->user()->name }}!</b>, Selamat Datang Di Halaman Admin </p>
            </div>

        </ul>