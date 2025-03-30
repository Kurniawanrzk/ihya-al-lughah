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
        </ul>
    </nav>
    <!-- End of Topbar -->

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Tables</h1>
        <p class="mb-4">Data Konten latihan_kalam</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>BAB</th>
                                <th>Nama Latihan</th>
                                <th>Deskripsi Latihan</th>
                                <th>thumbnail</th>
                                <th>Keys</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                           @if(count($latihan_kalam) > 0)
                            @foreach ($latihan_kalam as $latihan_kalam)
                             <tr>
                                <td>{{ $latihan_kalam['urutan_bab'] }}</td>
                                <td>{{ $latihan_kalam['nama_latihan'] }}</td>
                                <td style="width: 40%">{{ $latihan_kalam['deskripsi'] }}</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#thumbnailModal{{ $latihan_kalam['id'] }}">
                                        View Thumbnail
                                    </button>
                                    
                                    <!-- Thumbnail Modal -->
                                    <div class="modal fade" id="thumbnailModal{{ $latihan_kalam['id'] }}" tabindex="-1" role="dialog" aria-labelledby="thumbnailModalLabel{{ $latihan_kalam['id'] }}" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="thumbnailModalLabel{{ $latihan_kalam['id'] }}">Thumbnail Preview</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-center">
                                                    <img src="{{$latihan_kalam['thumbnail']}}" alt="Thumbnail" class="img-fluid">
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>{{ $latihan_kalam['keys'] }}</td>
                               <!-- Modify the action buttons in the table -->
                                <td class="">
                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#detailModal{{ $latihan_kalam['id'] }}">Detail</button>
                                    <a style="text-decoration:none;color:white;" href="{{ Route('ubah_latihan_kalam', $latihan_kalam['id']) }}"> <button class="btn btn-success" type="button">Ubah</button></a>
                                    <form id="deletelatihan_kalam{{$latihan_kalam['id']}}" method="POST" action="{{ Route('hapus_latihan_kalam', $latihan_kalam['id']) }}" class="d-inline">
                                        @csrf
                                        @method("DELETE")
                                        <button type="button" onclick="confirmDelete('Yakin ingin menghapus?', 'Hapus', 'Kembali', 'deletelatihan_kalam{{$latihan_kalam['id']}}')" class="btn btn-danger">Hapus</button>
                                    </form>
  
                                    <div class="modal fade" id="isiSoalJawabanModal{{ $latihan_kalam['id'] }}" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel{{ $latihan_kalam['id'] }}" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable modal-xl">
                                            <div class="modal-content">
                                                <div class="modal-header bg-primary text-white">
                                                    <h5 class="modal-title" id="detailModalLabel{{ $latihan_kalam['id'] }}">
                                                        <i class="fas fa-book-open mr-2"></i>Isi Soal Jawaban
                                                    </h5>
                                                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="{{ Route("soal_latihan_tambah_post", $latihan_kalam['id']) }}" method="POST" enctype="multipart/form-data">
                                                        @csrf
                                                        @method("POST")
                                                        <div>
                                                            <label for="">Upload CSV soal latihan</label>
    
                                                            <input type="file" name="soal_latihan" class="form-control">
                                                        </div>
                                                        <br>
                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                    </form>
                                                </div>
                                                <div class="modal-footer bg-light">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                        <i class="fas fa-times mr-1"></i>Tutup
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                   <!-- Detail Modal -->
<div class="modal fade" id="detailModal{{ $latihan_kalam['id'] }}" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel{{ $latihan_kalam['id'] }}" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-xl">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="detailModalLabel{{ $latihan_kalam['id'] }}">
                    <i class="fas fa-book-open mr-2"></i>Detail Latihan Kalam
                </h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="soal-cerita-tab" data-toggle="tab" href="#soalCerita{{ $latihan_kalam['id'] }}" role="tab" aria-controls="soalCerita" aria-selected="true">Soal Cerita</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="soal-percakapan-tab" data-toggle="tab" href="#soalPercakapan{{ $latihan_kalam['id'] }}" role="tab" aria-controls="soalPercakapan" aria-selected="false">Soal Percakapan</a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- Soal Cerita Tab -->
                  <!-- Soal Cerita Tab -->
