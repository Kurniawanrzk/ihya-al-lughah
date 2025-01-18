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
        <p class="mb-4">Data Konten latihan_qiraah</p>

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
                           @if(count($latihan_qiraah) > 0)
                            @foreach ($latihan_qiraah as $latihan_qiraah)
                             <tr>
                                <td>{{ $latihan_qiraah['urutan_bab'] }}</td>
                                <td>{{ $latihan_qiraah['nama_latihan'] }}</td>
                                <td style="width: 40%">{{ $latihan_qiraah['deskripsi'] }}</td>
                                <td>
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#thumbnailModal{{ $latihan_qiraah['id'] }}">
                                        View Thumbnail
                                    </button>
                                    
                                    <!-- Thumbnail Modal -->
                                    <div class="modal fade" id="thumbnailModal{{ $latihan_qiraah['id'] }}" tabindex="-1" role="dialog" aria-labelledby="thumbnailModalLabel{{ $latihan_qiraah['id'] }}" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="thumbnailModalLabel{{ $latihan_qiraah['id'] }}">Thumbnail Preview</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-center">
                                                    <img src="{{$latihan_qiraah['thumbnail']}}" alt="Thumbnail" class="img-fluid">
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>{{ $latihan_qiraah['keys'] }}</td>
                               <!-- Modify the action buttons in the table -->
                                <td class="">
                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#detailModal{{ $latihan_qiraah['id'] }}">Detail</button>
                                    <a style="text-decoration:none;color:white;" href="{{ Route('ubah_latihan_qiraah', $latihan_qiraah['id']) }}"> <button class="btn btn-success">Ubah</button></a>
                                    <form id="deletelatihan_qiraah{{$latihan_qiraah['id']}}" method="POST" action="{{ Route('hapus_latihan_qiraah', $latihan_qiraah['id']) }}" class="d-inline">
                                        @csrf
                                        @method("DELETE")
                                        <button type="button" onclick="confirmDelete('Yakin ingin menghapus?', 'Hapus', 'Kembali', 'deletelatihan_qiraah{{$latihan_qiraah['id']}}')" class="btn btn-danger">Hapus</button>
                                    </form>
                                    <button type="button" class="btn btn-primary mt-1" data-target="#isiSoalJawabanModal{{ $latihan_qiraah['id'] }}"  data-toggle="modal">Isi Soal Jawaban</button>

                                    <div class="modal fade" id="isiSoalJawabanModal{{ $latihan_qiraah['id'] }}" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel{{ $latihan_qiraah['id'] }}" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable modal-xl">
                                            <div class="modal-content">
                                                <div class="modal-header bg-primary text-white">
                                                    <h5 class="modal-title" id="detailModalLabel{{ $latihan_qiraah['id'] }}">
                                                        <i class="fas fa-book-open mr-2"></i>Isi Soal Jawaban
                                                    </h5>
                                                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="{{ Route("soal_latihan_tambah_post", $latihan_qiraah['id']) }}" method="POST" enctype="multipart/form-data">
                                                        @csrf
                                                        @method("POST")
                                                        <div>
                                                            <label for="">Upload CSV soal latihan</label>
    
                                                            <input type="file" name="soal_latihan" class="form-control">
                                                        </div>
                                                        <br>
                                                        <div>
                                                            <label for="">Upload CSV soal benar salah</label>
    
                                                            <input type="file" name="benar_salah" class="form-control">
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
                                    <div class="modal fade" id="detailModal{{ $latihan_qiraah['id'] }}" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel{{ $latihan_qiraah['id'] }}" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable modal-xl">
                                            <div class="modal-content">
                                                <div class="modal-header bg-primary text-white">
                                                    <h5 class="modal-title" id="detailModalLabel{{ $latihan_qiraah['id'] }}">
                                                        <i class="fas fa-book-open mr-2"></i>Detail Latihan Qira'ah
                                                    </h5>
                                                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <h3>Latihan Soal {{ count($latihan_qiraah['benar_salah']) < 1 ? "(Belum ada Soal)" : "" }}</h3>
                                                    <div class="d-flex gap-3 m-3">
                                                        @if(count($latihan_qiraah['soal_jawaban']) > 0 )
                                                        <form class="me-4" action="{{ Route("hapus_soal_qiraah") }}" method="POST">
                                                            @method("POST")
                                                            @csrf
                                                            @foreach($latihan_qiraah['soal_jawaban'] as $sj)
                                                            <input type="hidden" name="id_soal_lat[]" value="{{ $sj['id'] }}">
                                                            @endforeach
                                                            
                                                            <button class="btn btn-danger">Hapus Semua Latihan Soal</button>
                                                        </form>
                                                        @endif
