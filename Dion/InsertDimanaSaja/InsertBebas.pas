program InsertBebas;
uses crt;
type
    point = ^node;
    mahasiswa = record
    nim : string;
    nama: string;
    end;

    node = record
    info: mahasiswa;
    next: point;
    end;

var
    maha:mahasiswa;
    i, jumlah:integer;
    awal, akhir, bantu, baru: point;

procedure create;
begin
awal:=nil;
akhir:=awal;
end;

function input: mahasiswa;
begin
writeln;
write('Masukan Nim : '); readln(maha.nim);
write('Masukan Nama : ');readln(maha.nama);
writeln('==============================');
input:=maha;
end;

procedure addEveryWhere;
var 
awalnya, posisinya :integer;
begin
            new(baru);
            baru^.info := input();
            write('Masukan Posisi Ke: '); readln(posisinya);
  
end;

procedure traversal;
begin
if(awal = nil) then
    begin
    writeln('Maaf Data Kosong');
    end
    else

    begin
    bantu:= awal;
    while(bantu <> nil) do
    begin
        writeln('===========================');
        writeln(bantu^.info.nim);
        writeln(bantu^.info.nama);
        writeln('===========================');
        
        bantu := bantu^.next;
    end;

    end;

    readln;
end;


begin

write('Masukan Jumlah Data : '); readln(jumlah);
for i:=1 to jumlah do
begin
addEveryWhere;
end;
traversal;
    
    readln;
end.