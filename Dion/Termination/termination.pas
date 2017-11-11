program termination;
uses crt;

type
point = ^node;
mahasiswa = record
nim :string;
nama: string;
end;

node = record
info : mahasiswa;
next: point;
end;

var
maha:mahasiswa;
i, jumlah, pilihan :integer;
awal, akhir, baru, bantu:point;

procedure create;
begin
awal:=nil;
akhir:=awal;
end;

function input() : mahasiswa;
begin

    write('Masukan Nim : ');readln(maha.nim);
    write('Masukan Nama : ');readln(maha.nama);
    writeln('=====================');
    input:=maha;
end;

procedure addLast;
begin
    new(baru);
     baru^.next := nil;
     baru^.info := input();
    if(awal = nil) then
    begin
    awal := baru;
    
    end
    else
    begin       
        akhir^.next := baru;
    end;
    akhir := baru;
end;

procedure deleteFirst;
begin
    if awal=nil then
    begin
        writeln('Maaf, Data Kosong');
    end
    else
    begin
        if awal=akhir then 
        begin
            dispose(awal);
            awal:=nil;
            akhir:=nil;
        end
        else
        begin
            bantu:=awal;
            awal:=awal^.next;
            dec(bantu);
        end;
    end;
end;


procedure travelsal;
begin
    bantu:= awal;
    if(bantu = nil) then
    begin
    writeln('Data Telah Kosong !!!!!!!');
    end
    else
    begin
    while(bantu <> nil) do
    begin
        writeln;
        writeln(bantu^.info.nim);
        writeln(bantu^.info.nama);
        writeln('===========================');
        
        bantu := bantu^.next;
    end;
    end;
    readln;
end;

procedure termination;
begin
    while awal<>nil do
    deleteFirst;
end;

begin
write('Masukan Jumlah data : ');readln(jumlah);
for i:= 1 to jumlah do 
begin
addLast;
end;
writeln;
write('Ingin Menghapus data ? ');
writeln('1. YA \n 2. Tidak'); readln(pilihan);
if(pilihan = 1) then
begin
termination;
travelsal;
end
else
begin
travelsal;
end;

    
    readln;
end.