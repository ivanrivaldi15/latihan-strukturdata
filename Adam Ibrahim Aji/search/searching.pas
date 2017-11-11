program Searching;
uses crt;
type
   point = ^node;
   mahasiswa =
   record
      nama : string;
      umur : integer;
   end;

   node =
   record
      info : mahasiswa;
      next: point;
   end;

var
siswa : mahasiswa;
jumlah, i : integer;
baru,awal,akhir,bantu : point;

procedure create;
begin
  awal:=nil;
  akhir:=nil;
end;

function input():mahasiswa ;
begin
  write('Masukan Nama Mahasiswa : '); readln(siswa.nama);
  write('Masukan Umur Mahasiswa : '); readln(siswa.umur);
  input := siswa;
  end;

procedure AddLast;
begin
  new(baru);
  baru^.next:=nil;
  baru^.info:=input();

  if(awal=nil)
    then
      begin
        awal:=baru ;
      end
    else
    begin
      akhir^.next:= baru;
    end;

akhir:=baru;
end;


procedure traversal;
var
  nama:string;
begin
  if(awal=nil)then
     writeln('maaf,linked list kosong')
   else
   begin
     bantu:=awal;
   end;
   write('Masukan Nama yang Anda Cari : '); readln(nama);

   while(bantu <> nil) do
      begin
         if(bantu^.info.nama=nama)
            then
              begin
                writeln('Nama Ditemukan');
              end
              else
                writeln('Nama Tidak Ditemukan');
         writeln('Nama : ',bantu^.info.nama);
         writeln('Umur : ',bantu^.info.umur,' Tahun');
         writeln;
         bantu:=bantu^.next;
      end;
end;

begin
  write('Masukan Jumlah data : '); readln(jumlah);
    for i := 1 to jumlah do
      begin
        writeln;
        AddLast;
      end;
      writeln;
      traversal;
      readln;
end.
