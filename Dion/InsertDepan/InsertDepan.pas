program InsertDepan;
uses crt;

type
    point=^node;

    mahasiswa = record
    nim: string;
    nama: string;
  end;

    node = record
    info: mahasiswa;
    next: point;
    end;

var
dataMaha : mahasiswa;
jumlah, i:integer;
awal, akhir, bantu, baru : point;

procedure start;
begin
awal := nil;
akhir := nil;
end;

function input(): mahasiswa;
begin
write('Msukan Nim : '); readln(dataMaha.nim);
write('Maskun Nama : ');readln(dataMaha.nama);
writeln('===========================');
input:=dataMaha;
end;

procedure addFirst;
begin
new(baru);
baru^.info := input();

if(awal = nil) then
    begin
    baru^.next := nil;
    akhir := baru;
end
else
begin
baru^.next := awal;

end;
awal := baru;
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
        writeln(bantu^.info.nim);
        writeln(bantu^.info.nama);
        writeln;
        writeln('===========================');
        
        bantu := bantu^.next;
    end;

    end;

    readln;
end;

begin

write('Masukan Jumlah Data : '); readln(jumlah);

for i:= 1 to jumlah do
begin
addFirst;

end;
traversal;

readln;
end.