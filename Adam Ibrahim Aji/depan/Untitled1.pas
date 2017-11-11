program InsertDepan;
uses crt;
type
   point = ^node;
   mahasiswa =
   record
      name : string;
      umur : integer;
   end;

   node =
   record
      info: mahasiswa;
      next: point;
   end;

var
siswa : mahasiswa;
jumlah, i : integer;
baru,awal,akhir,bantu : point;

procedure create;
begin
  awal :=nil;
  akhir:=nil;
end;

function input():mahasiswa ;
begin
  write('Masukan Nama Mahasiswa : '); readln(siswa.name);
  write('Masukan Umur Mahasiswa : '); readln(siswa.umur);
  input := siswa;
  end;

procedure Addfirst;
begin
  new(baru);
  baru^.info:=input();

  if(awal=nil)
    then
      begin
        awal^.next:=baru;
        baru:=awal ;
      end
    else
    begin
      baru^.next:= awal;
    end;

awal:=baru;
end;


procedure traversal;
begin
  if(awal=nil)then
     writeln('maaf,linked list kosong')
   else
   begin
     bantu:=awal;
   end;
   write('Masukan Nama Yang Anda Cari : ');readln(name);
   while(bantu <> nil) do
      begin
         writeln('Nama : ',bantu^.info.name);
         writeln('Umur : ',bantu^.info.umur,' Tahun');
         writeln;
         bantu:=bantu^.next;
      end;
end;

begin
  write('Masukan Jumlah data    : '); readln(jumlah);
    for i := 1 to jumlah do
      begin
        writeln;
        Addfirst;
      end;
      writeln;
      traversal;
      readln;
end.