<div class="tab-pane fade show active" id="soalCerita{{ $latihan_kalam['id'] }}" role="tabpanel" aria-labelledby="soal-cerita-tab">
    <h3 class="mt-3">Tambah Soal Cerita</h3>
    <form action="{{ route('tambah_soal_cerita', $latihan_kalam['id']) }}" method="POST" enctype="multipart/form-data" novalidate>
        @csrf
        <div id="soal-cerita-container">
            <div class="soal-cerita-group mb-3 border p-3">
                <div class="form-group">
                    <label for="gambar">Gambar Soal</label>
                    <input type="file" class="form-control" name="gambar[]" required>
                </div>
                <div class="form-group">
                    <label for="cerita">Cerita</label>
                    <textarea class="tinymce-editor" name="cerita[]" id="cerita-{{$latihan_kalam['id']}}" rows="4" required></textarea>
                </div>
            </div>
        </div>
        <button type="button" class="btn btn-secondary" id="tambah-soal-cerita">
            <i class="fas fa-plus"></i> Tambah Field
        </button>
        <button type="submit" class="btn btn-primary">
            <i class="fas fa-save"></i> Simpan Soal
        </button>
    </form>

    <h3 class="mt-5">Daftar Soal Cerita</h3>
    @if(count($latihan_kalam['soal_cerita']) > 0)
        <!-- ... (existing delete all button) ... -->
        @foreach($latihan_kalam['soal_cerita'] as $sc)
            <div class="card mb-4 shadow-sm">
                <div class="card-header bg-light">
                    <h6 class="mb-0">
                        <span class="badge badge-primary mr-2">ID: {{ $sc['id'] }}</span>
                        Soal Cerita
                    </h6>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="{{ $sc['gambar'] }}" class="img-fluid mb-3">
                        </div>
                        <div class="col-md-8">
                            <p class="font-weight-bold">Cerita:</p>
                            <div>{!! $sc['cerita'] !!}</div> <!-- Changed to display HTML content correctly -->
                        </div>
                    </div>
                    <form action="{{ route('hapus_soal_cerita', $sc['id']) }}" method="POST">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger btn-sm">
                            <i class="fas fa-trash"></i> Hapus
                        </button>
                    </form>
                </div>
            </div>
        @endforeach
    @endif
</div>

                    <!-- Soal Percakapan Tab -->
                    <div class="tab-pane fade" id="soalPercakapan{{ $latihan_kalam['id'] }}" role="tabpanel" aria-labelledby="soal-percakapan-tab">
                        <h3 class="mt-3">Tambah Soal Percakapan</h3>
                        <form action="{{ route('tambah_soal_percakapan', $latihan_kalam['id']) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div id="soal-percakapan-container">
                                <div class="soal-percakapan-group mb-3 border p-3">
                                    <div class="form-group">
                                        <label for="nomor">Nomor</label>
                                        <input type="number" class="form-control" name="nomor[]" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="percakapan">Percakapan</label>
                                        <textarea class="form-control" name="percakapan[]" rows="2" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="gambar">Gambar</label>
                                        <input type="file" class="form-control" name="gambar[]" required>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-secondary" id="tambah-soal-percakapan">
                                <i class="fas fa-plus"></i> Tambah Field
                            </button>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Simpan Soal
                            </button>
                        </form>

                        <h3 class="mt-5">Daftar Soal Percakapan</h3>
                        @if(count($latihan_kalam['soal_percakapan']) > 0)
                            <!-- ... (existing delete all button) ... -->
                            @foreach($latihan_kalam['soal_percakapan'] as $sp)
                                <div class="card mb-4 shadow-sm">
                                    <div class="card-header bg-light">
                                        <h6 class="mb-0">
                                            <span class="badge badge-primary mr-2">ID: {{ $sp['id'] }}</span>
                                            Soal Percakapan
                                        </h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <img src="{{ $sp['gambar'] }}" class="img-fluid mb-3">
                                            </div>
                                            <div class="col-md-8">
                                                <p class="font-weight-bold">Nomor: {{ $sp['nomor'] }}</p>
                                                <p>{{ $sp['percakapan'] }}</p>
                                            </div>
                                        </div>
                                        <form action="" method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger btn-sm">
                                                <i class="fas fa-trash"></i> Hapus
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            @endforeach
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/5.0.9/tinymce.min.js" integrity="sha512-zdq7KjR1iJyOM1MnKscySK8KjPIl63/GPT/pyfzf5WHP4f+hH937oZfbVrdOLwFLasQt4iK0p4M3iOCWzBxA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script><script>
// Perbaikan: Menggunakan let untuk mendeklarasikan variabel
document.addEventListener('DOMContentLoaded', function() {
    // Untuk Soal Cerita
    document.getElementById('tambah-soal-cerita').addEventListener('click', function() {
        const container = document.getElementById('soal-cerita-container');
        const newGroup = container.firstElementChild.cloneNode(true);
        newGroup.querySelectorAll('input, textarea').forEach(input => input.value = '');
        container.appendChild(newGroup);
    });

    // Untuk Soal Percakapan
    document.getElementById('tambah-soal-percakapan').addEventListener('click', function() {
        const container = document.getElementById('soal-percakapan-container');
        const newGroup = container.firstElementChild.cloneNode(true);
        newGroup.querySelectorAll('input, textarea').forEach(input => input.value = '');
        container.appendChild(newGroup);
    });
});
</script>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/5.0.9/tinymce.min.js" 
integrity="sha512-zdq7KjR1iJyOM1MnKscySK8KUHbPIl63/GPT/pyfzf5WHP4f+hH937oZfbVrdOLwFLasQt4iK0p4M3iOCWzBxA==" 
crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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