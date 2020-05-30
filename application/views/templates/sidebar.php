    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">rekomendasi sekolah</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item <?= $this->uri->segment(2) == 'dashboard' ? "active" : "" ?>">
        <a class="nav-link" href="<?= base_url('admin/dashboard') ?>">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Feature
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item <?= $this->uri->segment(2) == 'user' ? "active" : "" ?>" >
        <a class="nav-link" href="<?= base_url('admin/user') ?>">
          <i class="fas fa-fw fa-users"></i>
          <span>Data User</span></a>
      </li>

      <li class="nav-item <?= $this->uri->segment(2) == 'sekolah' ? "active" : "" ?>">
        <a class="nav-link" href="<?= base_url('admin/sekolah') ?>">
          <i class="fas fa-fw fa-graduation-cap"></i>
          <span>Data Sekolah</span></a>
      </li>

      <li class="nav-item <?= $this->uri->segment(2) == 'kriteria' ? "active" : "" ?>">
        <a class="nav-link" href="<?= base_url('admin/kriteria') ?>">
          <i class="fas fa-fw fa-sitemap"></i>
          <span>Data Kriteria</span></a>
      </li>

      <li class="nav-item <?= $this->uri->segment(2) == 'bobotsekolah' ? "active" : "" ?>">
        <a class="nav-link" href="<?= base_url('admin/bobotsekolah') ?>">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Bobot Sekolah</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">
      <!-- Heading -->
      
      <div class="sidebar-heading">
        Akun
      </div>
      
      <!-- Nav Item - Charts -->
      <li class="nav-item <?= $this->uri->segment(2) == 'profile' ? "active" : "" ?>">
        <a class="nav-link" href="<?= base_url('admin/profile') ?>">
          <i class="fas fa-fw fa-user"></i>
          <span>Profile Saya</span></a>
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item <?= $this->uri->segment(3) == 'changepassword' ? "active" : "" ?>">
        <a class="nav-link" href="<?= base_url('admin/profile/changepassword') ?>">
          <i class="fas fa-fw fa-cog"></i>
          <span>Ganti Password</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#logoutModal">
          <i class="fas fa-sign-out-alt"></i>
          <span>Logout</span></a>
      </li>

      <?php if($this->uri->segment(2) == 'profil') echo "active"; else echo ""; ?>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->
