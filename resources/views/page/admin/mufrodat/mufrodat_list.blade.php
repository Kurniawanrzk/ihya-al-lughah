@extends("layout.layout_admin")

@section('content')
<div id="content">

    <!-- Topbar -->
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

        <!-- Sidebar Toggle (Topbar) -->
        <form class="form-inline">
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                <i class="fa fa-bars"></i>
            </button>
        </form>

        <!-- Topbar Search -->
        <form
            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                    aria-label="Search" aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                    </button>
                </div>
            </div>
        </form>

        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-search fa-fw"></i>
                </a>
                <!-- Dropdown - Messages -->
                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                    aria-labelledby="searchDropdown">
                    <form class="form-inline mr-auto w-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small"
                                placeholder="Search for..." aria-label="Search"
                                aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </li>


    </nav>
    <!-- End of Topbar -->

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Tables</h1>
        <p class="mb-4">Data Konten Mufrodat</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>BAB</th>
                                <th>Nama Materi</th>
                                <th>Deskripsi Materi</th>
                                <th>thumbnail</th>
                                <th>Keys</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                           @if(count($mufrodat) > 0)
                            @foreach ($mufrodat as $mufrodat)
                             <tr>
                                <td>{{ $mufrodat['urutan_bab'] }}</td>
                                <td>{{ $mufrodat['nama_materi'] }}</td>
                                <td>{{ $mufrodat['deskripsi'] }}</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#thumbnailModal{{ $mufrodat['id'] }}">
                                        View Thumbnail
                                    </button>
                                    
                                    <!-- Thumbnail Modal -->
                                    <div class="modal fade" id="thumbnailModal{{ $mufrodat['id'] }}" tabindex="-1" role="dialog" aria-labelledby="thumbnailModalLabel{{ $mufrodat['id'] }}" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="thumbnailModalLabel{{ $mufrodat['id'] }}">Thumbnail Preview</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-center">
                                                    <img src="{{$mufrodat['thumbnail']}}" alt="Thumbnail" class="img-fluid">
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>{{ $mufrodat['keys'] }}</td>
                               <!-- Modify the action buttons in the table -->
                                <td class="">
                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#detailModal{{ $mufrodat['id'] }}">Detail</button>
                                    <button class="btn btn-success"><a style="text-decoration:none;color:white;" href="{{ Route('ubah_mufrodat', $mufrodat['id']) }}">Ubah</a></button>
                                    <form id="deleteMufrodat{{$mufrodat['id']}}" method="POST" action="{{ Route('hapus_mufrodat', $mufrodat['id']) }}" class="d-inline">
                                        @csrf
                                        @method("DELETE")
                                        <button type="button" onclick="confirmDelete('Yakin ingin menghapus?', 'Hapus', 'Kembali', 'deleteMufrodat{{$mufrodat['id']}}')" class="btn btn-danger">Hapus</button>
                                    </form>

                                    <!-- Detail Modal -->
                                    <div class="modal fade" id="detailModal{{ $mufrodat['id'] }}" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel{{ $mufrodat['id'] }}" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable modal-xl">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="detailModalLabel{{ $mufrodat['id'] }}">Detail Materi</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <!-- Content Section -->
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <h6 class="font-weight-bold">BAB</h6>
                                                            <p>{{ $mufrodat['urutan_bab'] }}</p>
                                                            
                                                            <h6 class="font-weight-bold">Nama Materi</h6>
                                                            <p>{{ $mufrodat['nama_materi'] }}</p>
                                                            
                                                            <h6 class="font-weight-bold">Keys</h6>
                                                            <p>{{ $mufrodat['keys'] }}</p>

                                                         
                                                        </div>
                                                        
                                                    </div>
                                                    
                                                    <div class="row mt-3">
                                                        <div class="col-12">
                                                            <h6 class="font-weight-bold">Deskripsi Materi</h6>
                                                            <p>{{ $mufrodat['deskripsi'] }}</p>
                                                        </div>
                                                    </div>

                                                    <div class="table-responsive">

                                                        <form id="delete-form" action="" method="POST" style="display:none;">
                                                            @csrf
                                                            @method("DELETE")
                                                        </form>
                                                            <form action="{{Route("isimufrodat_tambah_post", $mufrodat['id'])}}" method="POST" enctype="multipart/form-data">
                                                        <table>
                                                            <thead>
                                                                <tr>
                                                                    <td>Gambar</td>
                                                                    <td>Kosakata</td>
                                                                    <td>Aksi</td>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="dynamic-rows-{{ $mufrodat['id'] }}">
                                                                @csrf
                                                                @method("POST")
                                                                @foreach($mufrodat['isi_mufrodat'] as $im)
                                                                    <tr>
                                                                        <td>
                                                                            <img src="{{Storage::url('isi_mufrodat/' . $im['gambar']) }}" width="40" height="40" alt="Gambar">
                                                                        </td>
                                                                        <td>{{ $im['kosakata'] }}</td>
                                                                        <td>
                                                                            <button type="button" class="btn btn-danger" onclick="submitDeleteForm({{ $im['id'] }})">Hapus</button>
                                                                        </td>
                                                                                                                                                </form></tr>
                                                                @endforeach


                                                                <tr id="input-template-{{$mufrodat['id']}}" >
                                                                    <td>
                                                                        <input required multiple name="file_gambar[]" class="form-control" type="file" placeholder="masukkan gambar">
                                                                    </td>
                                                                    <td>
                                                                        <input required multiple name="kosakata[]" class="form-control" type="text" placeholder="masukkan kosakata">
                                                                    </td>
                                                                    <td><button onclick="deleteRow(this)" class="btn btn-danger btn-delete-row">X</button></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3">
                                                                        <button type="button" onclick="addRowDynamic('input-template-{{$mufrodat['id']}}','dynamic-rows-{{ $mufrodat['id'] }}', this)" class="btn btn-info">+</button>
                                                                        <button type="submit" class="btn btn-success">Tambah Kosakata</button>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                            
                                                        </table>
                                                            </form>
                                                    </div>

                                                 
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>   
                            @endforeach
                            @else
                            <h4>Data Belum Ada</h4>
                            @endif
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->

</div>
@endsection

@section("js")

<script>
function deleteRow(button) {
    const row = button.closest("tr");
    if (row) {
        row.remove();
    }
}

function submitDeleteForm(id) {
    const form = document.getElementById('delete-form');
    form.action = '{{ Route("hapus_isimufrodat") }}?id=' + id;
    form.submit();
}
                                                        
    function addRowDynamic(idTemplate, idDynamicRow,idAddRow, e) {
        const tbody = document.getElementById(idDynamicRow);
        const inputTemplate = document.getElementById(idTemplate);

        const newRow = inputTemplate.cloneNode(true);
        newRow.classList.remove('d-none');
        tbody.insertBefore(newRow, idAddRow.closest("tr"));
    }
</script>
@endsection