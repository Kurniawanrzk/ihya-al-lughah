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
        <p class="mb-4">Data Konten qiraah</p>

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
                           @if(count($qiraah) > 0)
                            @foreach ($qiraah as $qiraah)
                             <tr>
                                <td>{{ $qiraah['urutan_bab'] }}</td>
                                <td>{{ $qiraah['nama_materi'] }}</td>
                                <td style="width: 40%">{{ $qiraah['deskripsi'] }}</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#thumbnailModal{{ $qiraah['id'] }}">
                                        View Thumbnail
                                    </button>
                                    
                                    <!-- Thumbnail Modal -->
                                    <div class="modal fade" id="thumbnailModal{{ $qiraah['id'] }}" tabindex="-1" role="dialog" aria-labelledby="thumbnailModalLabel{{ $qiraah['id'] }}" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="thumbnailModalLabel{{ $qiraah['id'] }}">Thumbnail Preview</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-center">
                                                    <img src="{{$qiraah['thumbnail']}}" alt="Thumbnail" class="img-fluid">
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>{{ $qiraah['keys'] }}</td>
                               <!-- Modify the action buttons in the table -->
                                <td class="">
                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#detailModal{{ $qiraah['id'] }}">Detail</button>
                                    <a style="text-decoration:none;color:white;" href="{{ Route('ubah_qiraah', $qiraah['id']) }}"> <button class="btn btn-success">Ubah</button></a>
                                    <form id="deleteqiraah{{$qiraah['id']}}" method="POST" action="{{ Route('hapus_qiraah', $qiraah['id']) }}" class="d-inline">
                                        @csrf
                                        @method("DELETE")
                                        <button type="button" onclick="confirmDelete('Yakin ingin menghapus?', 'Hapus', 'Kembali', 'deleteqiraah{{$qiraah['id']}}')" class="btn btn-danger">Hapus</button>
                                    </form>

                             <!-- Detail Modal -->
<div class="modal fade" id="detailModal{{ $qiraah['id'] }}" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel{{ $qiraah['id'] }}" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="detailModalLabel{{ $qiraah['id'] }}">Detail Materi</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Content Section -->
                {{-- <div class="row">
                    <div class="col-md-6">
                        <h6 class="font-weight-bold">BAB</h6>
                        <p>{{ $qiraah['urutan_bab'] }}</p>
                        
                        <h6 class="font-weight-bold">Nama Materi</h6>
                        <p>{{ $qiraah['nama_materi'] }}</p>
                        
                        <h6 class="font-weight-bold">Keys</h6>
                        <p>{{ $qiraah['keys'] }}</p>   
                    </div>
        
                </div> --}}
                
                {{-- <div class="row mt-3">
                    <div class="col-12">
                        <h6 class="font-weight-bold">Deskripsi Materi</h6>
                        <p>{{ $qiraah['deskripsi'] }}</p>
                    </div>
                </div>
                <hr> --}}
 
             
                <!-- Tab panes -->
                <div class="tab-content mt-3">
                  
                    <div class="tab-pane active" id="text{{ $qiraah['id'] }}" role="tabpanel">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <!-- Form Teks Percakapan -->
                                        <form action="{{ Route("ubah_teks_qiraah", $qiraah['id']) }}" method="POST">
                                            @csrf
                                            @method('PUT')
                                            <div class="form-group">
                                                <label for="teks_percakapan">Teks Percakapan</label>
                                                <textarea class="tinymce-editor" id="teks_percakapan{{ $qiraah['id'] }}" 
                                                    name="teks_bacaan">{!! $qiraah['isiQiraah'] ? $qiraah['isiQiraah']['teks_bacaan'] : '' !!}</textarea>
                                            </div>
                                            <div class="mt-3">
                                                <button type="submit" class="btn btn-primary">Update Teks</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
    form.action = '?id=' + id;
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/5.0.9/tinymce.min.js" integrity="sha512-zdq7KjR1iJyOM1MnKscySK8KUHbPIl63/GPT/pyfzf5WHP4f+hH937oZfbVrdOLwFLasQt4iK0p4M3iOCWzBxA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    tinymce.init({
        selector: '.tinymce-editor',
        height: 400,
        plugins: [
            'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview',
            'anchor', 'searchreplace', 'visualblocks', 'code', 'fullscreen',
            'insertdatetime', 'media', 'table', 'help', 'wordcount'
        ],
        toolbar: 'undo redo | formatselect | ' +
            'bold italic backcolor | alignleft aligncenter ' +
            'alignright alignjustify | bullist numlist outdent indent | ' +
            'removeformat | help',
        content_style: 'body { font-family:Arial,sans-serif; font-size:16px }'
    });
</script>
@endsection