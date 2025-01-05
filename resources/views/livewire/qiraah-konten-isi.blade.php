<div>
    <div class="card w-50 mx-auto mt-5 bg-primary p-4">
        <h5 style="color: white"></h5>
        <div  class="row row-cols-1 row-cols-sm-2 row-cols-md-4 justify-content-center">
            @php
            $end_isi;
            $isi_konten_id;
            @endphp
            @foreach($isi_konten as $ik)
            @php
            $end_isi = $ik->id;
            $isi_konten_id = $ik->id_konten_qiraah;
            @endphp
                <div class="col w-auto bg-light m-1 rounded pe-auto position-relative" style="transition:ease-in-out 2000ms;">
                    <div class="text-center">
                        <div class="">
                            <img width="500" height="500" class="m-1 border rounded" src="{{ $ik->gambar }}" alt="thumbnail qiraah materi">
                        </div>
                        <div class="d-flex justify-content-around">
                            <span class="fs-2 fw-bold d-block m-2">{{ $ik->kosakata }}</span>
                            <button class="btn" onclick="responsiveVoice.speak('{{ $ik->kosakata }}', 'Arabic Female')"><i class="fs-1 fa fa-volume-up text-dark" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <div>
            {{ $isi_konten->links() }}
            @if($end_isi == App\Models\KontenIsiQiraah::where("id_konten_qiraah", $isi_konten_id)->get()->last()->id)
            <center>
                <form method="post" action="{{ Route("post_qiraah_attempt", $isi_konten_id) }}">
                    @csrf
                    @method('POST')
                    <button type="submit" class="btn btn-light text-primary">Submit</button>
                </form>
            </center>
            @endif
        </div>
        
    </div>
 
</div>