<hr>
                                                        @if(count($latihan_qiraah['benar_salah']) > 0 )

                                                        <form action="{{ Route("hapus_benar_salah") }}" method="POST">
                                                            @method("POST")
                                                            @csrf
                                                            @foreach($latihan_qiraah['benar_salah'] as $sj)
                                                            <input type="hidden" name="id_benar_salah[]" value="{{ $sj['id'] }}">
                                                            @endforeach
                                                            
                                                            <button class="btn btn-danger">Hapus Semua Benar Salah</button>
                                                        </form>
                                                        @endif

                                                    </div>

                                                    <!-- Question Container -->
                                                    @foreach($latihan_qiraah['soal_jawaban'] as $sj)
                                                    <div class="card mb-4 shadow-sm">
                                                        <div class="card-header bg-light">
                                                            <h6 class="mb-0">
                                                                <span class="badge badge-primary mr-2">Soal {{ $sj['nomor'] }}</span>
                                                                {{ $sj['pertanyaan'] }}
                                                            </h6>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <div class="list-group">
                                                                        @foreach($sj['jawaban'] as $index => $j)
                                                                        <div class="list-group-item list-group-item-action mb-2 border rounded
                                                                            {{ $j['id'] == $sj['id_jawaban_benar'] ? 'list-group-item-success' : 'list-group-item-danger' }}">
                                                                            <div class="d-flex align-items-center">
                                                                                <span class="badge {{ $j['id'] == $sj['id_jawaban_benar'] ? 'badge-success' : 'badge-danger' }} mr-3">
                                                                                    {{ $jawaban_pilihan[$index] }}
                                                                                </span>
                                                                                <span class="flex-grow-1">{{ $j['jawaban'] }}</span>
                                                                                @if($j['id'] == $sj['id_jawaban_benar'])
                                                                                <span class="badge badge-success ml-2">
                                                                                    <i class="fas fa-check"></i> Jawaban Benar
                                                                                </span>
                                                                                @endif
                                                                            </div>
                                                                        </div>
                                                                        @endforeach
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    @endforeach

                                                    <h3>Soal Benar Salah {{ count($latihan_qiraah['benar_salah']) < 1 ? "(Belum ada Soal)" : "" }}</h3>
                                                    @foreach($latihan_qiraah['benar_salah'] as $sj)
                                                    <div class="card mb-4 shadow-sm">
                                                        <div class="card-header" 
                                                        style="background-color:{{ $sj['benar'] ? "#AAEBD3": "#F8CCC8" }}">
                                                            <h6 class="mb-0">
                                                                <span class="badge badge-primary mr-2">Soal {{ $sj['nomor'] }}</span>
                                                                {{ $sj['pertanyaan'] }}
                                                            </h6>
                                                        </div>
                                                        
                                                    </div>
                                                    @endforeach
                                                </div>
                                                <div class="modal-footer bg-light">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                        <i class="fas fa-times mr-1"></i>Tutup
                                                    </button>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/5.0.9/tinymce.min.js" integrity="sha512-zdq7KjR1iJyOM1MnKscySK8KUHbPIl63/GPT/pyfzf5WHP4f+hH937oZfbVrdOLwFLasQt4iK0p4M3iOCWzBxA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script><script>
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